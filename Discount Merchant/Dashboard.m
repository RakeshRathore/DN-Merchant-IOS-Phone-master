//
//  Dashboard.m
//  Discount Merchant
//
//  Created by Sajith KG on 04/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "Dashboard.h"
#import "AppDelegate.h"

@interface Dashboard ()

@end

@implementation Dashboard

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.topbarView.backgroundColor = TOPBAR_BG_COLOR;
    self.titleLbl.font = LATO_BOLD(20);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) backBtnCall {
    
    [MY_APP_DELEGATE.rootVC presentMenuViewController];
}

@end
