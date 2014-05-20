//
//  UIViewController+TDSemiModalExtension.m
//  TDSemiModal
//
//  Created by Nathan  Reed on 18/10/10.
//  Copyright 2010 Nathan Reed. All rights reserved.
//

#import "UIViewController+TDSemiModalExtension.h"

#define DEGREES_TO_RADIANS(x) (M_PI * (x)/180.0)

@implementation UIViewController (TDSemiModalExtension)

// Use this to show the modal view (pops-up from the bottom)
- (void) presentSemiModalViewController:(TDSemiModalViewController*)vc {

	UIView* modalView = vc.view;
	UIView* coverView = vc.coverView;

	CGPoint middleCenter = self.view.center;
	CGSize offSize = [UIScreen mainScreen].bounds.size;
    
    //NSLog(@"offSize=%@",NSStringFromCGSize(offSize));

	UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];

	CGPoint offScreenCenter = CGPointZero;
    
    float ios7Offset=0;
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7")) {
        ios7Offset = 20;
    }

	if(orientation == UIInterfaceOrientationLandscapeLeft ||
	   orientation == UIInterfaceOrientationLandscapeRight) {
		
		offScreenCenter = CGPointMake(offSize.height / 2.0, offSize.width * 1.2);
		middleCenter = CGPointMake(middleCenter.y, middleCenter.x);
		[modalView setBounds:CGRectMake(0, 0, [Global isIPhone5]?576:480, 300)];
	}
	else {
		offScreenCenter = CGPointMake(offSize.width / 2.0, offSize.height * 1.2);
		[modalView setBounds:CGRectMake(0, 0, 320, [Global isIPhone5]?548+ios7Offset:460+ios7Offset)];
		[coverView setFrame:CGRectMake(0, 0, 320, [Global isIPhone5]?548+ios7Offset:460+ios7Offset)];
        
//        [modalView setBounds:CGRectMake(0, 0, 320, modalView.frame.size.height+[self getIOS7Offfset]];
	}
	
	// we start off-screen
	modalView.center = offScreenCenter;
	 
	coverView.alpha = 0.0f;
	
	[self.view addSubview:coverView];
	[self.view addSubview:modalView];
    
   // NSLog(@"self.view=%@",self.view);
    
	// Show it with a transition effect
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	
	modalView.center = middleCenter;
	coverView.alpha = 0.5;

	[UIView commitAnimations];
}

- (float) getIOS7Offfset {

    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7")) {
        return 20;
    }
    
    return 0;

}

// Use this to slide the semi-modal view back down.
-(void) dismissSemiModalViewController:(TDSemiModalViewController*)vc {
	double animationDelay = 0.5;
	UIView* modalView = vc.view;
	UIView* coverView = vc.coverView;

	CGSize offSize = [UIScreen mainScreen].bounds.size;

	CGPoint offScreenCenter = CGPointZero;
    
	UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
	if(orientation == UIInterfaceOrientationLandscapeLeft || 
			orientation == UIInterfaceOrientationLandscapeRight) {
		offScreenCenter = CGPointMake(offSize.height / 2.0, offSize.width * 1.5);		
	}
	else {
		offScreenCenter = CGPointMake(offSize.width / 2.0, offSize.height * 1.5);
	}

	[UIView beginAnimations:nil context:(__bridge void *) modalView];
	[UIView setAnimationDuration:animationDelay];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(dismissSemiModalViewControllerEnded:finished:context:)];
	modalView.center = offScreenCenter;
	coverView.alpha = 0.0f;
	[UIView commitAnimations];

	[coverView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:animationDelay];
    coverView=nil;

}

- (void) dismissSemiModalViewControllerEnded:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	UIView* modalView = (__bridge UIView*)context;
	[modalView removeFromSuperview];
    modalView=nil;

}

@end
