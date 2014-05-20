//
//  MultiSelect.m
//  Discount Merchant
//
//  Created by Sajith KG on 26/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "MultiSelect.h"
#import "PostView.h"

@interface MultiSelect ()  {

    IBOutlet UIView *topbarView;
    IBOutlet UILabel *titleLbl;
    
    IBOutlet UITableView *myTableView;
    
    NSMutableArray *baseArray,*selectedArray;
}

@end

@implementation MultiSelect

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
    
    if([self.delegate respondsToSelector:@selector(selectedItem:)])
    {
        [self.delegate selectedItem:selectedArray];
    }

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    topbarView.backgroundColor = TOPBAR_BG_COLOR;
    titleLbl.font = LATO_BOLD(20);
    
    baseArray = [[NSMutableArray alloc] init];
    selectedArray = [[NSMutableArray alloc] init];
    
}

- (void) setMultiSelectWithBaseArray:(NSMutableArray*) baseAry andSelectedArray:(NSMutableArray*) selectedAry {

    [self view];
    
    [titleLbl setText:self.titleStr];
    
    [baseArray removeAllObjects];
    [selectedArray removeAllObjects];
    
    [baseArray addObjectsFromArray:baseAry];
    [selectedArray addObjectsFromArray:selectedAry];
    
    NSLog(@"[baseArray count] %lu",(unsigned long)[baseArray count]);
    
    
    [myTableView reloadData];
}


#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    if ([[baseArray objectAtIndex:0] isKindOfClass:[NSDictionary class]]) {
        return [baseArray count];
    }
    
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([[baseArray objectAtIndex:0] isKindOfClass:[NSDictionary class]]) {
        return [[[baseArray objectAtIndex:section] objectForKey:@"locations"] count];
    }else {
        return [baseArray count];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if ([[baseArray objectAtIndex:0] isKindOfClass:[NSDictionary class]]) {
        return 30;
    }else {
        return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if ([[baseArray objectAtIndex:0] isKindOfClass:[NSDictionary class]]) {
        
        return [[baseArray objectAtIndex:section] objectForKey:@"title"];
    }else {
        return nil;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (![[baseArray objectAtIndex:0] isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.frame.size.width, 30)];
    label.textColor=[UIColor grayColor];
    label.backgroundColor=[UIColor clearColor];
    [label setFont:LATO_BOLD(15)];
    NSString *string =[[baseArray objectAtIndex:section] objectForKey:@"title"];
    UIImageView *lineImgTop=[[UIImageView alloc]init];
    lineImgTop.frame=CGRectMake(0, -0.5, tableView.frame.size.width, 0.5);
    lineImgTop.backgroundColor = [UIColor grayColor];
    [view addSubview:lineImgTop];
    UIImageView *lineImgbottom=[[UIImageView alloc]init];
    lineImgbottom.backgroundColor = [UIColor grayColor];
    lineImgbottom.frame=CGRectMake(0, 29.5, tableView.frame.size.width, 0.5);
    [view addSubview:lineImgbottom];
    
    [label setText:string];
    [view addSubview:label];
    [view setBackgroundColor:RGB(240, 240, 240)];
    return view;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* CellIdentifier = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == Nil)
    {
        cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        UIImageView *lineImage=[[UIImageView alloc] init];
        lineImage.frame=CGRectMake(10.0f, 38.5f, 300.0f, 0.5f);
        lineImage.tag = 1111;
        lineImage.backgroundColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:lineImage];
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor=[UIColor darkGrayColor];
        cell.textLabel.font = LATO_REGULAR(14);
        cell.backgroundColor = [UIColor clearColor];
    }
    
    UIImageView *line = (UIImageView*)[cell.contentView viewWithTag:1111];
    line.hidden=NO;
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    NSString *currentKey;
    
    if ([[baseArray objectAtIndex:0] isKindOfClass:[NSDictionary class]]) {
        
        currentKey = [[[baseArray objectAtIndex:indexPath.section] objectForKey:@"locations"] objectAtIndex:indexPath.row];
    }else {
        currentKey = [baseArray objectAtIndex:indexPath.row];
    }
    
    if ([self isAlreadySelected:currentKey]) {
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    cell.textLabel.text = currentKey;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    NSString *currentKey;
    
    if ([[baseArray objectAtIndex:0] isKindOfClass:[NSDictionary class]]) {
        
        currentKey = [[[baseArray objectAtIndex:indexPath.section] objectForKey:@"locations"] objectAtIndex:indexPath.row];
    }else {
        currentKey = [baseArray objectAtIndex:indexPath.row];
    }
    
    if ([self isAlreadySelected:currentKey]) {
        
        [selectedArray removeObject:currentKey];
        
//        [UIView transitionWithView:cell
//                          duration:0.2
//                           options:UIViewAnimationOptionTransitionCrossDissolve
//                        animations:^{
//                             cell.accessoryType = UITableViewCellAccessoryNone;
//                        }
//                        completion:NULL];
        
    }else {
        [selectedArray addObject:currentKey];
        
//        [UIView transitionWithView:cell
//                          duration:0.2
//                           options:UIViewAnimationOptionTransitionCrossDissolve
//                        animations:^{
//                             cell.accessoryType = UITableViewCellAccessoryCheckmark;
//                        }
//                        completion:NULL];
    }
    
    [tableView reloadData];
}


- (BOOL) isAlreadySelected:(NSString*) key {
    
    for (NSString *str in selectedArray) {
        
        if ([str isEqualToString:key]) {
            return YES;
        }
    }
    return NO;
}


@end
