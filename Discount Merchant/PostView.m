//
//  PostView.m
//  Discount Merchant
//
//  Created by Sajith KG on 24/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "PostView.h"
#import "AppDelegate.h"
#import "InviteFriends.h"
#import "CreateDiscount.h"
#import "DatePicker.h"
#import "Picker.h"
#import "PostField.h"
#import "PostSubHolderLbl.h"
#import "PostWhiteView.h"
#import "MultiSelect.h"


@interface PostView (){
    
    DatePicker* datePickerView;
    Picker *picker;
    
    MultiSelect *multiSelect;
    
    IBOutlet PostField *title,*startDate,*endDate,*repeatInterval,*startTime,*endTime,*locations,*discountType,*subCat1,*subCat2;
    IBOutlet PostSubHolderLbl *subCatHolder1,*subCatHolder2;
    
    IBOutlet UIView *subCatView;
    
    IBOutlet UISwitch *dateSwitch,*timeSwitch;
    
    IBOutlet PostWhiteView *discountTypeView,*descriptionView,*locationView;

    IBOutlet UIButton *nextBtn,*lightningBtn,*repeatChangeBtn;
    
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIView *contentView;
    IBOutlet UILabel *sharingOptionsHdr,*facebookHdr;
    
    IBOutlet UITextView *description;
    
    NSMutableArray *repeatAry,*discountTypeAry;
    
    NSInteger discountTypeSel;
    
    NSDate *dateStart,*dateEnd,*timeStart,*timeEnd;
    
    NSString *placeHolderText;
    
    IBOutlet UILabel *count_lbl;
    
    NSMutableArray *baseDays,*baseLocations;
    NSMutableArray *selectedDays,*selectedLocations;
}

@end

@implementation PostView

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
//    [createDiscount  performSelector:@selector(showCamera) withObject:nil afterDelay:0.3];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.topbarView.backgroundColor = TOPBAR_BG_COLOR;
    self.titleLbl.font = LATO_BOLD(17);
    
    discountTypeSel=-1;
    
    [scrollView addSubview:contentView];
    [scrollView setContentSize:CGSizeMake(contentView.frame.size.width, contentView.frame.size.height)];
    
    nextBtn.titleLabel.font = LATO_REGULAR(16);
    
    repeatChangeBtn.titleLabel.font = LATO_REGULAR(14);
    
    sharingOptionsHdr.font = LATO_REGULAR(16);
    facebookHdr.font = LATO_REGULAR(16);
    
    sharingOptionsHdr.textColor = RGB(38, 38, 38);
    facebookHdr.textColor = RGB(67, 67, 67);
    
    description.font = LATO_REGULAR(16);
    
    count_lbl.font = LATO_REGULAR(13);
    count_lbl.textColor = [UIColor grayColor];
    
    repeatAry = [[NSMutableArray alloc] initWithArray:@[@"Daily",@"Weekdays",@"Weekend",@"Select Days"]];
    discountTypeAry = [[NSMutableArray alloc] initWithArray:@[@"BOGO",@"Discount",@"Limited Offer",@"Freebie"]];
    
    if (!picker) {
        picker = [[Picker alloc] init];
        [picker setDelegate:self];
    }
    
    datePickerView = [[DatePicker alloc] init];
    datePickerView.delegate=self;
    
    dateSwitch.onTintColor = STATUS_BAR_COLOR;
    timeSwitch.onTintColor = STATUS_BAR_COLOR;
    
    [dateSwitch setOn:NO];
    [timeSwitch setOn:NO];
    
    lightningBtn.selected=NO;
    
    lightningBtn.layer.cornerRadius = 4;
    
    [lightningBtn setImage:[UIImage imageNamed:@"flashWhite_createDis.png"] forState:UIControlStateNormal];
    [lightningBtn setImage:[UIImage imageNamed:@"flashYellow_createDis.png"] forState:UIControlStateSelected];
    
    UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleBordered target:self
                                                                  action:@selector(doneClicked:)];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:space,doneButton, nil]];
    keyboardDoneButtonView.barStyle = UIBarStyleBlack;
    subCat1.inputAccessoryView = keyboardDoneButtonView;
    subCat2.inputAccessoryView = keyboardDoneButtonView;
    description.inputAccessoryView = keyboardDoneButtonView;
    
    placeHolderText=@"Write a brief description here (250 character max)...";
    description.text = placeHolderText;
    description.textColor = [UIColor lightGrayColor];
    count_lbl.text =  [NSString stringWithFormat:@"Char left: %d",250];
    
    multiSelect = [[MultiSelect alloc] init];
    [multiSelect setDelegate:self];
    
    baseDays = [[NSMutableArray alloc] initWithArray:@[@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday",@"Sunday"]];
    selectedDays = [[NSMutableArray alloc] init];
    
    NSDictionary *dictionary1 = @{@"title": @"Northeast",@"locations": @[@"Northeast 1",@"Northeast 2",@"Northeast 3",@"Northeast 4",@"Northeast 5"]};
    NSDictionary *dictionary2 = @{@"title": @"Southeast",@"locations": @[@"Southeast 1",@"Southeast 2"]};
    NSDictionary *dictionary3 = @{@"title": @"Midwest",@"locations": @[@"Midwest 1",@"Midwest 2",@"Midwest 3",@"Midwest 4",@"Midwest 5",@"Midwest 6",@"Midwest 7",@"Midwest 8"]};
    
    baseLocations = [[NSMutableArray alloc] initWithArray:@[dictionary1,dictionary2,dictionary3]];
    selectedLocations = [[NSMutableArray alloc] init];
    
    [self updateSubCatView];
}

- (void) doneClicked:(id)sender
{
    [self.view endEditing:YES];
}

-(void)textViewDidBeginEditing:(UITextView *)textView {
    
    if ([textView.text isEqualToString:placeHolderText]) {
        textView.text=@"";
    }
    textView.textColor = [UIColor darkTextColor];
    
    [Global animateView:self.view :YES :260];

}

- (void)textViewDidChange:(UITextView *)textView{
    
    NSInteger restrictedLength=250;
    
    NSString *temp=textView.text;
    
    if([[description text] length] > restrictedLength){
        description.text=[temp substringToIndex:[temp length]-1];
    }
   // count_lbl.text = [NSString stringWithFormat:@"%lu",];
    count_lbl.text =  [NSString stringWithFormat:@"Char left: %lu",restrictedLength-[description.text length]];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    NSString *textFieldText=[NSString stringWithFormat:@"%@",textView.text];
    
    if([textFieldText length]>0 && [text length]==0){
        textFieldText=[textFieldText substringToIndex:[textFieldText length] - 1];
    }
    
    NSString* searchText=[NSString stringWithFormat:@"%@%@",textFieldText,text];
    
    if ([searchText length]>250) {
        return NO;
    }
    
    return YES;
}


-(void)textViewDidEndEditing:(UITextView *)textView {
    
    if ([textView.text length]==0) {
        
        textView.text =placeHolderText;
        textView.textColor = [UIColor lightGrayColor];
        count_lbl.text =  [NSString stringWithFormat:@"Char left: %d",250];
    }
    
    [Global animateView:self.view :NO :260];
}

#pragma mark Submit

- (IBAction)submitBtnCall:(id)sender {
    
    InviteFriends *inviteFriends = [[InviteFriends alloc] init];
    [self.navigationController pushViewController:inviteFriends animated:YES];
}

#pragma mark Discount Type

- (IBAction)lightningBtnCall:(id)sender {
    
    UIButton *btn = (UIButton*) sender;
    
    if (btn.selected) {
        [btn setSelected:NO];
        [lightningBtn setBackgroundColor:[UIColor lightGrayColor]];
    }else {
        [btn setSelected:YES];
        [lightningBtn setBackgroundColor:[UIColor darkGrayColor]];
    }
}

#pragma mark Repeat

- (IBAction)repeatChangeBtnCall:(id)sender {
    
    [multiSelect setCurrentIndex:1];
    [multiSelect setTitleStr:@"Select Days"];
    [self.navigationController pushViewController:multiSelect animated:YES];
    [multiSelect setMultiSelectWithBaseArray:baseDays andSelectedArray:selectedDays];
}

#pragma mark Switch

- (IBAction) switchToggled:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    
    if (mySwitch==dateSwitch) {
        
        startDate.userInteractionEnabled =![mySwitch isOn];
        endDate.userInteractionEnabled =![mySwitch isOn];
        
        if ([mySwitch isOn]) {
            startDate.textColor = [UIColor lightGrayColor];
            endDate.textColor = [UIColor lightGrayColor];
            
        } else {
            startDate.textColor = [UIColor blackColor];
            endDate.textColor = [UIColor blackColor];
        }
        
    }else {
        
        startTime.userInteractionEnabled =![mySwitch isOn];
        endTime.userInteractionEnabled =![mySwitch isOn];
        
        if ([mySwitch isOn]) {
            startTime.textColor = [UIColor lightGrayColor];
            endTime.textColor = [UIColor lightGrayColor];
            
        } else {
            startTime.textColor = [UIColor blackColor];
            endTime.textColor = [UIColor blackColor];
        }
    }
}


#pragma mark -
#pragma mark Text Field

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (textField==startDate) {
        [self.view endEditing:YES];
        [self presentSemiModalViewController:datePickerView];
        datePickerView.currentIndex =1;
        [datePickerView.datePicker setDatePickerMode:UIDatePickerModeDate];
        datePickerView.datePicker.minimumDate = [NSDate date];
        datePickerView.titleLbl.text=@"Select Start Date";
        
        return NO;
    }
    
    if (textField==endDate) {
        [self.view endEditing:YES];
        [self presentSemiModalViewController:datePickerView];
        datePickerView.currentIndex =2;
        [datePickerView.datePicker setDatePickerMode:UIDatePickerModeDate];
        datePickerView.datePicker.minimumDate = (dateStart? dateStart: [NSDate date]);
        datePickerView.titleLbl.text=@"Select End Date";
        return NO;
    }
    
    if (textField==startTime) {
        [self.view endEditing:YES];
        [self presentSemiModalViewController:datePickerView];
        datePickerView.currentIndex =3;
        datePickerView.datePicker.minimumDate = nil;
        [datePickerView.datePicker setDatePickerMode:UIDatePickerModeTime];
        datePickerView.titleLbl.text=@"Select Start Time";
        return NO;
    }
    
    if (textField==endTime) {
        [self.view endEditing:YES];
        [self presentSemiModalViewController:datePickerView];
        datePickerView.currentIndex =4;
        
        if (timeStart) {
            datePickerView.datePicker.minimumDate = (timeStart? timeStart: [NSDate date]);
        }
        
        [datePickerView.datePicker setDatePickerMode:UIDatePickerModeTime];
        datePickerView.titleLbl.text=@"Select End Time";
        return NO;
    }
    
    if (textField==locations) {
        [self.view endEditing:YES];
        [multiSelect setCurrentIndex:2];
        [multiSelect setTitleStr:@"Select Locations"];
        [self.navigationController pushViewController:multiSelect animated:YES];
        [multiSelect setMultiSelectWithBaseArray:baseLocations andSelectedArray:selectedLocations];
        
        return NO;
    }
    
    if (textField==repeatInterval) {
        [self.view endEditing:YES];
        [self presentRepeatPickerSelecter];
        return NO;
    }
    
    if (textField==discountType) {
        [self.view endEditing:YES];
        [self presentDiscountTypePickerSelecter];
        return NO;
    }
    
    
    
    return YES;

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {

    if (textField==subCat1) {
        [scrollView scrollRectToVisible:CGRectMake(0, contentView.frame.size.height-40, 320, 40) animated:YES];
        [Global animateView:self.view :YES :100];
    }
    
    if (textField==subCat2) {
        [scrollView scrollRectToVisible:CGRectMake(0, contentView.frame.size.height-20, 320, 20) animated:YES];
        [Global animateView:self.view :YES :100];
    }

}

- (void)textFieldDidEndEditing:(UITextField *)textField {

    if (textField==subCat1) {
        [Global animateView:self.view :NO :100];
    }
    if (textField==subCat2) {
        [Global animateView:self.view :NO :100];
    }

}

#pragma mark -
#pragma mark Date Picker Delegate

-(void)datePickerDoneDate:(DatePicker*)viewController {
	[self dismissSemiModalViewController:datePickerView];
    
    if (viewController.currentIndex==1) { // start date
        
        dateStart = viewController.datePicker.date;
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateStyle:NSDateFormatterLongStyle];
        startDate.text=[df stringFromDate:dateStart];
        df=nil;
    }
    
    if (viewController.currentIndex==2) { // end date
        
        dateEnd = viewController.datePicker.date;
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateStyle:NSDateFormatterLongStyle];
        endDate.text=[df stringFromDate:dateEnd];
        df=nil;
    }
    
    if (viewController.currentIndex==3) { // start time
        
        timeStart = viewController.datePicker.date;
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"h:mm a"];
        startTime.text=[df stringFromDate:timeStart];
        df=nil;
        
        [self compareTime];
    }
    
    if (viewController.currentIndex==4) { // end time
        
        timeEnd = viewController.datePicker.date;
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"h:mm a"];
        endTime.text=[df stringFromDate:timeEnd];
        df=nil;
        
        [self compareTime];
    }
    
}

-(void)datePickerCancel:(DatePicker*)viewController {
	[self dismissSemiModalViewController:datePickerView];
}

- (void) compareTime {
    
    if (timeStart && timeEnd) {
        
        NSComparisonResult result = [timeStart compare:timeEnd];
        if(result == NSOrderedDescending)
        {
            NSLog(@"timeStart is later than timeEnd");
            [Loading showErrorWithStatus:@"End time should be greater than start time"];
            timeEnd=nil;
            endTime.text=@"";
        }
        else if(result == NSOrderedAscending)
        {
            NSLog(@"timeEnd is later than timeStart");
        }
        else
        {
            NSLog(@"timeStart is equal to timeEnd");
            [Loading showErrorWithStatus:@"End time should be greater than start time"];
            timeEnd=nil;
            endTime.text=@"";
        }
    }
}

#pragma mark Repeat

- (void) presentRepeatPickerSelecter {
    
    [picker loadDataFromArray:repeatAry];
    [self presentSemiModalViewController:picker];
    [picker showSelectedComponent:repeatInterval.text];
    picker.titleLbl.text=@"Select Repeat Interval";
}

#pragma mark Discount Type

- (void) presentDiscountTypePickerSelecter {
    
    [picker loadDataFromArray:discountTypeAry];
    [self presentSemiModalViewController:picker];
    [picker showSelectedComponent:discountType.text];
    picker.titleLbl.text=@"Select Discount Type";
}

- (void) updateSubCatView {
    
    discountTypeView.frame = CGRectMake(discountTypeView.frame.origin.x, locationView.frame.origin.y+locationView.frame.size.height,discountTypeView.frame.size.width, 180);
    subCatView.hidden=NO;
    

    switch (discountTypeSel) {
        case 0: //BOGO
            
            subCatHolder1.text = @"Buy how many?";
            subCatHolder2.text = @"Get how many?";
            
            subCat1.placeholder = @"x";
            subCat2.placeholder = @"y";
            
            break;
            
        case 1: // Discount
            
            subCatHolder1.text = @"Retail Price:";
            subCatHolder2.text = @"Discount Price:";
            
            subCat1.placeholder = @"$0.00";
            subCat2.placeholder = @"$0.00";
            
            break;
            
        case 2: // Limited Offer
            
            subCatHolder1.text = @"Quantity:";
            subCatHolder2.text = @"Price:";
            
            subCat1.placeholder = @"n";
            subCat2.placeholder = @"$0.00";
            
            break;
            
        default:
            
            discountTypeView.frame = CGRectMake(discountTypeView.frame.origin.x, locationView.frame.origin.y+locationView.frame.size.height,discountTypeView.frame.size.width, 96);
            subCatView.hidden=YES;
            break;
    }
    
    [discountTypeView resetBottomLine];
    
    descriptionView.frame = CGRectMake(descriptionView.frame.origin.x, discountTypeView.frame.origin.y+discountTypeView.frame.size.height,descriptionView.frame.size.width, descriptionView.frame.size.height);
    
    contentView.frame = CGRectMake(contentView.frame.origin.x, contentView.frame.origin.y,contentView.frame.size.width, descriptionView.frame.origin.y+descriptionView.frame.size.height);
    
    [scrollView setContentSize:CGSizeMake(contentView.frame.size.width, contentView.frame.size.height)];

}

#pragma mark Picker Delegate

-(void)pickerDone:(Picker*)viewController {
    
	[self dismissSemiModalViewController:viewController];
    
    if ([viewController.dataAry isEqualToArray:repeatAry]) {
        repeatInterval.text = [repeatAry objectAtIndex:[viewController.picker selectedRowInComponent:0]];
        
        repeatChangeBtn.hidden=YES;
        
        if ([viewController.picker selectedRowInComponent:0]==3) {
            repeatChangeBtn.hidden=NO;
            [self repeatChangeBtnCall:nil];
        }
    }
    
    if ([viewController.dataAry isEqualToArray:discountTypeAry]) {
        discountTypeSel = [viewController.picker selectedRowInComponent:0];
        discountType.text = [discountTypeAry objectAtIndex:discountTypeSel];
        [self updateSubCatView];
    }
}

-(void)pickerCancel:(Picker *)viewController {
	[self dismissSemiModalViewController:viewController];
}

#pragma mark Selected Items

-(void)selectedItem:(NSMutableArray*)selectedArry {
    
    if (multiSelect.currentIndex==1) {
        
        [selectedDays removeAllObjects];
        [selectedDays addObjectsFromArray:selectedArry];
    }
    
    if (multiSelect.currentIndex==2) {
        
        [selectedLocations removeAllObjects];
        [selectedLocations addObjectsFromArray:selectedArry];
        
        if (selectedLocations.count) {
            locations.text = [selectedLocations componentsJoinedByString:@" , "];
        }else {
            locations.text =@"";
        }
        
    }
}

@end
