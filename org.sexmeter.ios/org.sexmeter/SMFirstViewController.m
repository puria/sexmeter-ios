//
//  SMFirstViewController.m
//  org.sexmeter
//
//  Created by Puria Nafisi Azizi on 11/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SMFirstViewController.h"

@implementation SMFirstViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    motionManager = [[CMMotionManager alloc] init];
    motionManager.showsDeviceMovementDisplay = YES;
    motionManager.deviceMotionUpdateInterval = 1.0/60.0;    
    
    CMDeviceMotionHandler  motionHandler = ^ (CMDeviceMotion *motion, NSError *error) {
        CMAttitude *a = motionManager.deviceMotion.attitude;
        NSLog([NSString stringWithFormat:@"%f      %f         %f",a.pitch, a.roll,a.yaw]);
        NSLog([NSString stringWithFormat:@"%f       %f      %f", motion.attitude.pitch, motion.attitude.roll, motion.attitude.yaw]);
    };
    
    [motionManager startDeviceMotionUpdatesUsingReferenceFrame:CMAttitudeReferenceFrameXTrueNorthZVertical toQueue:[NSOperationQueue currentQueue] withHandler:motionHandler];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
