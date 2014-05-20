//
//  LeftMenu.h
//  Discount
//
//  Created by Sajith KG on 30/01/14.
//  Copyright (c) 2014 Justin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"

@interface LeftMenu : UIViewController<RESideMenuDelegate,UITextFieldDelegate>

@property (nonatomic,readwrite) NSInteger selectedRow;

@property (nonatomic,strong) IBOutlet UITableView *menuTable;
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) IBOutlet UILabel *profileHdr;
@property (strong, nonatomic) IBOutlet UIImageView *logoImgView;


@end
