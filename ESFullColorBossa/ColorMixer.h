//
//  ColorMixer.h
//  ESFullColorBossa
//
//  Created by Enamel Systems on 2014/01/12.
//  Copyright (c) 2014 Enamel Systems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Interporation.h"

@interface ColorMixer : NSObject
@property (nonatomic) Interporation *colorRed;
@property (nonatomic) Interporation *colorGreen;
@property (nonatomic) Interporation *colorBlue;
- (void)changeColor;
- (char *)colorName;
@end
