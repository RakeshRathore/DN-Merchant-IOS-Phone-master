//
//  Home.h
//  Discount Merchant
//
//  Created by Sajith KG on 27/02/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home : UIViewController

@property (nonatomic, strong) IBOutlet UIView *topbarView,*statusBarBg;

@property (nonatomic, strong) IBOutlet UINavigationController *notificationNavi,*dashboardNavi,*statisticsNavi,*currentDiscountsNavi,*savedDiscountsNavi,*createDiscountsNavi,*storesNavi,*teamNavi,*profileNavi,*scanBarcodeNavi;

- (void) menuChanged:(int) selectedIndex;

@end
