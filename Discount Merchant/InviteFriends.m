//
//  InviteFriends.m
//  Discount Merchant
//
//  Created by Sajith KG on 24/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "InviteFriends.h"
#import "SocialKit.h"
#import "CreateDiscount.h"
#import "AppDelegate.h"
#import "LeftMenu.h"

@interface InviteFriends () {

    IBOutlet UILabel *happySharingHdr,*msgHdr1,*msgHdr2,*msgLink;
    NSString *shareMessage;
    IBOutlet UIButton *doneBtn;
}

@end

@implementation InviteFriends

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) backBtnCall {
    
    CreateDiscount *createDiscount = (CreateDiscount*)[self.navigationController.viewControllers objectAtIndex:0];
    [createDiscount  performSelector:@selector(showCamera) withObject:nil afterDelay:0.3];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction) doneBtnCall {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    LeftMenu *leftMenu = (LeftMenu*) MY_APP_DELEGATE.rootVC.menuViewController;
    leftMenu.selectedRow = 3;
    [leftMenu.menuTable reloadData];
    [MY_APP_DELEGATE.home menuChanged:(int)3];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.topbarView.backgroundColor = TOPBAR_BG_COLOR;
    self.titleLbl.font = LATO_BOLD(20);
    
    happySharingHdr.font = LATO_REGULAR(22);
    happySharingHdr.textColor = RGB(89, 89, 89);
    
    msgHdr1.font = LATO_REGULAR(14);
    msgHdr1.textColor = RGB(89, 89, 89);
    msgHdr1.text = @"For every friend you invite who joins Discount Now, you'll both get 25 credits";
    
    msgHdr2.font = LATO_REGULAR(14);
    msgHdr2.textColor = RGB(89, 89, 89);
    msgHdr2.text = @"Here's your personal URL:";
    
    msgLink.font = LATO_BOLD(16);
    msgLink.textColor = STATUS_BAR_COLOR;
    msgLink.text = @"http://ispg.in";
    
    shareMessage = [NSString stringWithFormat:@"Join Discount Now using %@ to get 25 more credits",msgLink.text];
    
    doneBtn.titleLabel.font = LATO_REGULAR(16);
    
}

- (IBAction) fbBtnCall {
    
    [[SocialKit sharedSocialKit] setMessage:shareMessage];
    [[SocialKit sharedSocialKit] shareWithFacebook];
}

- (IBAction) twitterBtnCall {
    
    [[SocialKit sharedSocialKit] setMessage:shareMessage];
    [[SocialKit sharedSocialKit] shareWithTwitter];
}

- (IBAction) chatBtnCall {
    
    [[SocialKit sharedSocialKit] setMessage:shareMessage];
    [[SocialKit sharedSocialKit] shareWithMessage];
}

- (IBAction) mailBtnCall {
    
    [[SocialKit sharedSocialKit] setMessage:shareMessage];
    [[SocialKit sharedSocialKit] shareWithMail];
}


@end
