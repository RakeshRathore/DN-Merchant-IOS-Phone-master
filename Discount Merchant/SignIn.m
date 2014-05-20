//
//  SignIn.m
//  Discount Merchant
//
//  Created by Sajith KG on 27/02/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "SignIn.h"
#import "AppDelegate.h"
#import "RootVC.h"

@interface SignIn ()

@end

@implementation SignIn

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
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(21, 25, 36);
	
    [self.userName setLeftViewImage:@"mail_icon.png"];
    [self.passWord setLeftViewImage:@"password_icon.png"];
    
    [self.loginBtn.titleLabel setFont:LATO_BOLD(18)];
    
    self.topbarView.backgroundColor = RGB(5, 128, 177);
    self.titleLbl.font = LATO_BOLD(20);
    
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:0];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [self.agreeLbl setText:@"By registering, I accept the Terms of Service and Privacy Policy"];
    self.agreeLbl.font = LATO_REGULAR(13);
    self.agreeLbl.textColor = TOPBAR_BG_COLOR;
    
    
    if (![Global isIPhone5]) {
        
        self.logoImageView.frame = CGRectMake(self.logoImageView.frame.origin.x, 79, self.logoImageView.frame.size.width, self.logoImageView.frame.size.height);
        
        self.userName.frame = CGRectMake(self.userName.frame.origin.x, 244, self.userName.frame.size.width, self.userName.frame.size.height);
        
        self.passWord.frame = CGRectMake(self.passWord.frame.origin.x, 325-30, self.passWord.frame.size.width, self.passWord.frame.size.height);
        
        self.loginBtn.frame = CGRectMake(self.loginBtn.frame.origin.x, 400-40, self.loginBtn.frame.size.width, self.loginBtn.frame.size.height);
        
        self.agreeLbl.frame = CGRectMake(self.agreeLbl.frame.origin.x, 503-90, self.agreeLbl.frame.size.width, self.agreeLbl.frame.size.height);
    }
}
- (IBAction)loginTapped:(id)sender
{
     [self LoginCalled];
}
-(void)LoginCalled
{
    if ([_userName.text length]==0  || ![self validateEmailAddress:_userName.text])
    {
        if ([_userName.text length]==0)
            [AppDelegate showWithTitle:appName message:@"Please enter an email."];
        
        else if(![self validateEmailAddress:_userName.text])
            [AppDelegate showWithTitle:appName message:@"Please enter an valid email."];
        
    }
    else if (_passWord.text.length  == 0)
    {
        [AppDelegate showWithTitle:appName message:@"Please enter password."];
        
    }
    else if (_passWord.text.length < 8)
    {
        [AppDelegate showWithTitle:appName message:@"Please enter password having minimum 8 characters."];
        
    }
    else
    {
        
        
        NSString *str1              = [NSString stringWithFormat:@"user[email]=%@&user[password]=%@",_userName.text,_passWord.text];
        
        NSString *str               =   [[NSString alloc]initWithFormat:@"http://discountnow.herokuapp.com/api/users/sign_in.json"];
        
        NSURL *url                  =   [NSURL URLWithString:str];
        
        NSMutableURLRequest *req    = [NSMutableURLRequest requestWithURL:url];
        req.timeoutInterval = 30.0;
        
        [req setHTTPMethod:@"POST"];
        
        NSString *requestBodyString = [NSString stringWithFormat:@"%@",str1];
        
        NSData *requestBody         = [requestBodyString dataUsingEncoding:NSUTF8StringEncoding];
        
        [req setHTTPBody:requestBody];
        
        
        
        NSURLResponse* response;
        NSError* error;
        
        NSData* result = [NSURLConnection sendSynchronousRequest:req returningResponse:&response error:&error];
        
        NSString * rsltStr;
        
        
        rsltStr = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
        
        
        
        NSLog(@"RESULT ##### :: %@",rsltStr);
        
        
        
        if (error)
        {
            NSDictionary *dict  =   [rsltStr JSONValue];
            if([[dict valueForKeyPath:@"success"] boolValue]==0)
                [AppDelegate showWithTitle:appName message:[dict valueForKeyPath:@"message"]];
            else
                [AppDelegate showWithTitle:appName message:@"login Failed"];
            //  [animationImageView removeFromSuperview];
        }
        else
        {
            
            NSDictionary *dict  =   [rsltStr JSONValue];
            
            
            if ([[dict valueForKeyPath:@"success"] boolValue]==1)
            {
                [Global markLoggedIn:@"1"];
                [MY_APP_DELEGATE.rootVC dismissSignInModel];
                // [self performSelector:@selector(loginSuccess) withObject:self afterDelay:1];
            }
            else
            {
                
                [AppDelegate showWithTitle:appName message:@"Error with your login or password"];
                
                
                
            }
        }
        
    }
}
#pragma mark -
#pragma mark Text Field

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==self.userName)
        [Global animateView:self.view: YES: 65];
    
    if(textField==self.passWord)
        [Global animateView:self.view: YES: 75];

    
}
-(void)textFieldDidEndEditing:(UITextField *)textField {
    
    if(textField==self.userName)
        [Global animateView:self.view: NO: 65];
    
    if(textField==self.passWord)
        [Global animateView:self.view: NO: 75];

    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
	
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)validateEmailAddress:(NSString*)yourEmail
{
    //create a regex string which includes all email validation
    NSString *emailRegex    = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    //create predicate with format matching your regex string
    NSPredicate *email  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    //return True if your email address matches the predicate just formed
    return [email evaluateWithObject:yourEmail];
}



@end
