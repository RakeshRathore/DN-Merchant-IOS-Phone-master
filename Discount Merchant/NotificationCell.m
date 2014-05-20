//
//  NotificationCell.m
//  Discount Merchant
//
//  Created by Sajith KG on 27/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "NotificationCell.h"

@implementation NotificationCell

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

    self.itemPic.layer.cornerRadius=30;
    
    self.timeLbl.font = LATO_REGULAR(13);
    self.timeLbl.textColor = [UIColor lightGrayColor];

}

@end
