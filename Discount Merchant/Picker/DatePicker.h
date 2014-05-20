//
//  DatePickerNew.h
//  Goal
//
//  Created by Sajith KG on 21/05/12.
//  Copyright (c) 2012 ISPG. All rights reserved.
//



#import <UIKit/UIKit.h>
#import	"TDSemiModal.h"

@interface DatePicker : TDSemiModalViewController {
	id delegate;
}

@property (nonatomic) IBOutlet id delegate;
@property (nonatomic) IBOutlet UIDatePicker* datePicker;
@property (nonatomic) IBOutlet UIToolbar *toolbar;
@property (nonatomic, readwrite) int currentIndex;
@property (nonatomic, strong) IBOutlet UILabel *titleLbl;

-(IBAction)doneDateEdit:(id)sender;
-(IBAction)cancelDateEdit:(id)sender;

@end

@interface NSObject (DatePicker)
-(void)datePickerDoneDate:(DatePicker*)viewController;
-(void)datePickerCancel:(DatePicker*)viewController;
@end

