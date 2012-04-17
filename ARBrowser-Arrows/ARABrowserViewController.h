//
//  ARABrowserViewController.h
//  ARBrowser-Arrows
//
//  Created by Samuel Williams on 25/03/12.
//  Copyright (c) 2012 Samuel Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#import "ARBrowserView.h"
#import "ARAPathController.h"
#import "ARALocalArrow.h"

@interface ARABrowserViewController : UIViewController <EAGLViewDelegate, ARBrowserViewDelegate, CLLocationManagerDelegate> {	
	CLLocationManager * _locationManager;
}

@property(nonatomic,retain) ARALocalArrow * localArrow;
@property(nonatomic,retain) ARAPathController * pathController;
@property(nonatomic,retain,readonly) NSArray * worldPoints;

@end