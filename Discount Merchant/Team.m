//
//  Team.m
//  Discount Merchant
//
//  Created by Sajith KG on 04/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "Team.h"
#import "AppDelegate.h"
#import "TeamCell.h"

@interface Team () {

    IBOutlet UITableView *myTable;
    NSMutableArray *itemsArray;
}

@end

@implementation Team

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
    
    [MY_APP_DELEGATE.rootVC presentMenuViewController];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.topbarView.backgroundColor = TOPBAR_BG_COLOR;
    self.titleLbl.font = LATO_BOLD(20);
    
    myTable.backgroundColor = RGB(233, 236, 239);
    
    NSArray *keysArray = @[@"teamName",@"teamPosition",@"locationName",@"displayPicture",@"time"];
    
    NSArray *valueArray1 = @[@"Alan Spinok",@"Director of Marketing",@"Store #111",@"Alan_Spinok_Director_of_Marketing.jpg",@"44 minutes"];
    
    NSArray *valueArray2 = @[@"Mary Alvens",@"Shift Leader",@"Store #120",@"Mary_Alvens_Shift_Leader.jpg",@"7 minutes"];
    
    NSArray *valueArray3 = @[@"Tom Jones",@"Marketing Officer",@"Store #150",@"Tom_Jones_Marketing_Officer.jpg",@"5 hours"];
    
    NSArray *valueArray4 = @[@"Lauren Banks",@"General Manager",@"Store #3450",@"Lauren_Banks_General_Manager.jpg",@"22 hours"];
    
    NSArray *valueArray5 = @[@"Cynthia Stevens",@"Sales Lead",@"Store #3450",@"Cynthia_Stevens_Sales_Lead.jpg",@"22 hours"];
    
    NSArray *valueArray6 = @[@"Cedric Stevenson",@"Executive Chef",@"Store #3450",@"Cedric_Stevenson_Executive_Chef.jpg",@"22 hours"];
    
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjects:valueArray1 forKeys:keysArray];
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjects:valueArray2 forKeys:keysArray];
    NSDictionary *dict3 = [NSDictionary dictionaryWithObjects:valueArray3 forKeys:keysArray];
    NSDictionary *dict4 = [NSDictionary dictionaryWithObjects:valueArray4 forKeys:keysArray];
    NSDictionary *dict5 = [NSDictionary dictionaryWithObjects:valueArray5 forKeys:keysArray];
    NSDictionary *dict6 = [NSDictionary dictionaryWithObjects:valueArray6 forKeys:keysArray];
    
    itemsArray = [[NSMutableArray alloc] initWithObjects:dict1,dict2,dict3,dict4,dict5,dict6,nil];
    
    [myTable registerNib:[UINib nibWithNibName:@"TeamCell" bundle:nil]
      forCellReuseIdentifier:@"TeamCell"];
    
    [myTable reloadData];
}


#pragma mark  - Table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [itemsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TeamCell *cell = (TeamCell *)[tableView dequeueReusableCellWithIdentifier:@"TeamCell"];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    NSDictionary *currentDict=[itemsArray objectAtIndex:indexPath.row];
    
    [cell.itemPic setImage:[UIImage imageNamed:[currentDict objectForKey:@"displayPicture"]]];
    
    [cell.lblPosition setText:[currentDict objectForKey:@"teamPosition"]];
    [cell.storeName setText:[currentDict objectForKey:@"teamName"]];
    [cell.location setText:[currentDict objectForKey:@"locationName"]];
    [cell.timeLbl setText:[NSString stringWithFormat:@"Last access %@ ago",[currentDict objectForKey:@"time"]]];

    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [MY_APP_DELEGATE showDevelopmentMessage];
    
}

@end
