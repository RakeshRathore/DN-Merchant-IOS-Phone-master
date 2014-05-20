//
//  StoreCateCell.m
//  Discount Merchant
//
//  Created by Sajith KG on 19/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "StoreCateCell.h"

@implementation StoreCateCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    self.nameLbl.font = LATO_REGULAR(20);
//    self.nameLbl.backgroundColor = [UIColor lightGrayColor];
    self.nameLbl.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5f];
    self.bgImg.clipsToBounds = YES;
    
    if (selected) {
        self.nameLbl.textColor = [UIColor whiteColor];

//        self.bgImg.image = [UIImage imageNamed:@"storeCate_CellBG_blue.png"];
    }else {
        self.nameLbl.textColor = [UIColor whiteColor];
//        self.bgImg.image = [UIImage imageNamed:@"storeCate_CellBG_dark.png"];
    }
}

@end
