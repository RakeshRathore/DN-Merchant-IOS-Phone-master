//
//  ScanBarCode.m
//  Discount Merchant
//
//  Created by Sajith KG on 01/04/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "ScanBarCode.h"
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>
#define SCREEN_HIEGHT [UIScreen mainScreen ].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen ].bounds.size.width
@interface ScanBarCode () <AVCaptureMetadataOutputObjectsDelegate>{
    
    IBOutlet UIView *topbarView;
    IBOutlet UILabel *titleLbl;
    
    AVCaptureSession *_session;
    AVCaptureDevice *_device;
    AVCaptureDeviceInput *_input;
    AVCaptureMetadataOutput *_output;
    AVCaptureVideoPreviewLayer *_prevLayer;
    
    UIView *_highlightView;
    UILabel *_label;
    
    
    UIImageView *focus1, *focus2, *focus3, *focus4, *imaView;
}

@end

@implementation ScanBarCode
@synthesize viewWithButtons;

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
    
    [MY_APP_DELEGATE.rootVC presentMenuViewController];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
	
    topbarView.backgroundColor = TOPBAR_BG_COLOR;
    titleLbl.font = LATO_BOLD(20);
    imaView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 320, 44)];
    imaView.backgroundColor = [UIColor colorWithRed:0 green:0.56 blue:0.78 alpha:1.0];
    
    
    if([UIScreen mainScreen].bounds.size.height == 480)
    {
        //3.5
        offView.frame = CGRectMake(0, 400, 320, 140);
        viewWithButtons.frame = CGRectMake(0, SCREEN_HIEGHT- 160, SCREEN_WIDTH, 160);
        viewWithButtons.backgroundColor = [UIColor clearColor];
        [self.view addSubview:viewWithButtons];
        
        btnDelete.frame = CGRectMake(20, 30, 20, 20);
        [btnDelete addTarget:self action:@selector(delteClicked) forControlEvents:UIControlEventTouchUpInside];
        [viewWithButtons addSubview:btnDelete];
        
        btnRight.frame = CGRectMake(280, 30, 20, 20);
        [btnRight addTarget:self action:@selector(rightclicked) forControlEvents:UIControlEventTouchUpInside];
        [viewWithButtons addSubview:btnRight];
        
        btnCamera.frame = CGRectMake(120, 0, 80, 80);
        [btnCamera setBackgroundImage:[UIImage imageNamed:@"camera.png"] forState:UIControlStateNormal];
        [btnCamera setBackgroundColor:[UIColor clearColor]];
        [btnCamera addTarget:self action:@selector(cameraClicked) forControlEvents:UIControlEventTouchUpInside];
        [viewWithButtons addSubview:btnCamera];
        
        btnNext.frame = CGRectMake(20, 100, 280, 44);
        [btnNext    addTarget:self action:@selector(nextClicked) forControlEvents:UIControlEventTouchUpInside];
        btnNext.layer.cornerRadius = 4.0f;
        [viewWithButtons addSubview:btnNext];
        
        
        backManualView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HIEGHT-100)];
        backManualView.backgroundColor =[UIColor clearColor];
        //        [self.view addSubview:backManualView];
        
        TexttitleLbl = [[UILabel alloc] initWithFrame:CGRectMake(10,20 , 300, 30)];
        TexttitleLbl.text = @"Type in voucher number";
        TexttitleLbl.backgroundColor = [UIColor clearColor];
        TexttitleLbl.font = [UIFont boldSystemFontOfSize:14];
        TexttitleLbl.textColor = [UIColor colorWithRed:0.74 green:0.74 blue:0.74 alpha:1.0];
        [backManualView addSubview:TexttitleLbl];
        
        voucherTextField.frame = CGRectMake(10, 60, 300, 35);
        voucherTextField.backgroundColor = [UIColor clearColor];
        voucherTextField.layer.borderColor = [UIColor colorWithRed:0.79 green:0.79 blue:0.79 alpha:0.79].CGColor;
        voucherTextField.layer.cornerRadius = 5.0f;
        voucherTextField.layer.borderWidth = 1.0;
        [backManualView addSubview:voucherTextField];
        
        
        
        btnConfirms.frame = CGRectMake(10, 320, 300, 44);
        btnConfirms.layer.cornerRadius = 4.0f;
        [backManualView addSubview:btnConfirms];
        [btnConfirms addTarget:self action:@selector(confirmNumber) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else
    {
        //4
        //        offView.frame = CGRectMake(0, 250, 320, 140);
        viewWithButtons.frame = CGRectMake(0, SCREEN_HIEGHT- 160, SCREEN_WIDTH, 160);
        viewWithButtons.backgroundColor = [UIColor clearColor];
        [self.view addSubview:viewWithButtons];
        viewWithButtons.backgroundColor = [UIColor clearColor];
        
        btnDelete.frame = CGRectMake(20, 30, 20, 20);
        [btnDelete addTarget:self action:@selector(delteClicked) forControlEvents:UIControlEventTouchUpInside];
        [viewWithButtons addSubview:btnDelete];
        
        btnRight.frame = CGRectMake(280, 30, 20, 20);
        [btnRight addTarget:self action:@selector(rightclicked) forControlEvents:UIControlEventTouchUpInside];
        [viewWithButtons addSubview:btnRight];
        
        btnCamera.frame = CGRectMake(120, 0, 80, 80);
        [btnCamera addTarget:self action:@selector(cameraClicked) forControlEvents:UIControlEventTouchUpInside];
        [btnCamera setBackgroundImage:[UIImage imageNamed:@"camera.png"] forState:UIControlStateNormal];
        [btnCamera setBackgroundColor:[UIColor clearColor]];
        [viewWithButtons addSubview:btnCamera];
        
        btnNext.frame = CGRectMake(20, 100, 280, 44);
        [btnNext    addTarget:self action:@selector(nextClicked) forControlEvents:UIControlEventTouchUpInside];
        btnNext.layer.cornerRadius = 4.0f;
        [viewWithButtons addSubview:btnNext];
        
        
        backManualView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HIEGHT-100)];
        backManualView.backgroundColor =[UIColor clearColor];
        //        [self.view addSubview:backManualView];
        
        TexttitleLbl = [[UILabel alloc] initWithFrame:CGRectMake(10,20 , 300, 30)];
        TexttitleLbl.text = @"Type in voucher number";
        TexttitleLbl.backgroundColor = [UIColor clearColor];
        TexttitleLbl.font = [UIFont boldSystemFontOfSize:14];
        TexttitleLbl.textColor = [UIColor colorWithRed:0.74 green:0.74 blue:0.74 alpha:1.0];
        [backManualView addSubview:TexttitleLbl];
        
        voucherTextField.frame = CGRectMake(10, 60, 300, 35);
        voucherTextField.backgroundColor = [UIColor clearColor];
        voucherTextField.layer.borderColor = [UIColor colorWithRed:0.79 green:0.79 blue:0.79 alpha:0.79].CGColor;
        voucherTextField.layer.cornerRadius = 5.0f;
        voucherTextField.layer.borderWidth = 1.0;
        [backManualView addSubview:voucherTextField];
        
        
        
        btnConfirms.frame = CGRectMake(10, SCREEN_HIEGHT-160, 300, 44);
        btnConfirms.layer.cornerRadius = 4.0f;
        [backManualView addSubview:btnConfirms];
        [btnConfirms addTarget:self action:@selector(confirmNumber) forControlEvents:UIControlEventTouchUpInside];

        
    }
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont systemFontOfSize:14], NSFontAttributeName,
                                [UIColor whiteColor], NSForegroundColorAttributeName,
                                nil];
    [segmentControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    [[UISegmentedControl appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateSelected];
    
    
    
    _highlightView = [[UIView alloc] init];
    _highlightView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
    _highlightView.layer.borderColor = [UIColor greenColor].CGColor;
    _highlightView.layer.borderWidth = 3;
    [self.view addSubview:_highlightView];
    
    _label = [[UILabel alloc] init];
    _label.frame = CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 40);
    _label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    _label.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.65];
    _label.textColor = [UIColor whiteColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"(none)";
    [self.view addSubview:_label];
    _label.hidden = YES;
    
    _session = [[AVCaptureSession alloc] init];
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    
    _input = [AVCaptureDeviceInput deviceInputWithDevice:_device error:&error];
    if (_input) {
        [_session addInput:_input];
    } else {
        NSLog(@"Error: %@", error);
    }
    
    _output = [[AVCaptureMetadataOutput alloc] init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [_session addOutput:_output];
    
    _output.metadataObjectTypes = [_output availableMetadataObjectTypes];
    
    _prevLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    //  _prevLayer.frame = self.view.bounds;
    
    _prevLayer.frame=CGRectMake(10, 120, 300, 150);
    _prevLayer.borderWidth = 0.5;
    _prevLayer.borderColor = [UIColor grayColor].CGColor;
    _prevLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:_prevLayer];
    
    [_session startRunning];
    
    focus1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"focus1.png"]];
    focus1.center = CGPointMake(40, 155);
    [self.view addSubview:focus1];
    
    focus2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"focus2.png"]];
    focus2.center = CGPointMake(280, focus1.center.y);
    [self.view addSubview:focus2];
    
    focus3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"focus4.png"]];
    focus3.center = CGPointMake(focus1.center.x, focus1.center.y+80);
    [self.view addSubview:focus3];
    
    focus4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"focus3.png"]];
    focus4.center = CGPointMake(focus2.center.x, focus3.center.y);
    [self.view addSubview:focus4];
    
    [self.view bringSubviewToFront:_highlightView];
    [self.view bringSubviewToFront:_label];
    [self.view bringSubviewToFront:topbarView];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    CGRect highlightViewRect = CGRectZero;
    AVMetadataMachineReadableCodeObject *barCodeObject;
    NSString *detectionString = nil;
    NSArray *barCodeTypes = @[AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode39Mod43Code,
                              AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeCode128Code,
                              AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeQRCode, AVMetadataObjectTypeAztecCode];
    
    for (AVMetadataObject *metadata in metadataObjects) {
        for (NSString *type in barCodeTypes) {
            if ([metadata.type isEqualToString:type])
            {
                barCodeObject = (AVMetadataMachineReadableCodeObject *)[_prevLayer transformedMetadataObjectForMetadataObject:(AVMetadataMachineReadableCodeObject *)metadata];
                highlightViewRect = barCodeObject.bounds;
                
                NSLog(@"barCodeObject.bounds %@",NSStringFromCGRect(barCodeObject.bounds));
                NSLog(@"barCodeObject.corners %@",barCodeObject.corners);
                
                detectionString = [(AVMetadataMachineReadableCodeObject *)metadata stringValue];
                break;
            }
        }
        
        if (detectionString != nil)
        {
            _label.text = detectionString;
            [_session stopRunning];
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Do you want to scan Another Code ?" message:_label.text delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
            [alert show];
            
            
            
            
            break;
        }
        else
            _label.text = @"(none)";
    }
    
    _highlightView.frame = highlightViewRect;
}


#pragma mark - button actions

-(void)confirmNumber
{
    
}

-(void)delteClicked
{
    
    NSLog(@"delete clicked ");
    
}
-(void)rightclicked
{
    NSLog(@"right clicked ");
    
    
    
}
-(void)cameraClicked
{
    NSLog(@"camera clicked ");
    
    
}
-(void)nextClicked
{
    
    NSLog(@"next clicked ");
    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    
    
    if (buttonIndex==0)
    {
        [_session startRunning];
        
    }
    else
    {
        [MY_APP_DELEGATE.rootVC presentMenuViewController];
        [_session startRunning];
        
    }
    
}

-(IBAction)segmentControlAction:(id)sender
{
    UISegmentedControl *segment = (UISegmentedControl *)sender;
    
    segment.layer.cornerRadius = 5.0;
    
    
    
    
    NSLog(@"segment index = %d",segment.selectedSegmentIndex);
    NSInteger index = segment.selectedSegmentIndex;
    
    if(index==0)
    {
        segmentControl.tintColor = [UIColor colorWithRed:0.19 green:0.56 blue:0.77 alpha:1.0];
        self.view.backgroundColor = [UIColor blackColor];
        
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIFont systemFontOfSize:14], NSFontAttributeName,
                                    [UIColor whiteColor], NSForegroundColorAttributeName,
                                    nil];
        [segmentControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
        [[UISegmentedControl appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateSelected];

        
        [backManualView removeFromSuperview];
        [imaView removeFromSuperview];
        [self.view addSubview:focus1];
        [self.view addSubview:focus2];
        [self.view addSubview:focus3];
        [self.view addSubview:focus4];
        [self.view.layer addSublayer:_prevLayer];
        
        [self.view addSubview:viewWithButtons];
    }
    else if (index == 1)
    {
        [self.view addSubview:imaView];
        
        [self.view addSubview:segmentControl];
        self.view.backgroundColor = [UIColor whiteColor];
        
        
        [segmentControl setTintColor:[UIColor whiteColor]];

        
        [focus1 removeFromSuperview];
        [focus2 removeFromSuperview];
        [focus3 removeFromSuperview];
        [focus4 removeFromSuperview];
        [_prevLayer removeFromSuperlayer];
        
        [viewWithButtons removeFromSuperview];
        [self.view addSubview:backManualView];
    }
    else
    {
        NSLog(@"archive");
    }
}

#pragma mark textfield delegates
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


@end
