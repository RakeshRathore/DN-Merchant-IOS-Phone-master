//
//  PostView.h
//  Discount Merchant
//
//  Created by Sajith KG on 24/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostView : UIViewController <UITextFieldDelegate,UITextViewDelegate>

@property (nonatomic, strong) IBOutlet UIView *topbarView;
@property (strong, nonatomic) IBOutlet UILabel *titleLbl;

- (IBAction)repeatChangeBtnCall:(id)sender;

-(void)selectedItem:(NSMutableArray*)selectedArry;

@end
