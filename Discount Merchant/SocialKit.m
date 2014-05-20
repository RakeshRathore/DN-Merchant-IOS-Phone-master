//
//  ShareKit.m
//  Cary
//
//  Created by Sajith KG on 04/10/13.
//  Copyright (c) 2013 Sajith KG. All rights reserved.
//

#import "SocialKit.h"
#import "AppDelegate.h"

@implementation SocialKit

+ (id)sharedSocialKit {
    
    static SocialKit *sharedMySocialKit = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMySocialKit = [[self alloc] init];
    });
    return sharedMySocialKit;
}

- (void) ShowShareOptions {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Share With"
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:@"Cancel"
                                                    otherButtonTitles:@"Facebook",@"Twitter",@"Mail",nil];
    
    [actionSheet showInView:MY_APP_DELEGATE.rootVC.view];
}

#pragma mark - Action - delegate

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0: // Cancel
        {
            break;
        }
            
        case 1: // Facebook
        {
            [self shareWithFacebook];
            break;
        }
        case 2: // Twitter
        {
            [self shareWithTwitter];
            break;
        }
            
        case 3: // Mail
        {
            [self shareWithMail];
            break;
        }
            
        default:
            break;
    }
}

#pragma mark -
#pragma mark SHARE

#pragma mark Facebook

- (void) shareWithFacebook {

    if (SYSTEM_VERSION_GREATER_THAN(@"6.0")) {
        
        SLComposeViewController *fbComposer = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeFacebook];
        
       [fbComposer setInitialText:self.message];
        
        [fbComposer addImage:self.picture];
        [MY_APP_DELEGATE.rootVC presentViewController:fbComposer animated:YES completion:nil];
        
    }else {
        [Global showErrorWithMessage:@"Please update your OS"];
    }
}


#pragma mark Twitter

- (void) shareWithTwitter {

    if (SYSTEM_VERSION_GREATER_THAN(@"6.0")) {
        
        SLComposeViewController *twitterComposer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        [twitterComposer setInitialText:self.message];
        [twitterComposer addImage:self.picture];
        [MY_APP_DELEGATE.rootVC presentViewController:twitterComposer animated:YES completion:nil];
    }
//    else if (SYSTEM_VERSION_GREATER_THAN(@"5.0")) {
//        
//        TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc] init];
//        
//        [tweetSheet setInitialText:self.message];
//        [tweetSheet addImage:self.picture];
//        
//        [MY_APP_DELEGATE.rootVC presentModalViewController:tweetSheet animated:YES];
//    }
}

#pragma mark Mail

- (void) shareWithMail {

    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    
    if (mailClass != nil)
    {
        if ([mailClass canSendMail])
        {
            [self displayComposerSheet];
        }
        else
        {
            [Global showErrorWithMessage:@"Please Configure your Mail Account"];
        }
    }
    else
    {
        [Global showErrorWithMessage:@"Please Configure your Mail Account"];
    }
}

#pragma mark Mail delegate

-(void)displayComposerSheet  {
    
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    
    [picker setSubject:self.mailSubject];
    
    if ([self.mailToAddress length]) {
        [picker setToRecipients:@[self.mailToAddress]];
    }
    
    [picker setMessageBody:self.message isHTML:NO];
    
    if (self.picture)
        [picker addAttachmentData:[NSData dataWithData:UIImagePNGRepresentation(self.picture)] mimeType:@"image/png" fileName:@"Cary.png"];
    
    
    [MY_APP_DELEGATE.rootVC presentViewController:picker animated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    
    switch (result) {
            
        case MFMailComposeResultCancelled:
            [Loading showErrorWithStatus:@"Mail sending cancelled"];
            break;
        case MFMailComposeResultSaved:
            [Loading showSuccessWithStatus:@"Mail saved in Draft"];
            break;
        case MFMailComposeResultSent:
            [Loading showSuccessWithStatus:@"Mail sent"];
            break;
        case MFMailComposeResultFailed:
            [Loading showErrorWithStatus:@"Mail sending failed"];
            break;
        default:
            break;
    }
    
    [MY_APP_DELEGATE.rootVC dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Message

- (void) shareWithMessage
{
	MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
	if([MFMessageComposeViewController canSendText])
	{
		controller.body = self.message;
		controller.messageComposeDelegate = self;
		[MY_APP_DELEGATE.rootVC presentViewController:controller animated:YES completion:nil];
	}else {
       // [Loading showErrorWithStatus:@"You can not send message"];
    }
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
	switch (result) {
		case MessageComposeResultCancelled:
			[Loading showErrorWithStatus:@"Message sending cancelled"];
			break;
		case MessageComposeResultFailed:
			[Loading showErrorWithStatus:@"Message sending failed"];
			break;
		case MessageComposeResultSent:
            [Loading showSuccessWithStatus:@"Message sent"];
            
			break;
		default:
			break;
	}
    
	[MY_APP_DELEGATE.rootVC dismissViewControllerAnimated:YES completion:nil];
}


@end
