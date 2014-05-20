//
//  ViewController.m
//  Discount Merchant
//
//  Created by Sajith KG on 27/02/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "RootVC.h"
#import "AppDelegate.h"
#import "LeftMenu.h"

@interface RootVC ()

@end

@implementation RootVC

- (void)awakeFromNib
{
    [MY_APP_DELEGATE setRootVC:self];
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Home_id"];
    self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftMenu_id"];
    self.view.backgroundColor = RGB(12, 14, 19);
    self.delegate = (LeftMenu *)self.menuViewController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.panFromEdge=YES;
    self.panGestureEnabled=NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    if (![Global checkLoggedIn]) {
        [self showSignInModel];
    }
    
    //[self showSignInModel];
}

- (void) showSignInModel {
    [self performSegueWithIdentifier:@"Model_signInNavi" sender:self];
}

-(void) dismissSignInModel {
    
    [self dismissViewControllerAnimated:YES completion:^(void) {
        
        //[self performSegueWithIdentifier:@"Model_signUpNavi" sender:self];
    }];
}


@end
