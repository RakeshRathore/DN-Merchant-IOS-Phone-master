//
//  Statistics.m
//  Discount Merchant
//
//  Created by Sajith KG on 04/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "Statistics.h"
#import "AppDelegate.h"
#import "StatListCell.h"

@interface Statistics () {


    NSDictionary *dict1,*dict2,*dict3,*dict4,*dict5;
    NSInteger selectedRow;
}

@end

@implementation Statistics

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
    
    selectedRow = unselectedRow;
    
    NSArray *points3 = @[@40.0f, @7.0f, @20.0f, @13.0f, @7.0f, @9.0f, @30.0f, @04,
                        @40.0f, @7.0f, @20.0f, @13.0f, @7.0f, @9.0f, @30.0f, @04,
                        @40.0f, @7.0f, @20.0f, @13.0f, @7.0f, @9.0f, @30.0f, @04,
                        @40.0f, @7.0f, @20.0f, @13.0f, @7.0f, @9.0f, @30.0f, @04,
                        @40.0f, @7.0f, @20.0f, @13.0f, @7.0f, @9.0f, @30.0f, @04,
                        @40.0f, @7.0f, @20.0f, @13.0f, @7.0f, @9.0f, @30.0f, @04];
    
    NSArray *points2 = @[@100.0f, @70.0f, @0.0f, @13.0f, @7.0f, @9.0f, @30.0f, @04,
                         @40.0f, @7.0f, @20.0f, @13.0f, @7.0f, @9.0f, @30.0f, @04,
                         @40.0f, @7.0f, @20.0f, @13.0f, @7.0f, @9.0f, @30.0f, @04,
                         @40.0f, @7.0f, @220.0f, @13.0f, @70.0f, @9.0f, @0.0f, @04,
                         @70.0f, @7.0f, @20.0f, @13.0f, @7.0f, @9.0f, @30.0f, @04,
                         @20.0f, @7.0f, @20.0f, @13.0f, @7.0f, @90.0f, @30.0f, @04];
    
    NSArray *points1 = @[@0.0f, @70.0f, @60.0f, @50.0f, @40.0f, @30.0f, @70.0f, @80.0f,
                         @40.0f, @47.0f, @40.0f, @60.0f, @27.0f, @19.0f, @40.0f, @44,
                         @40.0f, @37.0f, @20.0f, @80.0f, @67.0f, @49.0f, @36.0f, @44,
                         @40.0f, @70.0f, @30.0f, @40.0f, @70.0f, @49.0f, @30.0f, @24,
                         @70.0f, @27.0f, @20.0f, @40.0f, @37.0f, @49.0f, @30.0f, @44,
                         @20.0f, @37.0f, @25.0f, @40.0f, @72.0f, @90.0f, @30.0f, @0];
    
    NSArray *points4 = @[@0.0f, @70.0f, @60.0f, @65.0f, @40.0f, @30.0f, @70.0f, @80.0f,
                         @0.0f, @0.0f, @0.0f, @0.0f, @0.0f, @0.0f, @0.0f, @0.0f
                         ];
    
    NSArray *keysArray = @[@"discountTitle",@"discountPrice",@"originalPrice",@"percentageSavings",@"companyName",@"Expiration",@"whatsIncluded",@"storeID",@"address",@"city",@"state",@"zip",@"phoneNo",@"imageURL",@"latitude",@"longitude",@"pinType",@"youtube_link",@"points"];
    
    NSArray *valueArray1 = @[@"Half off food, drinks and apps",@"15",@"25",@"60%",@"Better Burgers",@"5 Days",@"Come in and get any meal, drink or appetizer half off. Hurry in the offer is only availble for another 5 days.",@"9987553",@"217 Thayer St",@"Bolingbrook",@"RI",@"2906",@"(401) 228-7373",@"Burger.jpg",@"41.6265",@"-87.3650",@"map_pin_hotel.png",@"http://www.youtube.com/v/zL0CCsdS1cE",points1];
    
    NSArray *valueArray2 = @[@"Speedy Oil Change ",@"30",@"50",@"60%",@"Midwest Motors ",@"3 Days",@"The time is near, Winter is here come on down to Motors and get a Speedy Oil Change. ",@"2231588",@"2553 W Chicago Ave",@"Chicago",@"IL",@"60622",@"(773) 235-6500",@"mechanic.jpg",@"41.5255",@"-87.3740",@"map_pin_beer.png",@"http://www.youtube.com/v/impZ7krcPzI",points2];
    
    NSArray *valueArray3 = @[@"Summer Fashion Blowout ",@"20",@"30",@"67%",@"Bent",@"3 Days",@"Simply UNBEATABLE deals on your favorites tanks, tees, jeans and accessories. Deals go live daily, take advantage and shop. ",@"6458887",@"519 N. Milwaukee Avenue(near N. Damen/North Ave.)",@"Chicago",@"IL",@"60622",@"(773) 227-5300",@"store-interior.jpg",@"41.6355",@"-87.2740",@"map_pin_coffee.png",@"http://www.youtube.com/v/impZ7krcPzI",points3];
    
    NSArray *valueArray4 = @[@"Vacation on the Islands of Chicago",@"45",@"65",@"69%",@"Resort Spa",@"5 Days ",@"Partake in this opportuntity of a lifetime to dine, relax, and enjoy life. Come down to our fabulous hotel and spa to take a load off.",@"6213479",@"233 S Wacker Dr",@"Chicago",@"IL",@"60606",@"(312) 875-9696",@"beach.jpg",@"41.6255",@"-87.8040",@"map_pin_hotel.png",@"http://www.youtube.com/v/rjmPghd6fUQ",points2];
    
    NSArray *valueArray5 = @[@"A Pig on Every Grill",@"25",@"35",@"71%",@"Slab Of Ribs",@"7 Days",@"Slab of Ribs will be hosting the biggest all you can each barbecue week. If you can eat what \"WE\" put on your plate your meal is on us.",@"2155479",@"1470 East Touhy Avenue",@"Des Planies",@"IL",@"60016",@"(847) 391-9860",@"BBQ.jpg",@"41.6075",@"-87.6750",@"map_pin_beer.png",@"http://www.youtube.com/v/zL0CCsdS1cE",points1];
    
    dict1 = [NSDictionary dictionaryWithObjects:valueArray1 forKeys:keysArray];
    dict2 = [NSDictionary dictionaryWithObjects:valueArray2 forKeys:keysArray];
    dict3 = [NSDictionary dictionaryWithObjects:valueArray3 forKeys:keysArray];
    dict4 = [NSDictionary dictionaryWithObjects:valueArray4 forKeys:keysArray];
    dict5 = [NSDictionary dictionaryWithObjects:valueArray5 forKeys:keysArray];
    
    _itemsArray = [[NSMutableArray alloc] initWithObjects:dict1,dict2,dict3,dict4,dict5,nil];
    
    [self.itemsArray addObjectsFromArray:@[dict1,dict2,dict3,dict4,dict5,dict1,dict2,dict3,dict4,dict5,dict1,dict2,dict3,dict4,dict5,dict1,dict2,dict3,dict4,dict5,dict1,dict2,dict3,dict4,dict5]];
    
    [self.myTable registerNib:[UINib nibWithNibName:@"StatListCell" bundle:nil]
       forCellReuseIdentifier:@"StatListCell"];
    
    [self.myTable reloadData];
    
    self.myTable.backgroundColor = RGB(251, 251, 251);
}


#pragma mark  - Table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.itemsArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==selectedRow) {
        return 61+244;
    }

    else return 61;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StatListCell *cell = (StatListCell *)[tableView dequeueReusableCellWithIdentifier:@"StatListCell"];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    [cell setClearCell];
    
    NSDictionary *currentDict=[self.itemsArray objectAtIndex:indexPath.row];
    
    cell.daysLbl.text = [NSString stringWithFormat:@"Expires in %@",[currentDict objectForKey:@"Expiration"]];
    
    [cell.itemPic setImage:[UIImage imageNamed:[currentDict objectForKey:@"imageURL"]]];
    
    cell.itemTitleLbl.text = [currentDict objectForKey:@"discountTitle"];
    
    cell.itemTitleLbl.hidden=NO;
    
    [cell.noOfRedeemsBtn addTarget:self action:@selector(searchBtnCall) forControlEvents:UIControlEventTouchUpInside];
    
    if (indexPath.row==selectedRow) {
        [cell setCellSelected:YES];
    }
    
    
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnCall:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == selectedRow) {
       // [self deleteBtnCall:nil];
        
    }else {
        [self deleteBtnCall:nil];
        selectedRow = indexPath.row;
        
        StatListCell *cell = (StatListCell *)[tableView cellForRowAtIndexPath:indexPath];
        [tableView beginUpdates];
        [cell setCellSelected:YES];
        [tableView endUpdates];
        

        [cell.graphView setArray:[[self.itemsArray objectAtIndex:indexPath.row] objectForKey:@"points"]];
    }
}

- (void) deleteBtnCall:(UIButton*) btn {
    
    StatListCell *cell = (StatListCell *)[self.myTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:selectedRow inSection:0]];
    [cell setCellSelected:NO];

    selectedRow = unselectedRow;
    
    [self.myTable beginUpdates];
    [self.myTable endUpdates];

}


#pragma mark  - Search

- (IBAction) searchBtnCall {
    
    [MY_APP_DELEGATE showDevelopmentMessage];
}

@end
