//
//  InboxCell.m
//  SWAP
//
//  Created by Sajith KG on 29/05/13.
//  Copyright (c) 2013 Sajith KG. All rights reserved.
//

#import "SavedDiscountCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation SavedDiscountCell

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
    
   // self.contentView.backgroundColor = STATUS_BAR_COLOR;
    
    self.backgroundColor = [UIColor clearColor];
    
    self.lineImg.backgroundColor = RGB(239, 239, 239);
    
    self.topView.frame = CGRectMake(0, 1.5, 320, 57);
    
    self.itemPic.layer.cornerRadius = 21;
    self.itemPic.clipsToBounds = YES;
    
    self.notifyCountLbl.backgroundColor = STATUS_BAR_COLOR;
    self.notifyCountLbl.layer.cornerRadius = 8;
    self.notifyCountLbl.layer.borderColor = [UIColor whiteColor].CGColor;
    self.notifyCountLbl.layer.borderWidth = 1.0;
    self.notifyCountLbl.clipsToBounds = YES;
    self.notifyCountLbl.font = LATO_REGULAR(8);
    self.notifyCountLbl.textColor = [UIColor whiteColor];
    
    self.itemLbl.font = LATO_REGULAR(14);
    self.itemLbl.textColor = RGB(63, 69, 75);
}

- (void) setStatusColor:(NSString*) colorStr {

    if ([[colorStr lowercaseString] isEqualToString:@"red"]) {
        [self.statusImg setImage:[UIImage imageNamed:@"red_saved.png"]];
    }
    
    if ([[colorStr lowercaseString] isEqualToString:@"green"]) {
        [self.statusImg setImage:[UIImage imageNamed:@"green_saved.png"]];
    }
    
    if ([[colorStr lowercaseString] isEqualToString:@"grey"]) {
        [self.statusImg setImage:[UIImage imageNamed:@"grey_saved.png"]];
    }

}

- (void) showRating:(int) rate {
    
    UIImage *starImgActive = [UIImage imageNamed:@"star_active_saved"];
    UIImage *starImg = [UIImage imageNamed:@"star_saved.png"];
    
    star1.image=starImg;
    star2.image=starImg;
    star3.image=starImg;
    star4.image=starImg;
    star5.image=starImg;
    
    switch (rate) {
        case 1:
            star1.image=starImgActive;
            break;
            
        case 2:
            star1.image=starImgActive;
            star2.image=starImgActive;
            break;
            
        case 3:
            star1.image=starImgActive;
            star2.image=starImgActive;
            star3.image=starImgActive;
            break;
            
        case 4:
            star1.image=starImgActive;
            star2.image=starImgActive;
            star3.image=starImgActive;
            star4.image=starImgActive;
            break;
            
        case 5:
            star1.image=starImgActive;
            star2.image=starImgActive;
            star3.image=starImgActive;
            star4.image=starImgActive;
            star5.image=starImgActive;
            break;
            
        default:
            break;
    }
}





@end
