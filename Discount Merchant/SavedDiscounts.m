//
//  SavedDiscounts.m
//  Discount Merchant
//
//  Created by Sajith KG on 04/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "SavedDiscounts.h"
#import "AppDelegate.h"
#import "SavedDiscountCell.h"
#import "Profile.h"

#define FAST_ANIMATION_DURATION 0.15
#define SLOW_ANIMATION_DURATION 0.75
#define PAN_CLOSED_X 0
#define PAN_OPEN_X 200

@interface SavedDiscounts () {

    IBOutlet UITableView *myTable;
    NSMutableArray *itemsArray;
    
    NSDictionary *dict1,*dict2,*dict3,*dict4,*dict5;

}

@end

@implementation SavedDiscounts

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
    
    NSArray *keysArray = @[@"discountTitle",@"discountPrice",@"originalPrice",@"percentageSavings",@"companyName",@"Expiration",@"whatsIncluded",@"storeID",@"address",@"city",@"state",@"zip",@"phoneNo",@"imageURL",@"latitude",@"longitude",@"pinType",@"youtube_link",@"Notification",@"Category",@"Rating",@"Color"];
    
    NSArray *valueArray1 = @[@"Half off food, drinks and apps",@"15",@"25",@"60%",@"Better Burgers",@"5 Days",@"Come in and get any meal, drink or appetizer half off. Hurry in the offer is only availble for another 5 days.",@"9987553",@"217 Thayer St",@"Bolingbrook",@"RI",@"2906",@"(401) 228-7373",@"Burger.jpg",@"41.6265",@"-87.3650",@"map_pin_hotel.png",@"http://www.youtube.com/v/zL0CCsdS1cE",@"4",@"Category 1",@"1",@"red"];
    
    NSArray *valueArray2 = @[@"Speedy Oil Change ",@"30",@"50",@"60%",@"Midwest Motors ",@"3 Days",@"The time is near, Winter is here come on down to Motors and get a Speedy Oil Change. ",@"2231588",@"2553 W Chicago Ave",@"Chicago",@"IL",@"60622",@"(773) 235-6500",@"mechanic.jpg",@"41.5255",@"-87.3740",@"map_pin_beer.png",@"http://www.youtube.com/v/impZ7krcPzI",@"12",@"Category 4",@"4",@"grey"];
    
    NSArray *valueArray3 = @[@"Summer Fashion Blowout ",@"20",@"30",@"67%",@"Bent",@"3 Days",@"Simply UNBEATABLE deals on your favorites tanks, tees, jeans and accessories. Deals go live daily, take advantage and shop. ",@"6458887",@"519 N. Milwaukee Avenue(near N. Damen/North Ave.)",@"Chicago",@"IL",@"60622",@"(773) 227-5300",@"store-interior.jpg",@"41.6355",@"-87.2740",@"map_pin_coffee.png",@"http://www.youtube.com/v/impZ7krcPzI",@"6",@"Category 2",@"3",@"green"];
    
    NSArray *valueArray4 = @[@"Vacation on the Islands of Chicago",@"45",@"65",@"69%",@"Resort Spa",@"5 Days ",@"Partake in this opportuntity of a lifetime to dine, relax, and enjoy life. Come down to our fabulous hotel and spa to take a load off.",@"6213479",@"233 S Wacker Dr",@"Chicago",@"IL",@"60606",@"(312) 875-9696",@"beach.jpg",@"41.6255",@"-87.8040",@"map_pin_hotel.png",@"http://www.youtube.com/v/rjmPghd6fUQ",@"7",@"Category 3",@"5",@"red"];
    
    NSArray *valueArray5 = @[@"A Pig on Every Grill",@"25",@"35",@"71%",@"Slab Of Ribs",@"7 Days",@"Slab of Ribs will be hosting the biggest all you can each barbecue week. If you can eat what \"WE\" put on your plate your meal is on us.",@"2155479",@"1470 East Touhy Avenue",@"Des Planies",@"IL",@"60016",@"(847) 391-9860",@"BBQ.jpg",@"41.6075",@"-87.6750",@"map_pin_beer.png",@"http://www.youtube.com/v/zL0CCsdS1cE",@"4",@"Category 1",@"2",@"green"];
    
    dict1 = [NSDictionary dictionaryWithObjects:valueArray1 forKeys:keysArray];
    dict2 = [NSDictionary dictionaryWithObjects:valueArray2 forKeys:keysArray];
    dict3 = [NSDictionary dictionaryWithObjects:valueArray3 forKeys:keysArray];
    dict4 = [NSDictionary dictionaryWithObjects:valueArray4 forKeys:keysArray];
    dict5 = [NSDictionary dictionaryWithObjects:valueArray5 forKeys:keysArray];
    
    itemsArray = [[NSMutableArray alloc] initWithObjects:dict1,dict2,dict3,dict4,dict5,nil];
    
    [itemsArray addObjectsFromArray:@[dict1,dict2,dict3,dict4,dict5,dict1,dict2,dict3,dict4,dict5,dict1,dict2,dict3,dict4,dict5,dict1,dict2,dict3,dict4,dict5,dict1,dict2,dict3,dict4,dict5]];
    
    [myTable registerNib:[UINib nibWithNibName:@"SavedDiscountCell" bundle:nil]
       forCellReuseIdentifier:@"SavedDiscountCell"];
    
    [myTable reloadData];
}

#pragma mark  - Table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [itemsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SavedDiscountCell *cell = (SavedDiscountCell *)[tableView dequeueReusableCellWithIdentifier:@"SavedDiscountCell"];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [panGestureRecognizer setDelegate:self];
    [cell addGestureRecognizer:panGestureRecognizer];
    
    [self snapView:cell.topView toX:PAN_CLOSED_X animated:YES];
    
    NSDictionary *currentDict=[itemsArray objectAtIndex:indexPath.row];
    
    [cell.itemPic setImage:[UIImage imageNamed:[currentDict objectForKey:@"imageURL"]]];
    
    [cell.itemLbl setText:[currentDict objectForKey:@"discountTitle"]];
    [cell.notifyCountLbl setText:[currentDict objectForKey:@"Notification"]];
    [cell.categoryLbl setText:[currentDict objectForKey:@"Category"]];
    
    [cell setStatusColor:[currentDict objectForKey:@"Color"]];
    [cell showRating:[[currentDict objectForKey:@"Rating"] intValue]];

    [cell.tickBtn addTarget:self action:@selector(tickBtnCall:) forControlEvents:UIControlEventTouchUpInside];
    [cell.chatBtn addTarget:self action:@selector(chatBtnCall:) forControlEvents:UIControlEventTouchUpInside];
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnCall:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Profile *profile = [self.storyboard instantiateViewControllerWithIdentifier:@"Profile"];
    profile.isPushed=YES;
    [self.navigationController pushViewController:profile animated:YES];
   
}

#pragma mark -
#pragma mark  Gesture recognizer delegate

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)panGestureRecognizer{
    
    if ([panGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        
        SavedDiscountCell *cell = (SavedDiscountCell *)[panGestureRecognizer view];
        CGPoint translation = [panGestureRecognizer translationInView:[cell superview]];
        return (fabs(translation.x) / fabs(translation.y) > 1) ? YES : NO;
    }
    
    return YES;
}

- (void) toggleBackgroundFor:(UIView*) view andX:(float)x {
    
    SavedDiscountCell *cell;
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7")) {
        cell = (SavedDiscountCell*)view.superview.superview.superview;
    }

    if (x>0) {
        view.superview.backgroundColor = STATUS_BAR_COLOR;
        cell.lineImg.backgroundColor = [UIColor clearColor];
        
        DLog(@"%@, %f",cell, x);
        
    }else {
        view.superview.backgroundColor = [UIColor whiteColor];
        cell.lineImg.backgroundColor = RGB(239, 239, 239);
    }

}

-(void)snapView:(UIView *)view toX:(float)x animated:(BOOL)animated{
    
    [self toggleBackgroundFor:view andX:x];
    
    if (animated) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [UIView setAnimationDuration:FAST_ANIMATION_DURATION];
    }
    
    [view setTransform:CGAffineTransformMakeTranslation(x, 0)];
    
    if (animated) {
        [UIView commitAnimations];
    }
}

-(void)handlePan:(UIPanGestureRecognizer *)panGestureRecognizer{
    
    float threshold = PAN_OPEN_X/2.0;
    float vX = 0.0;
    float compare;
    
    NSIndexPath *indexPath = [myTable indexPathForCell:(SavedDiscountCell *)[panGestureRecognizer view]];
    UIView *view = ((SavedDiscountCell *)panGestureRecognizer.view).topView;
    
    switch ([panGestureRecognizer state]) {
            
        case UIGestureRecognizerStateBegan:
            
            if (self.openCellIndexPath.section != indexPath.section || self.openCellIndexPath.row != indexPath.row) {
                
                [self snapView:((SavedDiscountCell *)[myTable cellForRowAtIndexPath:self.openCellIndexPath]).topView toX:PAN_CLOSED_X animated:YES];
                [self setOpenCellIndexPath:nil];
                [self setOpenCellLastTX:0];
            }
            break;
            
            
        case UIGestureRecognizerStateEnded:
            
            vX = (FAST_ANIMATION_DURATION/2.0)*[panGestureRecognizer velocityInView:self.view].x;
            compare = view.transform.tx + vX;
            
            if (self.openCellIndexPath.row != indexPath.row) {
                [self snapView:((SavedDiscountCell *)[myTable cellForRowAtIndexPath:self.openCellIndexPath]).topView toX:PAN_CLOSED_X animated:YES];
                [self setOpenCellIndexPath:nil];
                [self setOpenCellLastTX:0];
            }
            if (compare < threshold) {
                [self snapView:view toX:PAN_CLOSED_X animated:YES];
                [self setOpenCellIndexPath:nil];
                [self setOpenCellLastTX:0];
                
            } else {
                [self snapView:view toX:PAN_OPEN_X animated:YES];
                [self setOpenCellIndexPath:[myTable indexPathForCell:(SavedDiscountCell *)panGestureRecognizer.view]];
                [self setOpenCellLastTX:view.transform.tx];
            }
            
            break;
            
            
        case UIGestureRecognizerStateChanged:
            
            compare = self.openCellLastTX+[panGestureRecognizer translationInView:self.view].x;
            
            DLog(@" %f", compare);
            
            [self toggleBackgroundFor:view andX:compare];
            
            if (compare < PAN_CLOSED_X)
                compare = PAN_CLOSED_X;
            else if (compare > PAN_OPEN_X)
                compare = PAN_OPEN_X;
            [view setTransform:CGAffineTransformMakeTranslation(compare, 0)];
            break;
            
        default:
            break;
    }
}

- (void)tickBtnCall:(id)sender {

    [MY_APP_DELEGATE showDevelopmentMessage];

}

- (void)chatBtnCall:(id)sender {
    [MY_APP_DELEGATE showDevelopmentMessage];
    
}

- (void)deleteBtnCall:(id)sender {
    [MY_APP_DELEGATE showDevelopmentMessage];
    
}



@end
