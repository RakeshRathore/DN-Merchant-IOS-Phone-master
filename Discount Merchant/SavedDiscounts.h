//
//  SavedDiscounts.h
//  Discount Merchant
//
//  Created by Sajith KG on 04/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SavedDiscounts : UIViewController <UITableViewDataSource, UITableViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) IBOutlet UIView *topbarView;
@property (strong, nonatomic) IBOutlet UILabel *titleLbl;

@property (nonatomic, strong) NSIndexPath *openCellIndexPath;
@property (nonatomic) float openCellLastTX;

@end
