//
//  PatchTime.h
//  ESFullColorBossa
//
//  Created by Enamel Systems on 2014/01/12.
//  Copyright (c) 2014 Enamel Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PatchTime : NSObject
@property (nonatomic) NSTimeInterval time;
+ (PatchTime *)sharedManager;
- (void)update:(NSTimeInterval)timeSinceLastUpdate;
@end
