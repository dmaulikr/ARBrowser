//
//  ARBrowserAppDelegate.m
//  ARBrowser
//
//  Created by Samuel Williams on 5/04/11.
//  Copyright 2011 Samuel Williams. All rights reserved.
//

#import "ARBrowserAppDelegate.h"

#import "ARBrowserViewController.h"
#import "ARBrowserView.h"
#import "ARWorldPoint.h"
#import "ARModel.h"

@implementation ARBrowserAppDelegate

@synthesize window = _window, browserViewController = _browserViewController, mapViewController = _mapViewController, mainViewController = _mainViewController, informationView = _informationView;
@synthesize worldPoints = _worldPoints;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// Set up a dummy list of points
	NSMutableArray * worldPoints = [[NSMutableArray new] retain];
	CLLocationCoordinate2D location;

	// Coffee cup model
	NSString * coffeePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Models/coffee"];
	id<ARRenderable> coffeeCupModel = [ARModel objectModelWithName:@"model" inDirectory:coffeePath];
	id<ARRenderable> billboardModel = [ARModel viewModelWithView:_informationView];
	
	// 2 Derenzy Pl
	ARWorldPoint * derenzy = [ARWorldPoint new];
	location.latitude = -43.516215;
	location.longitude = 172.554560;
	[derenzy setCoordinate:location altitude:EARTH_RADIUS];
	//[derenzy setModel:coffeeCupModel];
	[derenzy setModel:billboardModel];
	
	// This name is used for debugging output.
	[derenzy.metadata setObject:@"2 Derenzy Pl" forKey:@"name"];
	
	// This information is printed out below.
	[derenzy.metadata setObject:@"2 Derenzy Pl" forKey:@"address"];
	[derenzy.metadata setObject:@"Samuel Williams" forKey:@"developer"];
	[worldPoints addObject:derenzy];
		
	// HitLab NZ
	ARWorldPoint * hitlab = [ARWorldPoint new];
	location.latitude = -43.522190;
	location.longitude = 172.583020;
	[hitlab setCoordinate:location altitude:EARTH_RADIUS];
	
	//[hitlab setModel:coffeeCupModel];
	[hitlab setModel:billboardModel];
	
	[hitlab.metadata setObject:@"HITLabNZ" forKey:@"name"];
	[hitlab.metadata setObject:@"University of Canterbury" forKey:@"address"];
	[hitlab.metadata setObject:@"Mark Billinghurst" forKey:@"developer"];
	[worldPoints addObject:hitlab];
	
	// HitLab NZ
	ARWorldPoint * cuteCenter = [ARWorldPoint new];
	location.latitude = 1.29231;
	location.longitude = 103.775769;
	[cuteCenter setCoordinate:location altitude:EARTH_RADIUS];
	[cuteCenter setModel:coffeeCupModel];
	[cuteCenter.metadata setObject:@"Cute Center" forKey:@"name"];
	[cuteCenter.metadata setObject:@"Singapore" forKey:@"address"];
	[cuteCenter.metadata setObject:@"Wang Yuan" forKey:@"developer"];
	[worldPoints addObject:cuteCenter];
	
	[self setWorldPoints:worldPoints];

	// Override point for customization after application launch.
	self.window.rootViewController = self.mainViewController;
	[self.window makeKeyAndVisible];
	
    return YES;
}

- (void) setWorldPoints:(NSArray *)worldPoints
{
	[self willChangeValueForKey:@"worldPoints"];
	
	[_worldPoints release];
	_worldPoints = [worldPoints retain];
	
	[_mapViewController setWorldPoints:_worldPoints];
	[_browserViewController setWorldPoints:_worldPoints];
	
	[self didChangeValueForKey:@"worldPoints"];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	/*
	 Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	 If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	/*
	 Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	/*
	 Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	 */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	/*
	 Called when the application is about to terminate.
	 Save data if appropriate.
	 See also applicationDidEnterBackground:.
	 */
}

- (void)dealloc
{
	[_window release];
	
	[_mainViewController release];
	[_browserViewController release];
	[_mapViewController release];
	
    [super dealloc];
}

@end
