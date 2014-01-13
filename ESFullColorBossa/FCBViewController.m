//
//  FCBViewController.m
//  ESFullColorBossa
//
//  Created by Enamel Systems on 2014/01/11.
//  Copyright (c) 2014 Enamel Systems. All rights reserved.
//

#import "FCBViewController.h"
#import "PatchTime.h"
#import "ColorMixer.h"

// Vertex and color structure.
typedef struct
{
    float Position[3];
} Vertex;

typedef struct
{
    float Color[4];
} Color;

const Vertex gVertices[] = {
    {-1, -1,  0},
    { 1, -1,  0},
    {-1,  0,  0},
    { 1,  0,  0},
    {-1,  1,  0},
    { 1,  1,  0}
};

Color gColors[] = {
    {1, 1, 1, 1},
    {1, 1, 1, 1},
    {1, 1, 1, 1},
    {1, 1, 1, 1},
    {1, 1, 1, 1},
    {1, 1, 1, 1}
};

const GLubyte gIndices[] = {
    0, 1, 2, 3, 4, 5
};


@interface FCBViewController () {
    GLKMatrix4 _modelViewProjectionMatrix;
    GLKMatrix3 _normalMatrix;
    //float _rotation;
}

@property (strong, nonatomic) EAGLContext *context;
@property (strong, nonatomic) GLKBaseEffect *effect;

@property (nonatomic) GLuint vertexBuffer;
@property (nonatomic) GLuint colorBuffer;
@property (nonatomic) GLuint indexBuffer;

@property (nonatomic) PatchTime *patchTime;
@property (nonatomic) Interporation *colorChange;
@property (nonatomic) Interporation *gradColor;

@property (nonatomic) ColorMixer *colorMixer;

- (void)setupGL;
- (void)tearDownGL;

@end

@implementation FCBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.preferredFramesPerSecond = 60;
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];

    if (!self.context) {
        NSLog(@"Failed to create ES context");
    }
    
    GLKView *view = (GLKView *)self.view;
    view.context = self.context;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    
    [self setupGL];
    
    // Allocate patch time.
    _patchTime = [PatchTime sharedManager];
    _colorChange = [[Interporation alloc] initWithDuration:10.0f start:0.0f end:1.0f];
    _colorChange.loopType = kInterporationLoop;
    _colorChange.curveType = kInterporationCurveErf;
    _colorChange.delegate = self;
    _gradColor = [[Interporation alloc] initWithDuration:50.0f start:1.0f end:0.0f];
    _gradColor.loopType = kInterporationMirroredLoop;
    _gradColor.curveType = kInterporationCurveSine;
    
    // Color mixser.
    _colorMixer = [[ColorMixer alloc] init];
    [self durationElapsed];
}

- (void)dealloc
{    
    [self tearDownGL];
    
    if ([EAGLContext currentContext] == self.context) {
        [EAGLContext setCurrentContext:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    if ([self isViewLoaded] && ([[self view] window] == nil)) {
        self.view = nil;
        
        [self tearDownGL];
        
        if ([EAGLContext currentContext] == self.context) {
            [EAGLContext setCurrentContext:nil];
        }
        self.context = nil;
    }

    // Dispose of any resources that can be recreated.
}

- (void)setupGL
{
    [EAGLContext setCurrentContext:self.context];
    
    self.effect = [[GLKBaseEffect alloc] init];
    self.effect.colorMaterialEnabled = YES;
    
    glEnable(GL_DEPTH_TEST);
    
    glGenBuffers(1, &_vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(gVertices), gVertices, GL_STATIC_DRAW);
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), (void *)NULL);
   
    glGenBuffers(1, &_colorBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, _colorBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(gColors), gColors, GL_STATIC_DRAW);
    glEnableVertexAttribArray(GLKVertexAttribColor);
    glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, sizeof(Color), (void *)NULL);
    
    glGenBuffers(1, &_indexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(gIndices), gIndices, GL_STATIC_DRAW);
}

- (void)tearDownGL
{
    [EAGLContext setCurrentContext:self.context];
    
    glDeleteBuffers(1, &_vertexBuffer);
    glDeleteBuffers(1, &_colorBuffer);
    glDeleteBuffers(1, &_indexBuffer);
    
    self.effect = nil;
}

#pragma mark - GLKView and GLKViewController delegate methods

- (void)durationElapsed
{
    NSLog(@"durationElapsed called");
    [_colorMixer changeColor];
    
    NSString *rawString = [[NSString alloc] initWithUTF8String:[_colorMixer colorName]];
    NSString *capitalizedString = [rawString stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[rawString substringToIndex:1] capitalizedString]];
    NSRange range = NSMakeRange(0, capitalizedString.length);
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:capitalizedString
                                                                                attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                                             NSFontAttributeName: [UIFont systemFontOfSize:43]}];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    _textLabel.attributedText = attributedString;
}

- (void)update
{
    //NSLog(@"FPS(%f)", 1.0f / self.timeSinceLastUpdate);

    [_patchTime update:self.timeSinceLastUpdate];
    _textLabel.alpha = [_colorChange result];
    
    // grad and mix
    GLuint grad = [_gradColor result] * 255;
    double mix = 1.0 - [_gradColor result];

    // Fetch RGB color.
    double red = [_colorMixer.colorRed result];
    double green = [_colorMixer.colorGreen result];
    double blue = [_colorMixer.colorBlue result];

    double rBottom = [Interporation resultWithStart:grad end:red current:mix] / 255;
    double gBottom = [Interporation resultWithStart:grad end:green current:mix] / 255;
    double bBottom = [Interporation resultWithStart:grad end:blue current:mix] / 255;

    double rTop = [Interporation resultWithStart:red end:grad current:mix] /255;
    double gTop = [Interporation resultWithStart:green end:grad current:mix] /255;
    double bTop = [Interporation resultWithStart:blue end:grad current:mix] /255;
    
    red /= 255;
    green /= 255;
    blue /= 255;
    
    // Botton color.
    gColors[0].Color[0] = rBottom;
    gColors[0].Color[1] = gBottom;
    gColors[0].Color[2] = bBottom;
    gColors[1].Color[0] = rBottom;
    gColors[1].Color[1] = gBottom;
    gColors[1].Color[2] = bBottom;

    // Middle color.
    gColors[2].Color[0] = red;
    gColors[2].Color[1] = green;
    gColors[2].Color[2] = blue;
    gColors[3].Color[0] = red;
    gColors[3].Color[1] = green;
    gColors[3].Color[2] = blue;

    gColors[4].Color[0] = rTop;
    gColors[4].Color[1] = gTop;
    gColors[4].Color[2] = bTop;
    gColors[5].Color[0] = rTop;
    gColors[5].Color[1] = gTop;
    gColors[5].Color[2] = bTop;

    glBindBuffer(GL_ARRAY_BUFFER, _colorBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(gColors), gColors, GL_STATIC_DRAW);
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClearColor(0.65f, 0.65f, 0.65f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    // Render the object with GLKit
    [self.effect prepareToDraw];
    glDrawElements(GL_TRIANGLE_STRIP, 6, GL_UNSIGNED_BYTE, 0);
}

@end
