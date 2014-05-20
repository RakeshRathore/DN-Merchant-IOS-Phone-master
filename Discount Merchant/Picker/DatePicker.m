//
//  DatePickerNew.m
//  Goal
//
//  Created by Sajith KG on 21/05/12.
//  Copyright (c) 2012 ISPG. All rights reserved.
//

#import "DatePicker.h"

@implementation DatePicker
@synthesize datePicker, delegate,toolbar;

-(void)viewDidLoad {
    [super viewDidLoad];
    
//	datePicker.date = [NSDate date];
//    datePicker.maximumDate = [NSDate date];
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7")) {
        [datePicker setBackgroundColor:[UIColor whiteColor]];
    }
    
    self.titleLbl.text=@"";
    
	// we need to set the subview dimensions or it will not always render correctly
	// http://stackoverflow.com/questions/1088163
	for (UIView* subview in datePicker.subviews) {
		subview.frame = datePicker.bounds;
        
//        NSLog(@"datePicker.bounds=%@",NSStringFromCGRect(datePicker.bounds));
//        NSLog(@"bounds=%@",NSStringFromCGRect(self.view.bounds));
//        NSLog(@"frame=%@",NSStringFromCGRect(self.view.frame));
//        NSLog(@"subview=%@",subview);
//        NSLog(@"view=%@",self.view);
	}
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}

#pragma mark -
#pragma mark Actions


-(IBAction)doneDateEdit:(id)sender {
	if([self.delegate respondsToSelector:@selector(datePickerDoneDate:)]) {
		[self.delegate datePickerDoneDate:self];
	}
}

-(IBAction)cancelDateEdit:(id)sender {
	if([self.delegate respondsToSelector:@selector(datePickerCancel:)]) {
		[self.delegate datePickerCancel:self];
	} else {
		// just dismiss the view automatically?
	}
}

#pragma mark -
#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
	self.datePicker = nil;
	self.delegate = nil;
    self.toolbar = nil;
    
}



@end


