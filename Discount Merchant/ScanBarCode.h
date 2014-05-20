//
//  ScanBarCode.h
//  Discount Merchant
//
//  Created by Sajith KG on 01/04/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScanBarCode : UIViewController<UITextFieldDelegate>
{
    IBOutlet UISegmentedControl *segmentControl;
    IBOutlet UIView *offView;
    
    IBOutlet UIButton *btnCamera;
    IBOutlet UIButton *btnDelete;
    IBOutlet UIButton *btnRight;
    IBOutlet UIButton *btnNext;
    
    IBOutlet UITextField *voucherTextField;
    UIView *backManualView;
    IBOutlet UIButton *btnConfirms;
    UILabel *TexttitleLbl;
    
}

-(IBAction)segmentControlAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *viewWithButtons;

@end
