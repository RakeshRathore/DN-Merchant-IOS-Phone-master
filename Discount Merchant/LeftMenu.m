//
//  LeftMenu.m
//  Discount
//
//  Created by Sajith KG on 30/01/14.
//  Copyright (c) 2014 Justin. All rights reserved.
//

#import "LeftMenu.h"
#import "AppDelegate.h"
#import "RootVC.h"
#import "CategoryCell.h"

@interface LeftMenu (){
    
    NSMutableArray *categoryAry,*subCategoryAry;
    
}

@end

@implementation LeftMenu

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.searchTextField.font = LATO_REGULAR(14);
    self.profileHdr.font = LATO_LIGHT(30);
    self.profileHdr.textColor = RGB(124, 124, 124);
    
    _selectedRow = 7;
    
    subCategoryAry = [[NSMutableArray alloc] init];
    
    NSDictionary *temp1 = @{ @"category": @"Notifications",@"categoryPicture": @"icon_notifications.png",@"categoryPictureSelected": @"icon_notifications_sel.png"};
    NSDictionary *temp2 = @{ @"category": @"Dashboard",@"categoryPicture": @"icon_dashboard.png",@"categoryPictureSelected": @"icon_dashboard_sel.png"};
    NSDictionary *temp3 = @{ @"category": @"Statistics" ,@"categoryPicture": @"icon_statistics.png",@"categoryPictureSelected": @"icon_statistics_sel.png"};
    NSDictionary *temp4 = @{ @"category": @"Current Discounts" ,@"categoryPicture": @"icon_current_discount.png",@"categoryPictureSelected": @"icon_current_discount_sel.png"};
    NSDictionary *temp5 = @{ @"category": @"Saved Discounts" ,@"categoryPicture": @"icon_saved_discount.png",@"categoryPictureSelected": @"icon_saved_discount_sel.png" };
    NSDictionary *temp6 = @{ @"category": @"Create Discount" ,@"categoryPicture": @"icon_creat_discount.png",@"categoryPictureSelected": @"icon_creat_discount_sel.png"};
    NSDictionary *temp7 = @{ @"category": @"Stores" ,@"categoryPicture": @"icon_stores.png",@"categoryPictureSelected": @"icon_stores_sel.png"};
    NSDictionary *temp8 = @{ @"category": @"Team" ,@"categoryPicture": @"icon_team.png",@"categoryPictureSelected": @"icon_team_sel.png"};
    
    NSDictionary *temp9 = @{ @"category": @"Scan Barcode",@"categoryPicture": @"icon_scan_barcode.png",@"categoryPictureSelected": @"icon_scan_barcode_sel.png"};
 
    categoryAry = [[NSMutableArray alloc] initWithObjects:temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9, nil];
    
    self.menuTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.menuTable registerNib:[UINib nibWithNibName:@"CategoryCell" bundle:nil]
       forCellReuseIdentifier:@"CategoryCell"];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Profile

- (IBAction)profileCall:(id)sender {
    
    return;

    _selectedRow = -1;
    
    [self.menuTable reloadData];
    
    [MY_APP_DELEGATE.home menuChanged:(int)_selectedRow];
    
    [MY_APP_DELEGATE.rootVC hideMenuViewController];
}

#pragma mark - Table view data source

//- (BOOL)tableView:(UITableView *)tableView canCollapseSection:(NSInteger)section
//{
//    return YES;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [categoryAry count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    CategoryCell *cell = (CategoryCell *)[tableView dequeueReusableCellWithIdentifier:@"CategoryCell"];
    [cell.contentView setBackgroundColor:[UIColor clearColor]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.categoryName.text = [[categoryAry objectAtIndex:indexPath.row] objectForKey:@"category"];
    cell.iconImg.image = [UIImage imageNamed:[[categoryAry objectAtIndex:indexPath.row] objectForKey:@"categoryPicture"]];
    cell.categoryName.textColor = RGB(124, 124, 124);
    
    cell.badgelabel.hidden = (indexPath.row!=0);
    cell.badgeLabelText.hidden = (indexPath.row!=0);
    
    if (indexPath.row == _selectedRow) {
        
        cell.iconImg.image = [UIImage imageNamed:[[categoryAry objectAtIndex:indexPath.row] objectForKey:@"categoryPictureSelected"]];
        cell.categoryName.textColor = [UIColor whiteColor];
    }
    
    return cell;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    _selectedRow = indexPath.row;

    [tableView reloadData];
    
    [MY_APP_DELEGATE.rootVC hideMenuViewController];
}

#pragma mark -
#pragma mark RESideMenu Delegate

- (void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController
{
    //NSLog(@"willShowMenuViewController");
}

- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController
{
    //NSLog(@"didShowMenuViewController");
    
    [self.menuTable reloadData];
}

- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController
{
    //NSLog(@"willHideMenuViewController");
    
    [MY_APP_DELEGATE.home menuChanged:(int)_selectedRow];
}

- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController
{
    //NSLog(@"didHideMenuViewController");
    
}

#pragma mark -
#pragma mark Text Field

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
     [MY_APP_DELEGATE showDevelopmentMessage];
	
    [textField resignFirstResponder];
    return YES;
}



@end
