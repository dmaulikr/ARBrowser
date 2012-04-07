//
//  ARVSLogger.h
//  ARBrowser
//
//  Created by Samuel Williams on 30/01/12.
//  Copyright (c) 2012 Orion Transfer Ltd. All rights reserved.
//

#include <UIKit/UIKit.h>
#include <CoreGraphics/CoreGraphics.h>

@interface ARVSLogger : NSObject {
	NSString * _path;
	
	NSFileHandle * _fileHandle;
	
	NSTimer * _syncTimer;
	
	NSUInteger _logCounter;
}

@property(readonly,retain) NSString * path;

+ loggerForDocumentName:(NSString*)name;

- initWithPath:(NSString*)path;
- (void)close;

- (void)logWithFormat:(NSString *)format, ...;

- (void)logImage:(CGImageRef)image withFormat:(NSString *)format, ...;

@end
