//
//  AppDelegate.h
//  Discount Merchant
//
//  Created by Sajith KG on 27/02/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootVC.h"
#import "Home.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) Home *home;
@property (strong, nonatomic) RootVC *rootVC;

- (void) showDevelopmentMessage ;
+(void)showWithTitle:(NSString *)title message:(NSString *)msg;
- (NSString*) getVideoDirectory;
- (NSString*) getVideoDirectoryPath;

@end
