//
//  CreateDiscount.h
//  Discount Merchant
//
//  Created by Sajith KG on 04/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateDiscount : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>

@property (nonatomic, strong) IBOutlet UIView *topbarView;
@property (strong, nonatomic) IBOutlet UILabel *titleLbl;


- (void) showCamera;

@end
