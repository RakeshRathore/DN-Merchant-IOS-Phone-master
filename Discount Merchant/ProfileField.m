//
//  ProfileField.m
//  Federal
//
//  Created by Sajith KG on 19/08/13.
//  Copyright (c) 2013 Sajith KG. All rights reserved.
//

#import "ProfileField.h"
#import <QuartzCore/QuartzCore.h>

@implementation ProfileField

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
    
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    self.textColor = [UIColor whiteColor];
    self.font = LATO_REGULAR(16);
    [self setLeftViewMode: UITextFieldViewModeAlways];
    
    CALayer *border = [CALayer layer];
    border.borderColor = TOPBAR_BG_COLOR.CGColor;
    border.borderWidth = 0.3;
    border.frame = CGRectMake(0,self.frame.size.height-1,self.frame.size.width, 1);
    [self.layer addSublayer:border];
}

- (CGRect)textRectForBounds:(CGRect)bounds{
    
//    DLog(@"%@",NSStringFromCGRect(bounds));
    return CGRectMake(bounds.origin.x
                      +45, bounds.origin.y ,
                      bounds.size.width - 30, bounds.size.height);

}

- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    
//    DLog(@"%@",NSStringFromCGRect(bounds));
    
    return CGRectMake(bounds.origin.x
                      +45, bounds.origin.y ,
                      bounds.size.width - 50, bounds.size.height);
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds {
    
    return CGRectMake(bounds.origin.x+7
                      ,bounds.origin.y,
                      20, bounds.size.height);
    
}

- (CGRect)editingRectForBounds:(CGRect)bounds{
    return [self textRectForBounds:bounds];
}

- (void) drawPlaceholderInRect:(CGRect)rect {
    
    [[UIColor lightGrayColor] setFill];
    
    CGRect placeholderRect = CGRectMake(rect.origin.x, (rect.size.height- self.font.pointSize)/2, rect.size.width, self.font.pointSize); //to solve ios 7 issue
    
    [[self placeholder] drawInRect:placeholderRect withFont:LATO_REGULAR(16)];
    
//    NSDictionary *attributes = @{ NSFontAttributeName: LATO_REGULAR(11)};
    
//    if ([[self placeholder] respondsToSelector:@selector(drawInRect:withAttributes:)]) {
//        [[self placeholder] drawInRect:rect withAttributes:attributes];
//    }else {
//        
//         [[self placeholder] drawInRect:rect withFont:LATO_REGULAR(11)];
//    }
    
}

- (void) setLeftViewImage:(NSString*) name {
    
    UIImageView *leftView = [[UIImageView  alloc] initWithImage:[UIImage imageNamed:name]];
    leftView.contentMode = UIViewContentModeCenter;
    [self setLeftView:leftView];
}

@end
