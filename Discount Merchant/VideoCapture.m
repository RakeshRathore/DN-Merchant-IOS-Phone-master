//
//  VideoCapture.m
//  Discount Merchant
//
//  Created by Boopathi on 28/04/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "VideoCapture.h"
#import "KZCameraView.h"
#import "VideoPreview.h"

@interface VideoCapture () {

    IBOutlet UIButton *saveBtn,*closeBtn;
    KZCameraView *cam;

}

@property (nonatomic, strong) IBOutlet UIView *topbarView;
@property (strong, nonatomic) IBOutlet UILabel *titleLbl;

@end

@implementation VideoCapture

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

- (IBAction) closeBtnCall {
    
    [cam removeFromSuperview];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.topbarView.backgroundColor = TOPBAR_BG_COLOR;
    self.titleLbl.font = LATO_BOLD(18);
    
    saveBtn.titleLabel.font = LATO_REGULAR(16);
    closeBtn.titleLabel.font = LATO_REGULAR(16);
    
    self.view.backgroundColor = RGB(210, 210, 210);
}

- (void) viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    cam = [[KZCameraView alloc]initWithFrame:CGRectMake(0.0, 64.0, self.view.frame.size.width, self.view.frame.size.height - 64.0) withVideoPreviewFrame:CGRectMake(0.0, 0.0, 320.0, 320.0)];
	
    cam.maxDuration = 10.0;
    cam.showCameraSwitch = YES; //Say YES to button to switch between front and back cameras
    //Create "save" button
    //    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(saveVideo:)];
    
    [self.view addSubview:cam];

}

-(IBAction)saveVideo:(id)sender
{
    [cam saveVideoWithCompletionBlock:^(BOOL success) {
        if (success)
        {
            NSLog(@"WILL PUSH NEW CONTROLLER HERE");
            
            [self.navigationController pushViewController:[[VideoPreview alloc] init] animated:YES];
        }
    }];
}

- (void) showVideoRecorder {
    
    [self view];
}




@end
