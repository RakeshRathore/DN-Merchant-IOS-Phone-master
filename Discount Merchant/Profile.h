//
//  Profile.h
//  Discount Merchant
//
//  Created by Sajith KG on 14/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Profile : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UIView *topbarView;
@property (strong, nonatomic) IBOutlet UILabel *titleLbl;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (readwrite, nonatomic) BOOL isPushed;

@end
