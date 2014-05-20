//
//  Profile.m
//  Discount Merchant
//
//  Created by Sajith KG on 14/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "Profile.h"
#import "AppDelegate.h"

@interface Profile () {

    IBOutlet UIView *contentView;
    IBOutlet UILabel *nameLbl,*jobLbl,*addressLbl;
    IBOutlet UILabel *followerHdr,*followingHdr,*shotsHdr,*emailHdr,*websiteHdr;
    IBOutlet UILabel *followerValue,*followingValue,*shotsValue,*emailValue,*websiteValue;
    IBOutlet UIButton *followBtn;
    
    IBOutlet UITableView *tblView;
    NSMutableArray *itemsArray;
}


@end

@implementation Profile

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
    
    if (self.isPushed) {
        [self.navigationController popViewControllerAnimated:YES];
    }else {
    
        [MY_APP_DELEGATE.rootVC presentMenuViewController];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.topbarView.backgroundColor = TOPBAR_BG_COLOR;
    self.titleLbl.font = LATO_BOLD(20);
    
    self.scrollView.contentSize = CGSizeMake(contentView.frame.size.width, contentView.frame.size.height);
    
    nameLbl.text = @"Half off food, drinks and apps";
    jobLbl.text = @"Store #125";
    addressLbl.text = @"Chicago, IL";
    
    nameLbl.font = LATO_REGULAR(20);
    
    jobLbl.font = LATO_REGULAR(12);
    jobLbl.textColor = RGB(226, 226, 226);
    
    addressLbl.font = LATO_REGULAR(10);
    
    
    followerHdr.font = LATO_BOLD(12);
    followerHdr.textColor = RGB(51, 57, 66);
    followerValue.font = LATO_REGULAR(15);
    followerValue.textColor = RGB(92, 101, 110);
    
    followingHdr.font = LATO_BOLD(12);
    followingHdr.textColor = RGB(51, 57, 66);
    followingValue.font = LATO_REGULAR(15);
    followingValue.textColor = RGB(92, 101, 110);
    
    shotsHdr.font = LATO_BOLD(12);
    shotsHdr.textColor = RGB(51, 57, 66);
    shotsValue.font = LATO_REGULAR(15);
    shotsValue.textColor = RGB(92, 101, 110);
    
    
    emailHdr.font = LATO_REGULAR(15);
    emailHdr.textColor = RGB(51, 57, 66);
    emailValue.font = LATO_REGULAR(13);
    emailValue.textColor = RGB(151, 154, 158);
    
    websiteHdr.font = LATO_REGULAR(15);
    websiteHdr.textColor = RGB(51, 57, 66);
    websiteValue.font = LATO_REGULAR(13);
    websiteValue.textColor = RGB(151, 154, 158);
    
    [followBtn setTitleColor:RGB(51, 57, 66) forState:UIControlStateNormal];
    followBtn.titleLabel.font =LATO_REGULAR(13);
    
    tblView.delegate = self;
    tblView.dataSource = self;
    
    
    NSArray *keysArray = @[@"type",@"answer"];
    
    NSArray *valueArray1 = @[@"Date Range",@"April 2, 2014 - May 2,2014"];
    
    NSArray *valueArray2 = @[@"Repeat",@"Weekend"];
    
    NSArray *valueArray3 = @[@"Time Offered",@"10am - 10pm"];
    
    NSArray *valueArray4 = @[@"Locations",@"Store #221, Store #224, Store #227"];
    
    NSArray *valueArray5 = @[@"Discount Type",@"Discount $20 for $40"];
    
    NSArray *valueArray6 = @[@"Discount Description",@"Come in today an get half off our menu.  We are a new restaurant in the neighborhood and have the best pub fare. Plus we are a great location for watching the big game this weekend."];
    
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjects:valueArray1 forKeys:keysArray];
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjects:valueArray2 forKeys:keysArray];
    NSDictionary *dict3 = [NSDictionary dictionaryWithObjects:valueArray3 forKeys:keysArray];
    NSDictionary *dict4 = [NSDictionary dictionaryWithObjects:valueArray4 forKeys:keysArray];
    NSDictionary *dict5 = [NSDictionary dictionaryWithObjects:valueArray5 forKeys:keysArray];
    NSDictionary *dict6 = [NSDictionary dictionaryWithObjects:valueArray6 forKeys:keysArray];
    
    itemsArray = [[NSMutableArray alloc] initWithObjects:dict1,dict2,dict3,dict4,dict5,dict6,nil];


}

#pragma mark  - UITableView Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [itemsArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:17.0];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:17.0];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    
    
    NSDictionary *currentDict=[itemsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [currentDict objectForKey:@"type"];
    cell.detailTextLabel.text = [currentDict objectForKey:@"answer"];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark  - Search

- (IBAction) searchBtnCall {
    
    [MY_APP_DELEGATE showDevelopmentMessage];
}


#pragma mark  - Options

- (IBAction) locationBtnCall {
    
    [MY_APP_DELEGATE showDevelopmentMessage];
}

- (IBAction) phoneBtnCall {
    
    [MY_APP_DELEGATE showDevelopmentMessage];
}

- (IBAction) chatBtnCall {
    
    [MY_APP_DELEGATE showDevelopmentMessage];
}

- (IBAction) flagBtnCall {
    
    [MY_APP_DELEGATE showDevelopmentMessage];
}

- (IBAction) followBtnCall {
    
    [MY_APP_DELEGATE showDevelopmentMessage];
}

- (IBAction) facebookBtnCall {
    
    [MY_APP_DELEGATE showDevelopmentMessage];
}

- (IBAction) twitterBtnCall {
    
    [MY_APP_DELEGATE showDevelopmentMessage];
}

- (IBAction) googlePlusBtnCall {
    
    [MY_APP_DELEGATE showDevelopmentMessage];
}



@end
