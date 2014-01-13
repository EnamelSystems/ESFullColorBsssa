//
//  PatchTime.m
//  ESFullColorBossa
//
//  Created by Enamel Systems on 2014/01/12.
//  Copyright (c) 2014 Enamel Systems. All rights reserved.
//

#import "PatchTime.h"

@implementation PatchTime

+ (PatchTime *)sharedManager
{
    static PatchTime *sharedSingleton;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedSingleton = [[PatchTime alloc] initSharedInstance];
    });
    
    return sharedSingleton;
}

- (id)initSharedInstance {
    self = [super init];
    if (self) {
        // Initialization singleton.
        _time = 0.0f;
    }
    return self;
}

- (id)init {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (void)update:(NSTimeInterval)timeSinceLastUpdate
{
    _time += timeSinceLastUpdate;
}

@end
