//
//  SignIn.h
//  Discount Merchant
//
//  Created by Sajith KG on 27/02/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileField.h"

@interface SignIn : UIViewController <UITextFieldDelegate>


@property (nonatomic, strong) IBOutlet UIView *topbarView;
@property (strong, nonatomic) IBOutlet UILabel *titleLbl,*agreeLbl;

@property (nonatomic, strong) IBOutlet UIImageView *logoImageView;
@property (nonatomic, strong) IBOutlet ProfileField *userName,*passWord;
@property (nonatomic, strong) IBOutlet UIButton *loginBtn;
- (IBAction)loginTapped:(id)sender;

@end
