//
//  PostField.m
//  Discount Merchant
//
//  Created by Sajith KG on 24/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "PostField.h"

@implementation PostField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor=[UIColor whiteColor];
    self.textAlignment=NSTextAlignmentLeft;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    self.textColor = [UIColor blackColor];
    self.font = LATO_REGULAR(16);
    
    self.borderStyle = UITextBorderStyleNone;
}


@end
