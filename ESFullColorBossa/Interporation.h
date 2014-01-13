//
//  Interporation.h
//  ESFullColorBossa
//
//  Created by Enamel Systems on 2014/01/12.
//  Copyright (c) 2014 Enamel Systems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PatchTime.h"

enum InterporationLoopType {
    kInterporationLoopNone     = 0,
    kInterporationLoop         = 1,
    kInterporationMirroredLoop = 2
};

enum InterporationCurveType {
    kInterporationCurveLinear  = 0,
    kInterporationCurveSine    = 1,
    kInterporationCurveErf     = 2
};

@protocol InterporationDelegate <NSObject>
@optional
- (void)durationElapsed;
@end

@interface Interporation : NSObject
@property (nonatomic, weak) id<InterporationDelegate> delegate;
@property (nonatomic) enum InterporationLoopType loopType;
@property (nonatomic) enum InterporationCurveType curveType;

- (id)initWithDuration:(double)duration start:(double)start end:(double)end;
+ (double)resultWithStart:(double)start end:(double)end current:(double)current;
- (double)result;
@end
