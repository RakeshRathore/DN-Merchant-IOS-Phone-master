//
//  PostWhiteView.m
//  Discount Merchant
//
//  Created by Sajith KG on 24/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "PostWhiteView.h"

@implementation PostWhiteView

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
    
    self.border = [CALayer layer];
    self.border.backgroundColor = [UIColor lightGrayColor].CGColor;
    self.border.frame = CGRectMake(0.0,self.frame.size.height-0.5,self.frame.size.width, 0.5);
    [self.layer addSublayer:self.border];
}

- (void) resetBottomLine {
    self.border.frame = CGRectMake(0.0,self.frame.size.height-0.5,self.frame.size.width, 0.5);
}


@end
