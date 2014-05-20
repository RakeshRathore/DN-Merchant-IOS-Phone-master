//
//  VideoPreview.m
//  Discount Merchant
//
//  Created by Boopathi on 29/04/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "VideoPreview.h"
#import "AppDelegate.h"
#import <MediaPlayer/MediaPlayer.h>

@interface VideoPreview () {

    IBOutlet UIButton *deleteBtn,*doneBtn;

}

@property (nonatomic, strong) IBOutlet UIView *topbarView;
@property (strong, nonatomic) IBOutlet UILabel *titleLbl;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;

@end

@implementation VideoPreview

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
    
    self.topbarView.backgroundColor = TOPBAR_BG_COLOR;
    self.titleLbl.font = LATO_BOLD(18);
    
    self.view.backgroundColor = RGB(210, 210, 210);
    
    deleteBtn.titleLabel.font = LATO_REGULAR(16);
    [deleteBtn setTitleColor:RGB(227, 67, 60) forState:0];
    
     NSLog(@"getVideoDirectory Documents directory: %@", [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[MY_APP_DELEGATE getVideoDirectory] error:nil]);  //check document
    
    NSString * docaPathFull = [MY_APP_DELEGATE getVideoDirectoryPath];
    NSURL * docUrl= [NSURL fileURLWithPath: docaPathFull];
    BOOL ex = [[NSFileManager defaultManager] fileExistsAtPath:docaPathFull];
    NSLog(@"file exists: %d, path using docPath: %@",ex, docaPathFull);
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:docUrl];
    self.moviePlayer.shouldAutoplay = YES;
    self.moviePlayer.controlStyle = MPMovieControlStyleEmbedded;
    [self.moviePlayer.view setFrame: CGRectMake(0, 64, 320, 320)];
    [self.moviePlayer prepareToPlay];
    [self.view addSubview: self.moviePlayer.view];
    [self.moviePlayer play];
    
//    [self.moviePlayer requestThumbnailImagesAtTimes:@[@(1.f)]  timeOption:MPMovieTimeOptionNearestKeyFrame];
    

//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleThumbnailImageRequestFinishNotification:) name:MPMoviePlayerThumbnailImageRequestDidFinishNotification object:self.moviePlayer];

}
//
//-(void)handleThumbnailImageRequestFinishNotification:(NSNotification*)note
//{
//    NSDictionary *userinfo = [note userInfo];
//    
//    DLog(@"userinfo=%@",userinfo);
//    
//    NSError* value = [userinfo objectForKey:MPMoviePlayerThumbnailErrorKey];
//    
//    if (value!=nil)
//    {
//        NSLog(@"Error: %@", [value debugDescription]);
//    }
//    else
//    {
//       // _imageView.image = [userinfo valueForKey:MPMoviePlayerThumbnailImageKey];
//    }
//}


- (IBAction) deleteBtnCall {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirm"
                                                    message:@"Are you sure to delete this video?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Delete", nil];
    [alert show];
    alert.delegate=self;
    [alert setTag:1111];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex != alertView.cancelButtonIndex) {
        
        if (alertView.tag==1111) {
            
            if (buttonIndex==1) {
                
                NSError *error;
                
                if ([[NSFileManager defaultManager] fileExistsAtPath:[MY_APP_DELEGATE getVideoDirectoryPath]])	//Does directory exist?
                {
                    if (![[NSFileManager defaultManager] removeItemAtPath:[MY_APP_DELEGATE getVideoDirectoryPath] error:&error])	//Delete it
                    {
                        NSLog(@"Delete directory error: %@", error);
                    }
                }
                
                [self dismissViewControllerAnimated:YES completion:nil];
            }
         }
    }
}

- (IBAction) doneBtnCall {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}






@end
