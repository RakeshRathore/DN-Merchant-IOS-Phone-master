//
//  ListCell.m
//  Discount
//
//  Created by Sajith KG on 21/01/14.
//  Copyright (c) 2014 Justin. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell

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

    // Configure the view for the selected state
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.backgroundColor = RGB(247, 247, 247);
    
    
    self.dateLbl.textColor = RGB(91, 102, 110);
    
    self.backgroundColor = [UIColor clearColor];
    self.itemTitleLbl.font = LATO_BOLD(18);
    self.itemDesLbl.font = LATO_BOLD(12);
    self.priceLbl.font = LATO_BOLD(22);
    self.daysLbl.font = LATO_BOLD(12);
    
    self.dateLbl.font = LATO_REGULAR(14);
    
//    self.priceLbl.layer.cornerRadius = 2;
//    self.priceLbl.clipsToBounds = YES;
    
}

@end
