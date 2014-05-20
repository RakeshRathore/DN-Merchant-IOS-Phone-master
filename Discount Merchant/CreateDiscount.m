//
//  CreateDiscount.m
//  Discount Merchant
//
//  Created by Sajith KG on 04/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "CreateDiscount.h"
#import "AppDelegate.h"
#import "Home.h"
#import "UIImage+fixOrientation.h"
#import "PostView.h"
#import "VideoCapture.h"
#import "VideoPreview.h"

@interface CreateDiscount () {
    
    Home *home;
    
    UINavigationController *videoNavi;

    UIImagePickerController *cameraPicker,*galleryPicker;
    IBOutlet UIView *overlayView;
    
    IBOutlet UIButton *galleryBtn,*cameraBtn,*videoBtn;
    
    IBOutlet UIButton *nextBtn;
    IBOutlet UIButton *picBtn1,*picBtn2,*picBtn3,*picBtn4,*picBtn5;
    
    NSArray *btnArray;
    NSMutableArray *pictureAry;
    
    UIImageView *picPreview;
    UIButton *featureBtn,*deleteBtn,*featureBtnSmall;
    
    NSInteger selectedBtnIndex,featuredIndex;
}

@end

@implementation CreateDiscount

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction) backBtnCall {
    
    [home dismissViewControllerAnimated:NO completion:nil];
    [MY_APP_DELEGATE.rootVC presentMenuViewController];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated {
    
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.topbarView.backgroundColor = TOPBAR_BG_COLOR;
    self.titleLbl.font = LATO_BOLD(20);
    
    selectedBtnIndex = unselectedRow;
    featuredIndex = unselectedRow;
    
    nextBtn.titleLabel.font = LATO_REGULAR(18);
    
    home = (Home*)MY_APP_DELEGATE.rootVC.contentViewController;
    
    picBtn1.layer.borderColor = [UIColor whiteColor].CGColor;
    picBtn1.layer.borderWidth = 1;
    picBtn1.tag=0;
    [picBtn1 addTarget:self action:@selector(previewPictureCall:) forControlEvents:UIControlEventTouchUpInside];
    
    picBtn2.layer.borderColor = [UIColor whiteColor].CGColor;
    picBtn2.layer.borderWidth = 1;
    picBtn2.tag=1;
    [picBtn2 addTarget:self action:@selector(previewPictureCall:) forControlEvents:UIControlEventTouchUpInside];
    
    picBtn3.layer.borderColor = [UIColor whiteColor].CGColor;
    picBtn3.layer.borderWidth = 1;
    picBtn3.tag=2;
    [picBtn3 addTarget:self action:@selector(previewPictureCall:) forControlEvents:UIControlEventTouchUpInside];
    
    picBtn4.layer.borderColor = [UIColor whiteColor].CGColor;
    picBtn4.layer.borderWidth = 1;
    picBtn4.tag=3;
    [picBtn4 addTarget:self action:@selector(previewPictureCall:) forControlEvents:UIControlEventTouchUpInside];
    
    picBtn5.layer.borderColor = [UIColor whiteColor].CGColor;
    picBtn5.layer.borderWidth = 1;
    picBtn5.tag=4;
    [picBtn5 addTarget:self action:@selector(previewPictureCall:) forControlEvents:UIControlEventTouchUpInside];
    
    btnArray = @[picBtn1,picBtn2,picBtn3,picBtn4,picBtn5];
    
    pictureAry = [[NSMutableArray alloc] init];
    
    picPreview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 320, 295)];
    picPreview.userInteractionEnabled=YES;
    
    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [blackView setBackgroundColor:[UIColor blackColor]];
    [picPreview addSubview:blackView];
    blackView.alpha = 0.7;
    
    deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
    [deleteBtn setTitle:@"Delete" forState:0];
    deleteBtn.titleLabel.font = LATO_REGULAR(16);
    [deleteBtn setTitleColor:[UIColor redColor] forState:0];
    [deleteBtn addTarget:self action:@selector(deletePictureCall:) forControlEvents:UIControlEventTouchUpInside];
    [picPreview addSubview:deleteBtn];
    
    UILabel *featured = [[UILabel alloc] initWithFrame:CGRectMake(200, 0, 80, 44)];
    featured.text = @"Featured:";
    featured.textColor = [UIColor whiteColor];
    featured.font = LATO_REGULAR(16);
    [picPreview addSubview:featured];
    
    featureBtn = [[UIButton alloc] initWithFrame:CGRectMake(270, 0, 44, 44)];
    [featureBtn addTarget:self action:@selector(featureBtnCall:) forControlEvents:UIControlEventTouchUpInside];
    [featureBtn setImage:[UIImage imageNamed:@"photo_selected.png"] forState:UIControlStateSelected];
    [featureBtn setImage:[UIImage imageNamed:@"photo_unselected.png"] forState:UIControlStateNormal];
    [picPreview addSubview:featureBtn];
    
    featureBtnSmall = [[UIButton alloc] initWithFrame:CGRectMake(40, 5, 20, 20)];
    [featureBtnSmall setImage:[UIImage imageNamed:@"photo_selected.png"] forState:0];
    
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    DLog(@"viewController=%@",viewController);
    DLog(@"navigationController=%@",navigationController);
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    if (navigationController==galleryPicker) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }else {
         [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
}

- (void) showCamera {
    
    [self view];
    
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        [Global showErrorWithMessage:@"Sorry! No Camera Found !!"];
        return;
    }
    
    if (!cameraPicker) {
        cameraPicker = [[UIImagePickerController alloc] init];
        cameraPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        cameraPicker.showsCameraControls=NO;
        cameraPicker.view.frame = CGRectMake(0, 64, 320, 295);
        cameraPicker.delegate = self;
    }
    
    [self.view addSubview:cameraPicker.view];
}

- (IBAction)nextBtnCall:(id)sender {
    
    PostView *postView = [[PostView alloc] init];
    [self.navigationController pushViewController:postView animated:YES];
}

- (IBAction)cameraBtnCall:(id)sender {
    

    [cameraPicker takePicture];
}

- (IBAction)videoBtnCall:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose your video source"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Import From YouTube",@"Create Your Own",nil];
    
    actionSheet.actionSheetStyle = UIBarStyleBlack;
    actionSheet.tag = 1111;
    [actionSheet showInView:home.view];
    
    return;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Choose your video source"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"YouTube",@"Create Video", nil];
    [alert show];
    

   // [self presentVideoNavi];

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;{
    
    if (buttonIndex != actionSheet.cancelButtonIndex) {
        
        if (actionSheet.tag==1111) {
            
            if (buttonIndex==0) {
                [MY_APP_DELEGATE showDevelopmentMessage];
            }
            
            if (buttonIndex==1) {
                [self presentVideoNavi];
            }
        }
    }
}

- (void) presentVideoNavi {
    
//    NSLog(@"Documents directory: %@", [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] error:nil]);  //check document
//    
//    NSError *error;
//    
//    if ([[NSFileManager defaultManager] fileExistsAtPath:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]])	//Does directory exist?
//    {
//        if (![[NSFileManager defaultManager] removeItemAtPath:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] error:&error])	//Delete it
//        {
//            NSLog(@"Delete directory error: %@", error);
//        }
//    }
//    
//     NSLog(@"Documents directory: %@", [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] error:nil]);  //check document
    
    NSLog(@"getVideoDirectory Documents directory: %@", [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[MY_APP_DELEGATE getVideoDirectory] error:nil]);  //check document
    

	NSString *path = [MY_APP_DELEGATE getVideoDirectoryPath];
	if ([[NSFileManager defaultManager] fileExistsAtPath:path])
	{
        NSLog(@"YES.  Video is there");
        VideoPreview *videoPreview = [[VideoPreview alloc] init];
        videoNavi = [[UINavigationController alloc] initWithRootViewController:videoPreview];
        videoNavi.delegate=self;
        videoNavi.navigationBarHidden=YES;
        [home presentViewController:videoNavi animated:YES completion:nil];
        
        return;
    }
    

    VideoCapture *videoCapture = [[VideoCapture alloc] init];
    videoNavi = [[UINavigationController alloc] initWithRootViewController:videoCapture];
    videoNavi.delegate=self;
    videoNavi.navigationBarHidden=YES;
    
    [home presentViewController:videoNavi animated:YES completion:nil];

}

- (IBAction)galleryBtnCall:(id)sender {
    
    if (!galleryPicker) {
        galleryPicker = [[UIImagePickerController alloc] init];
        galleryPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        galleryPicker.delegate = self;
    }
    
    [home presentViewController:galleryPicker animated:YES completion:nil];
}

#pragma mark Picker delegate

- (void) imagePickerController:(UIImagePickerController *)picker1 didFinishPickingImage:(UIImage *)imageSel editingInfo:(NSDictionary *)editingInfo {
    
     NSLog(@"imageSel.size %@",NSStringFromCGSize(imageSel.size));
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    if (picker1==galleryPicker) {
        [home dismissViewControllerAnimated:YES completion:nil];
    }
    
    UIImage *resizedImage = [Global imageWithImage:[imageSel fixOrientation] scaledToWidth:640];
    NSLog(@"resizedImage.size %@",NSStringFromCGSize(resizedImage.size));
    
    UIImage *croppedImage = [Global getCropImage:CGRectMake(0, 0, 640, 590) imageToCrop:resizedImage];
    NSLog(@"croppedImage.size %@",NSStringFromCGSize(croppedImage.size));
    
    [self setPicture:croppedImage];
    
    //DLog(@"editingInfo=%@",editingInfo);
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker1 {
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    if (picker1==galleryPicker) {
        [home dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark Picture Preview

- (void) previewPictureCall:(UIButton*) sender {
    
    selectedBtnIndex = sender.tag;
    
    if (selectedBtnIndex >= [pictureAry count]) {
        
        if (picPreview.superview != nil) {
            [picPreview removeFromSuperview];
            [self disableCameraGalleryButtons:NO];
        }
        
        return;
    }

    picPreview.image = [sender imageForState:0];
    [self.view addSubview:picPreview];
    [self disableCameraGalleryButtons:YES];
    
    featureBtn.selected = (featuredIndex==selectedBtnIndex);
}

- (void) deletePictureCall:(UIButton*) sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirm"
                                                    message:@"Are you sure to delete this picture?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Delete", nil];
    [alert show];
    [alert setTag:1111];
    
    
 }

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex != alertView.cancelButtonIndex) {
        
        if (alertView.tag==1111) {
            
            if (buttonIndex==1) {
                
                if (featuredIndex == selectedBtnIndex) {
                    featuredIndex = unselectedRow;
                }
                
                [pictureAry removeObjectAtIndex:selectedBtnIndex];
                [picPreview removeFromSuperview];
                [self disableCameraGalleryButtons:NO];
                
                [self setImagesToButtons];
            }
        }
    }
}

- (void) featureBtnCall:(UIButton*) sender {
    
    featuredIndex = unselectedRow;
    
    sender.selected = !sender.isSelected;
    if (sender.selected) {
        featuredIndex = selectedBtnIndex;
    }
    
    [self setImagesToButtons];
}

- (void) setPicture : (UIImage*) img {
    
    if ([pictureAry count] >= 5) {
        [Global showErrorWithMessage:@"Maximum picture count is 5. Please delete any picture to add new picture"];
        return;
    }
    
    [pictureAry addObject:img];
    [self setImagesToButtons];
}

- (void) setImagesToButtons {
    
    if (featureBtnSmall.superview != nil) {
        [featureBtnSmall removeFromSuperview];
    }
    
    for (int i=0; i<[btnArray count]; i++) {
        UIButton *btn = [btnArray objectAtIndex:i];
        [btn setImage:NULL forState:0];
    }
    
    for (int i=0; i<[pictureAry count]; i++) {
        
        UIButton *btn = [btnArray objectAtIndex:i];
        [btn setImage:[pictureAry objectAtIndex:i] forState:0];
        
        if (featuredIndex == i) {
            [btn addSubview:featureBtnSmall];
        }
    }
}

- (void) disableCameraGalleryButtons: (BOOL) disable {

    cameraBtn.enabled = !disable;
    galleryBtn.enabled = !disable;

}



@end
