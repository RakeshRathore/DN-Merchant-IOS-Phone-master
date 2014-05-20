//
//  Home.m
//  Discount Merchant
//
//  Created by Sajith KG on 27/02/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "Home.h"
#import "AppDelegate.h"
#import "RootVC.h"
#import "Notifications.h"
#import "CreateDiscount.h"

@interface Home ()

@end

@implementation Home

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
    
    [MY_APP_DELEGATE setHome:self];
	
    self.view.backgroundColor = RGB(244, 243, 237);
    self.topbarView.backgroundColor = TOPBAR_BG_COLOR;
    self.statusBarBg.backgroundColor = STATUS_BAR_COLOR;
    [self.view bringSubviewToFront:self.statusBarBg];
    [self menuChanged:0];
}

- (void) menuChanged:(int) selectedIndex {
    
    DLog(@"%d",selectedIndex);
    
    self.notificationNavi.view.hidden=YES;
    self.dashboardNavi.view.hidden=YES;
    self.statisticsNavi.view.hidden=YES;
    self.currentDiscountsNavi.view.hidden=YES;
    self.savedDiscountsNavi.view.hidden=YES;
    self.createDiscountsNavi.view.hidden=YES;
    self.storesNavi.view.hidden=YES;
    self.teamNavi.view.hidden=YES;
    self.scanBarcodeNavi.view.hidden=YES;
    self.profileNavi.view.hidden=YES;
    
    switch (selectedIndex) {
        case 0: {
            
            if (self.notificationNavi.view.superview==nil) {
                self.notificationNavi = [self.storyboard instantiateViewControllerWithIdentifier:@"notificationNavi"];
                [self.view addSubview:self.notificationNavi.view];
            }
            self.notificationNavi.view.hidden=NO;
            [self.view bringSubviewToFront:self.notificationNavi.view];
        }
            break;
            
        case 1: {
            
            if (self.dashboardNavi.view.superview==nil) {
                self.dashboardNavi = [self.storyboard instantiateViewControllerWithIdentifier:@"dashboardNavi"];
                [self.view addSubview:self.dashboardNavi.view];
            }
            self.dashboardNavi.view.hidden=NO;
            [self.view bringSubviewToFront:self.dashboardNavi.view];
        }
            break;
            
        case 2:{
            if (self.statisticsNavi.view.superview==nil) {
                self.statisticsNavi = [self.storyboard instantiateViewControllerWithIdentifier:@"statisticsNavi"];
                [self.view addSubview:self.statisticsNavi.view];
            }
        }
            self.statisticsNavi.view.hidden=NO;
            [self.view bringSubviewToFront:self.statisticsNavi.view];
            
            break;
        case 3:{
            if (self.currentDiscountsNavi.view.superview==nil) {
                self.currentDiscountsNavi = [self.storyboard instantiateViewControllerWithIdentifier:@"currentDiscountsNavi"];
                [self.view addSubview:self.currentDiscountsNavi.view];
            }
        }
            self.currentDiscountsNavi.view.hidden=NO;
            [self.view bringSubviewToFront:self.currentDiscountsNavi.view];
            break;
            
        case 4:{
            if (self.savedDiscountsNavi.view.superview==nil) {
                self.savedDiscountsNavi = [self.storyboard instantiateViewControllerWithIdentifier:@"savedDiscountsNavi"];
                [self.view addSubview:self.savedDiscountsNavi.view];
            }
        }
            self.savedDiscountsNavi.view.hidden=NO;
            [self.view bringSubviewToFront:self.savedDiscountsNavi.view];
            break;
            
//        case 5:{
//            if (self.createDiscountsNavi.view.superview==nil) {
//                self.createDiscountsNavi = [self.storyboard instantiateViewControllerWithIdentifier:@"createDiscountsNavi"];
//                [self.view addSubview:self.createDiscountsNavi.view];
//            }
//        }
//            self.createDiscountsNavi.view.hidden=NO;
//            [self.view bringSubviewToFront:self.createDiscountsNavi.view];
//            
//            if (self.createDiscountsNavi.viewControllers.count==1) {
//                CreateDiscount *createDiscount = (CreateDiscount*)[self.createDiscountsNavi.viewControllers objectAtIndex:0];
//                [createDiscount showCamera];
//            }
//            
//            break;
            
        case 5:{
            if (self.createDiscountsNavi.view.superview==nil) {
                self.createDiscountsNavi = [self.storyboard instantiateViewControllerWithIdentifier:@"createDiscountsNavi2"];
                [self.view addSubview:self.createDiscountsNavi.view];
            }
        }
            self.createDiscountsNavi.view.hidden=NO;
            [self.view bringSubviewToFront:self.createDiscountsNavi.view];
            
            if (self.createDiscountsNavi.viewControllers.count==1) {
//                CreateDiscount *createDiscount = (CreateDiscount*)[self.createDiscountsNavi.viewControllers objectAtIndex:0];
//                [createDiscount showCamera];
            }
            
            break;

            
        case 6:{
            if (self.storesNavi.view.superview==nil) {
                self.storesNavi = [self.storyboard instantiateViewControllerWithIdentifier:@"storesNavi"];
                [self.view addSubview:self.storesNavi.view];
            }
        }
            self.storesNavi.view.hidden=NO;
            [self.view bringSubviewToFront:self.storesNavi.view];
            break;
            
        case 7:{
            if (self.teamNavi.view.superview==nil) {
                self.teamNavi = [self.storyboard instantiateViewControllerWithIdentifier:@"teamNavi"];
                [self.view addSubview:self.teamNavi.view];
            }
        }
            self.teamNavi.view.hidden=NO;
            [self.view bringSubviewToFront:self.teamNavi.view];
            break;
            
        case 8:{
            if (self.scanBarcodeNavi.view.superview==nil) {
                self.scanBarcodeNavi = [self.storyboard instantiateViewControllerWithIdentifier:@"scanBarcodeNavi"];
                [self.view addSubview:self.scanBarcodeNavi.view];
            }
        }
            self.scanBarcodeNavi.view.hidden=NO;
            [self.view bringSubviewToFront:self.scanBarcodeNavi.view];
            break;
            
        default:{
            if (self.profileNavi.view.superview==nil) {
                self.profileNavi = [self.storyboard instantiateViewControllerWithIdentifier:@"profileNavi"];
                [self.view addSubview:self.profileNavi.view];
            }
        }
            self.profileNavi.view.hidden=NO;
            [self.view bringSubviewToFront:self.profileNavi.view];
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
