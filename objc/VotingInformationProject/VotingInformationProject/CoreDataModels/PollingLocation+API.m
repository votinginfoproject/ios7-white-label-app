//
//  PollingLocation+API.m
//  VotingInformationProject
//
//  Created by Andrew Fink on 2/3/14.
//  Copyright (c) 2014 Bennet Huber. All rights reserved.
//

#import "PollingLocation+API.h"

@implementation PollingLocation (API)

- (void) setFromDictionary:(NSDictionary *)attributes
{
    [self setValuesForKeysWithDictionary:attributes];
}

+ (PollingLocation*) getUnique:(NSString*)locationName
{
    PollingLocation *objectInstance = nil;
    if (locationName && [locationName length] > 0) {
        objectInstance = [PollingLocation MR_findFirstByAttribute:@"pollingLocationId" withValue:locationName];
        if (!objectInstance) {
            objectInstance = [PollingLocation MR_createEntity];
            objectInstance.pollingLocationId = locationName;
#if DEBUG
            NSLog(@"PollingLocation: NEW %@", locationName);
#endif
        } else {
#if DEBUG
            NSLog(@"PollingLocation: FETCH CoreData %@", locationName);
#endif
        }
    }
    return objectInstance;
}

@end
