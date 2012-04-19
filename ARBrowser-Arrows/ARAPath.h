//
//  ARAPath.h
//  ARBrowser
//
//  Created by Samuel Williams on 25/03/12.
//  Copyright (c) 2012 Samuel Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "ARWorldLocation.h"
#import "ARASegment.h"

typedef struct {
	CLLocationDegrees incomingBearing, outgoingBearing;
	CLLocationDistance distanceFromMidpoint;
} ARAPathBearing;

@interface ARAPath : NSObject

@property(nonatomic,retain) NSArray * points;

/// For each point, we built a set of intermediate segments, this array contains lists of each segment corresponding to each point.
@property(nonatomic,retain) NSArray * segments;

- initWithPoints:(NSArray *)points;

- (ARAPathBearing) calculateBearingForSegment:(NSUInteger)index withinDistance:(float)distance fromLocation:(ARWorldLocation*)location;

- (NSUInteger) calculateNearestSegmentForLocation:(ARWorldLocation *)location;

@end
