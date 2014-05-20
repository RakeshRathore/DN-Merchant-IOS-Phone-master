//
//  Notifications.h
//  Discount Merchant
//
//  Created by Sajith KG on 28/02/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Notifications : UIViewController


@property (nonatomic, strong) IBOutlet UIView *topbarView;
@property (strong, nonatomic) IBOutlet UILabel *titleLbl;

- (void) resetTitle: (NSString*) string;

@end
