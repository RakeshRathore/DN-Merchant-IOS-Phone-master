//
//  Picker.m
//  Federal
//
//  Created by Sajith KG on 21/08/13.
//  Copyright (c) 2013 Sajith KG. All rights reserved.
//

#import "Picker.h"

@interface Picker ()

@end

@implementation Picker

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.dataAry = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.picker selectRow:0 inComponent:0 animated:NO];
	self.picker.showsSelectionIndicator = TRUE;
    
    self.titleLbl.text=@"";
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7")) {
        [self.picker setBackgroundColor:[UIColor whiteColor]];
    }
    
}

- (void) loadDataFromArray:(id)array {
    
    [self.dataAry removeAllObjects];
    [self.dataAry addObjectsFromArray:array];
	
    [self.picker reloadAllComponents];
	[self.picker selectRow:0 inComponent:0 animated:NO];
}

- (void) showSelectedComponent:(NSString*) selectedItem {
    
    if (![selectedItem length]) {
        return;
    }
    
    if (![self.dataAry count]) {
        return;
    }
    if ([[self.dataAry objectAtIndex:0] isKindOfClass:[NSString class]]) {
        [self.picker selectRow:[self.dataAry indexOfObject:selectedItem] inComponent:0 animated:NO];
    }else {
        
        for (int i=0; i<[self.dataAry count]; i++) {
            
            if ([[[self.dataAry objectAtIndex:i] objectForKey:self.keyName] isEqualToString:selectedItem]) {
                [self.picker selectRow:i inComponent:0 animated:NO];
                break;
            }
        }
    }
}

#pragma mark -
#pragma mark Actions

-(IBAction)pickerDoneCall:(id)sender {
	if([self.delegate respondsToSelector:@selector(pickerDone:)]) {
		[self.delegate pickerDone:self];
	}
}

-(IBAction)pickerCancelCall:(id)sender {
	if([self.delegate respondsToSelector:@selector(pickerCancel:)]) {
		[self.delegate pickerCancel:self];
	}
}

#pragma mark -
#pragma mark Picker Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.dataAry count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if ([[self.dataAry objectAtIndex:row] isKindOfClass:[NSString class]]) {
        return [self.dataAry objectAtIndex:row];
    }else {
        return [[self.dataAry objectAtIndex:row] objectForKey:self.keyName];
    }
}

#pragma mark -
#pragma mark Memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
