//
//  StatListCell.m
//  Discount Merchant
//
//  Created by Sajith KG on 04/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "StatListCell.h"

@implementation StatListCell

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
    
    self.backgroundColor = [UIColor clearColor];
    self.itemTitleLbl.font = LATO_REGULAR(15);
    self.daysLbl.font = LATO_REGULAR(11);
    
    self.itemTitleLbl.textColor = RGB(63, 69, 75);
    self.daysLbl.textColor = RGB(170, 177, 183);
    
    self.itemPic.layer.cornerRadius = 20;
    self.itemPic.clipsToBounds = YES;
    
    self.lineImg.backgroundColor = [UIColor lightGrayColor];
    self.lineImg.frame = CGRectMake(0,60.5,self.frame.size.width, 0.5);
    
    self.statsView.backgroundColor = RGB(36, 163, 210);
    
    self.discountHdr.font = LATO_REGULAR(21);
    self.monthsLbl.font = LATO_REGULAR(11);
    
    [self.noOfRedeemsBtn.titleLabel setFont:LATO_REGULAR(11)];
    
    [self.graphView setBackgroundColor:[UIColor clearColor]];
    [self.graphView setSpacing:10];
    [self.graphView setFill:YES];
    [self.graphView setStrokeColor:[UIColor whiteColor]];
    [self.graphView setZeroLineStrokeColor:[UIColor greenColor]];
    [self.graphView setFillColor:RGB(23, 99, 145)];
    [self.graphView setLineWidth:1];
    [self.graphView setCurvedLines:NO];
    
    [self.xLbl1 setFont:LATO_REGULAR(10)];
    [self.xLbl2 setFont:LATO_REGULAR(10)];
    [self.xLbl3 setFont:LATO_REGULAR(10)];
    [self.xLbl4 setFont:LATO_REGULAR(10)];
    [self.xLbl5 setFont:LATO_REGULAR(10)];
    [self.xLbl6 setFont:LATO_REGULAR(10)];
}

- (void) setClearCell {

    self.lineImg.hidden= NO;
    [self.arrowPic.layer removeAnimationForKey:@"rotationAnimation"]; 

}


- (void) setCellSelected:(BOOL) yes {
    
    self.lineImg.hidden= yes;
    
//    DLog(@"%@",self.arrowPic);
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    if (yes) {
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI];
    }else {
        
        [self.arrowPic.layer removeAnimationForKey:@"rotationAnimation"];
    }
    rotationAnimation.duration = 0.3;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeBoth;
    [self.arrowPic.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    
//    DLog(@"%@",self.arrowPic);
 }

@end
