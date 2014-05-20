//
//  StatListCell.h
//  Discount Merchant
//
//  Created by Sajith KG on 04/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"

@interface StatListCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *itemTitleLbl;
@property (strong, nonatomic) IBOutlet UILabel *daysLbl;
@property (strong, nonatomic) IBOutlet UIImageView *itemPic,*arrowPic,*lineImg;
@property (strong, nonatomic) IBOutlet UIButton *deleteBtn;

@property (strong, nonatomic) IBOutlet UILabel *discountHdr,*monthsLbl;
@property (strong, nonatomic) IBOutlet UIButton *noOfRedeemsBtn;

@property (strong, nonatomic) IBOutlet UIView *statsView;

@property (strong, nonatomic) IBOutlet GraphView *graphView;

@property (strong, nonatomic) IBOutlet UILabel *xLbl1,*xLbl2,*xLbl3,*xLbl4,*xLbl5,*xLbl6;

- (void) setCellSelected:(BOOL) yes;
- (void) setClearCell;


@end
