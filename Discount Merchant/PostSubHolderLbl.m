//
//  PostSubHolderLbl.m
//  Discount Merchant
//
//  Created by Sajith KG on 25/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "PostSubHolderLbl.h"

@implementation PostSubHolderLbl

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
    self.textAlignment=NSTextAlignmentRight;
    self.numberOfLines=1;
    self.font = LATO_REGULAR(16);
    self.textColor = [UIColor grayColor];
}

@end
