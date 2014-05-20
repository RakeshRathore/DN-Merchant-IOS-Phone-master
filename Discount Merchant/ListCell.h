//
//  ListCell.h
//  Discount
//
//  Created by Sajith KG on 21/01/14.
//  Copyright (c) 2014 Justin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *itemTitleLbl;
@property (strong, nonatomic) IBOutlet UILabel *itemDesLbl;
@property (strong, nonatomic) IBOutlet UILabel *priceLbl;
@property (strong, nonatomic) IBOutlet UILabel *dateLbl;
@property (strong, nonatomic) IBOutlet UILabel *daysLbl;
@property (strong, nonatomic) IBOutlet UIImageView *itemPic;

@property (strong, nonatomic) IBOutlet UIImageView *timeImg,*flashImg,*favoriteImg;

@end
