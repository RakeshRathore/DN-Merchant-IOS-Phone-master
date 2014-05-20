//
//  TeamCell.m
//  Discount Merchant
//
//  Created by Sajith KG on 28/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "TeamCell.h"

@implementation TeamCell

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
    
    self.backgroundColor = RGB(233, 236, 239);
    
    self.whiteBG.backgroundColor = [UIColor whiteColor];
    
    CALayer *border = [CALayer layer];
    border.borderColor = RGB(203, 207, 208).CGColor;
    border.borderWidth = 2;
    border.frame = CGRectMake(0,self.whiteBG.frame.size.height-2,self.whiteBG.frame.size.width, 2);
    [self.whiteBG.layer addSublayer:border];
    
    self.itemPic.layer.cornerRadius=2;
    self.itemPic.backgroundColor = RGB(175, 182, 187);
    
    self.storeName.font = LATO_BOLD(16);
    self.storeName.textColor = [UIColor darkGrayColor];
    
    self.lblPosition.font = LATO_REGULAR(14);
    self.lblPosition.textColor = [UIColor darkGrayColor];
    
    self.location.font = LATO_BOLD(14);
    self.location.textColor = STATUS_BAR_COLOR;
    
    self.timeLbl.font = ARIAL(12);
    self.timeLbl.textColor = [UIColor lightGrayColor];
    
}

@end
