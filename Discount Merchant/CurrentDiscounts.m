//
//  CurruntDiscounts.m
//  Discount Merchant
//
//  Created by Sajith KG on 04/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "CurrentDiscounts.h"
#import "AppDelegate.h"
#import "ListCell.h"
#import "Profile.h"
#import "CreateDiscount.h"

@interface CurrentDiscounts () {

    NSDictionary *dict1,*dict2,*dict3,*dict4,*dict5;
    
    ScrollDirection scrollDirection;
    
    NSArray *dummyArray;
    CreateDiscount *createDiscountObj;
}

@end

@implementation CurrentDiscounts

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
    
    NSArray *keysArray = @[@"discountTitle",@"discountPrice",@"originalPrice",@"percentageSavings",@"companyName",@"Expiration",@"whatsIncluded",@"storeID",@"address",@"city",@"state",@"zip",@"phoneNo",@"imageURL",@"latitude",@"longitude",@"pinType",@"youtube_link"];
    
    NSArray *valueArray1 = @[@"Half off food, drinks and apps",@"15",@"25",@"60%",@"Better Burgers",@"5 Days",@"Come in and get any meal, drink or appetizer half off. Hurry in the offer is only availble for another 5 days.",@"9987553",@"217 Thayer St",@"Bolingbrook",@"RI",@"2906",@"(401) 228-7373",@"Burger.jpg",@"41.6265",@"-87.3650",@"map_pin_hotel.png",@"http://www.youtube.com/v/zL0CCsdS1cE"];
    
    NSArray *valueArray2 = @[@"Speedy Oil Change ",@"30",@"50",@"60%",@"Midwest Motors ",@"3 Days",@"The time is near, Winter is here come on down to Motors and get a Speedy Oil Change. ",@"2231588",@"2553 W Chicago Ave",@"Chicago",@"IL",@"60622",@"(773) 235-6500",@"mechanic.jpg",@"41.5255",@"-87.3740",@"map_pin_beer.png",@"http://www.youtube.com/v/impZ7krcPzI"];
    
    NSArray *valueArray3 = @[@"Summer Fashion Blowout ",@"20",@"30",@"67%",@"Bent",@"3 Days",@"Simply UNBEATABLE deals on your favorites tanks, tees, jeans and accessories. Deals go live daily, take advantage and shop. ",@"6458887",@"519 N. Milwaukee Avenue(near N. Damen/North Ave.)",@"Chicago",@"IL",@"60622",@"(773) 227-5300",@"store-interior.jpg",@"41.6355",@"-87.2740",@"map_pin_coffee.png",@"http://www.youtube.com/v/impZ7krcPzI"];
    
    NSArray *valueArray4 = @[@"Vacation on the Islands of Chicago",@"45",@"65",@"69%",@"Resort Spa",@"5 Days ",@"Partake in this opportuntity of a lifetime to dine, relax, and enjoy life. Come down to our fabulous hotel and spa to take a load off.",@"6213479",@"233 S Wacker Dr",@"Chicago",@"IL",@"60606",@"(312) 875-9696",@"beach.jpg",@"41.6255",@"-87.8040",@"map_pin_hotel.png",@"http://www.youtube.com/v/rjmPghd6fUQ"];
    
    NSArray *valueArray5 = @[@"A Pig on Every Grill",@"25",@"35",@"71%",@"Slab Of Ribs",@"7 Days",@"Slab of Ribs will be hosting the biggest all you can each barbecue week. If you can eat what \"WE\" put on your plate your meal is on us.",@"2155479",@"1470 East Touhy Avenue",@"Des Planies",@"IL",@"60016",@"(847) 391-9860",@"BBQ.jpg",@"41.6075",@"-87.6750",@"map_pin_beer.png",@"http://www.youtube.com/v/zL0CCsdS1cE"];
    
    dict1 = [NSDictionary dictionaryWithObjects:valueArray1 forKeys:keysArray];
    dict2 = [NSDictionary dictionaryWithObjects:valueArray2 forKeys:keysArray];
    dict3 = [NSDictionary dictionaryWithObjects:valueArray3 forKeys:keysArray];
    dict4 = [NSDictionary dictionaryWithObjects:valueArray4 forKeys:keysArray];
    dict5 = [NSDictionary dictionaryWithObjects:valueArray5 forKeys:keysArray];
    
    _itemsArray = [[NSMutableArray alloc] initWithObjects:dict1,dict2,dict3,dict4,dict5,nil];
    
    dummyArray = @[dict1,dict2,dict3,dict4,dict5,dict1,dict2,dict3,dict4,dict5,dict1,dict2,dict3,dict4,dict5,dict1,dict2,dict3,dict4,dict5,dict1,dict2,dict3,dict4,dict5];
    [self.itemsArray addObjectsFromArray:dummyArray];
    
    [self.myTable registerNib:[UINib nibWithNibName:@"ListCell" bundle:nil]
         forCellReuseIdentifier:@"ListCell"];
    
    [self.myTable reloadData];
}

#pragma mark  - Table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.itemsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ListCell *cell = (ListCell *)[tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    NSDictionary *currentDict=[self.itemsArray objectAtIndex:indexPath.row];
    
    cell.daysLbl.text = [currentDict objectForKey:@"Expiration"];
    cell.priceLbl.text = [NSString stringWithFormat:@"$%@",[currentDict objectForKey:@"discountPrice"]];
    
    [cell.itemPic setImage:[UIImage imageNamed:[currentDict objectForKey:@"imageURL"]]];
    
    cell.itemTitleLbl.text = [currentDict objectForKey:@"discountTitle"];
    
    cell.itemTitleLbl.hidden=YES;
    cell.itemDesLbl.hidden=YES;
    
    if (tableView.decelerating) {
        
        //temp
        cell.itemTitleLbl.hidden=NO;
        
        CGFloat animate;
        
        if (scrollDirection==ScrollDirectionDown)
            animate=50;
        else
            animate=-50;
        
        CGRect itemTitleLblFrame = cell.itemTitleLbl.frame;
        CGRect startFrame = CGRectMake(cell.itemTitleLbl.frame.origin.x, cell.itemTitleLbl.frame.origin.y+animate, cell.itemTitleLbl.frame.size.width, cell.itemTitleLbl.frame.size.height);
        
        [cell.itemTitleLbl setFrame:startFrame];
        
        //        CGFloat animationTime = self.listTable.decelerationRate;
        CGFloat animationTime = 0.6;
        
        [UIView beginAnimations:@"animateTableView" context:nil];
        [UIView setAnimationDuration:animationTime];
        [cell.itemTitleLbl setFrame:itemTitleLblFrame];
        [UIView commitAnimations];

    }else {
        cell.itemTitleLbl.hidden=NO;
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self pushDetailView:(int)indexPath.row];
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // DLog(@"scrollView %@",scrollView);
    
    if (self.lastContentOffset < scrollView.contentOffset.y)
        scrollDirection = ScrollDirectionDown;
    else
        scrollDirection = ScrollDirectionUp;
    
    self.lastContentOffset = scrollView.contentOffset.y;
}

- (void) pushDetailView :(int) index{
    
//    [discountViewController showBackButton:YES];
//    DiscountDetail *discountDetail = [[DiscountDetail alloc] init];
//    [discountDetail setCurrentItem:[self.itemsArray objectAtIndex:index]];
//    discountDetail.isSavedDeal=NO;
//    discountDetail.hidesBottomBarWhenPushed=YES;
//    [self.navigationController pushViewController:discountDetail animated:YES];
    
    
    Profile *profile = [self.storyboard instantiateViewControllerWithIdentifier:@"Profile"];
    profile.isPushed=YES;
    [self.navigationController pushViewController:profile animated:YES];
    
}

#pragma mark  - Add

- (IBAction) addBtnCall {
    
    createDiscountObj = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateDiscount"];
    [createDiscountObj  performSelector:@selector(showCamera) withObject:nil afterDelay:0.3];
    [self.navigationController pushViewController:createDiscountObj animated:YES];
    
//    CreateDiscount *createDiscount = (CreateDiscount*)[self.navigationController.viewControllers objectAtIndex:0];
//    [createDiscount  performSelector:@selector(showCamera) withObject:nil afterDelay:0.3];


    
//    [MY_APP_DELEGATE showDevelopmentMessage];
}



@end
