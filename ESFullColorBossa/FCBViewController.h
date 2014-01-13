//
//  FCBViewController.h
//  ESFullColorBossa
//
//  Created by Enamel Systems on 2014/01/11.
//  Copyright (c) 2014 Enamel Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "Interporation.h"

@interface FCBViewController : GLKViewController <InterporationDelegate>
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end
