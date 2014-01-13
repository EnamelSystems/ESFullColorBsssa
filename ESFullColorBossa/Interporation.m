//
//  Interporation.m
//  ESFullColorBossa
//
//  Created by Enamel Systems on 2014/01/12.
//  Copyright (c) 2014 Enamel Systems. All rights reserved.
//

#import "Interporation.h"

@interface Interporation()
@property (nonatomic) double duration;
@property (nonatomic) double start;
@property (nonatomic) double end;

@property (nonatomic) PatchTime *patchTime;
@property (nonatomic) double startTime;
@property (nonatomic) double diff;
@property (nonatomic) int durationCount;
@end

@implementation Interporation

- (id)initWithDuration:(double)duration start:(double)start end:(double)end
{
    self = [super init];
    if (self) {
        _duration = duration;
        _start = start;
        _end = end;
        _patchTime = [PatchTime sharedManager];
        _startTime = _patchTime.time;
        _loopType = kInterporationLoopNone;
        _curveType = kInterporationCurveLinear;
        
        _diff = end - start;
        _durationCount = 0;
        _delegate = nil;
    }
    return self;
}

- (double)resultLinear:(double)time
{
    // Calcuralte how much progress the time elapsed.
    double progress = fmod(time, _duration) / _duration;
    
    // Linear.
    double diff = _diff * progress;
    if ((_loopType == kInterporationMirroredLoop) && (_durationCount % 2)) {
        diff = _diff * (1 - progress);
    }
    
    // Result.
    return _start + diff;
}

- (double)resultSine:(double)time
{
    // Calcuralte how much progress the time elapsed.
    double progress = fmod(time, _duration) / _duration;
    
    // Radian value for the progress.  Adjusting PI/2 shift.
    double radian = progress * M_PI;
    
    if (_loopType == kInterporationLoop) {
        radian -= M_PI_2;
    } else if (_loopType == kInterporationMirroredLoop) {
        if (_durationCount % 2) {
            radian += M_PI_2;
        } else {
            radian -= M_PI_2;
        }
    }
    
    // Current progress for start to end.
    double diff = _diff * ((sin(radian) + 1) / 2);
    
    // Result.
    return _start + diff;
}

- (double)resultErf:(double)time
{
    double base = 0;

    // Calcuralte how much progress the time elapsed.
    double progress = fmod(time, _duration) / _duration;
    
    // Make the progress to 0.0 <-> 0.5.
    if (progress > 0.5) {
        base = (1.0 - progress);
    } else {
        base = progress;
    }

    base = (base * 10) - 2.5;

    return (erf(base) + 1) / 2;
}

- (double)result
{
    // Get elapsed time.
    double time = _patchTime.time - _startTime;
    
    // Division by duration.
    int durationCount = floor(time / _duration);

    // Delegation call.
    if (_durationCount != durationCount) {
        if ([_delegate respondsToSelector:@selector(durationElapsed)]) {
            [_delegate durationElapsed];
        }
        _durationCount = durationCount;
    }

    // Check loop type.
    if (_loopType == kInterporationLoopNone && _durationCount > 0) {
        return _end;
    }
    
    // Curve type value.
    double result = 0;
    switch (_curveType) {
        case kInterporationCurveLinear:
            result = [self resultLinear:time];
            break;
        case kInterporationCurveSine:
            result = [self resultSine:time];
            break;
        case kInterporationCurveErf:
            result = [self resultErf:time];
            break;
    }
    
    // Return value.
    return result;
}


+ (double)resultWithStart:(double)start end:(double)end current:(double)current
{
    return start + ((end - start) * current);
}

@end
