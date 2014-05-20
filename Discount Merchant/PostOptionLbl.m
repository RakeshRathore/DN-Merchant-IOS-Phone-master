//
//  PostOptionLbl.m
//  Discount Merchant
//
//  Created by Sajith KG on 25/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "PostOptionLbl.h"

@implementation PostOptionLbl

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
    
    self.backgroundColor=[UIColor clearColor];
    self.textAlignment=NSTextAlignmentLeft;
    self.numberOfLines=1;
    self.font = LATO_REGULAR(14);
    self.textColor = [UIColor darkGrayColor];
}

@end
