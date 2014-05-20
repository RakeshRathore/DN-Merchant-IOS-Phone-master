//
//  Stores.m
//  Discount Merchant
//
//  Created by Sajith KG on 04/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "Stores.h"
#import "AppDelegate.h"
#import "StoreCateCell.h"

@interface Stores () {

    IBOutlet UITableView *myTable;
    NSMutableArray *itemsArray;
    NSMutableArray *imagesArray;
    
    NSInteger selectedRow;
    
    IBOutlet UIButton *arrowUpBtn,*arrowDownBtn;
}

@end

@implementation Stores

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
    
    selectedRow = 4;
    
    itemsArray = [[NSMutableArray alloc] initWithObjects:@"  Luci Ristorante",@"  Auxillary Lounge",@"  Fireside Pizza",@"  Harbor Cafe",@"  La Amelia",@"  Luci Ristorante",@"  Auxillary Lounge",@"  Fireside Pizza",@"  Harbor Cafe",@"  La Amelia",nil];

    imagesArray = [[NSMutableArray alloc] initWithObjects:@"Luci_Ristorante.jpg",@"Auxillary_Lounge.jpg",@"Fireside_Pizza.jpg",@"Harbor_Cafe.jpg",@"La_Amelia.jpg",@"Luci_Ristorante.jpg",@"Auxillary_Lounge.jpg",@"Fireside_Pizza.jpg",@"Harbor_Cafe.jpg",@"La_Amelia.jpg", nil];
    
    [myTable registerNib:[UINib nibWithNibName:@"StoreCateCell" bundle:nil]
  forCellReuseIdentifier:@"StoreCateCell"];
    
    [myTable reloadData];
    
    arrowUpBtn.enabled=NO;
}

#pragma mark  - Table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [itemsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StoreCateCell *cell = (StoreCateCell *)[tableView dequeueReusableCellWithIdentifier:@"StoreCateCell"];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
//    NSDictionary *currentDict=[itemsArray objectAtIndex:indexPath.row];
    
    [cell.nameLbl setText:[itemsArray objectAtIndex:indexPath.row]];
    [cell.bgImg setImage:[UIImage imageNamed:[imagesArray objectAtIndex:indexPath.row]]];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
    arrowUpBtn.enabled=YES;
    arrowDownBtn.enabled=YES;
    
    if (myTable.contentOffset.y == 0) {
        arrowUpBtn.enabled=NO;
    }
    
    if (myTable.contentOffset.y == myTable.contentSize.height - myTable.frame.size.height) {
        arrowDownBtn.enabled=NO;
    }
}


#pragma mark  - IBActions

- (IBAction) addBtnCall {

    [MY_APP_DELEGATE showDevelopmentMessage];
}

- (IBAction) arrowUpBtnCall {
    
    float next=myTable.contentOffset.y - myTable.frame.size.height + 110;
    
    if (next < 0) {
        next = 0;
    }
    
    [myTable setContentOffset:CGPointMake(0, next) animated:YES];
}

- (IBAction) arrowDownBtnCall {
    
    float contentSizeMax = myTable.contentSize.height - myTable.frame.size.height;
    
    float next=myTable.contentOffset.y+myTable.frame.size.height -110;
    
    if (next > contentSizeMax) {
        next = contentSizeMax;
    }
    
    [myTable setContentOffset:CGPointMake(0, next) animated:YES];
}




@end
