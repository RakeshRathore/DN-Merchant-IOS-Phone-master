//
//  InboxCell.h
//  SWAP
//
//  Created by Sajith KG on 29/05/13.
//  Copyright (c) 2013 Sajith KG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SavedDiscountCell : UITableViewCell {

    IBOutlet UIImageView *star1,*star2,*star3,*star4,*star5;
}

@property (strong, nonatomic) IBOutlet UIView *topView,*bottomView;
@property (strong, nonatomic) IBOutlet UILabel *itemLbl,*categoryLbl,*notifyCountLbl;
@property (strong, nonatomic) IBOutlet UIImageView *statusImg,*lineImg;


@property (strong, nonatomic) IBOutlet UIImageView *itemPic;

@property (strong, nonatomic) IBOutlet UIButton *tickBtn,*chatBtn,*deleteBtn;

- (void) setStatusColor:(NSString*) colorStr;

- (void) showRating:(int) rate;


@end
