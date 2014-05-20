//
//  Picker.h
//  Federal
//
//  Created by Sajith KG on 21/08/13.
//  Copyright (c) 2013 Sajith KG. All rights reserved.
//

#import "TDSemiModalViewController.h"
#import	"TDSemiModal.h"

@interface Picker : TDSemiModalViewController

@property (nonatomic, weak) id delegate;
@property (nonatomic, strong) IBOutlet UIPickerView* picker;
@property (nonatomic, strong) IBOutlet UIToolbar *toolbar;
@property (nonatomic, strong) NSMutableArray *dataAry;
@property (nonatomic, copy) NSString *keyName;
@property (nonatomic, strong) IBOutlet UILabel *titleLbl;

-(IBAction)pickerDoneCall:(id)sender;
-(IBAction)pickerCancelCall:(id)sender;

- (void) loadDataFromArray:(id)array;
- (void) showSelectedComponent:(NSString*) selectedItem;

@end

@interface NSObject (Picker)

-(void) pickerDone:(Picker*)viewController;
-(void) pickerCancel:(Picker*)viewController;

@end


