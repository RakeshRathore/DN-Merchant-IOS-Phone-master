//
//  NotificationCell.h
//  Discount Merchant
//
//  Created by Sajith KG on 27/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationCell : UITableViewCell

@property(nonatomic, strong) IBOutlet OHAttributedLabel* messageLbl;
@property(nonatomic, strong) IBOutlet UILabel *timeLbl;
@property(nonatomic, strong) IBOutlet UIImageView *itemPic;

@end
