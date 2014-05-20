//
//  TeamCell.h
//  Discount Merchant
//
//  Created by Sajith KG on 28/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamCell : UITableViewCell

@property(nonatomic, strong) IBOutlet UILabel *storeName,*location,*timeLbl, *lblPosition;
@property(nonatomic, strong) IBOutlet UIImageView *itemPic;
@property(nonatomic, strong) IBOutlet UIView *whiteBG;

@end
