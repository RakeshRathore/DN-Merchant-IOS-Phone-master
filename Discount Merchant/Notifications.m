//
//  Notifications.m
//  Discount Merchant
//
//  Created by Sajith KG on 28/02/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import "Notifications.h"
#import "AppDelegate.h"
#import "NotificationCell.h"

//#import "NSAttributedString+Attributes.h"
//#import "OHASBasicHTMLParser.h"
//#import "OHASBasicMarkupParser.h"
//#import "NSAttributedString+Attributes.h"

@interface Notifications () {

    IBOutlet UITableView *myTable;
    NSMutableArray *itemsArray;
}

@end

@implementation Notifications

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
    
    NSArray *keysArray = @[@"activityID",@"activityType",@"userName",@"discountName",@"locationName",@"displayPicture",@"time",@"titleAttributedText",@"cellHeight"];
    
    NSArray *valueArray1 = @[@"1",@"captureDiscount",@"Boopathi",@"Discount 1",@"",@"sample_profile.png",@"44 minutes",@"",@"77"];
    
    NSArray *valueArray2 = @[@"2",@"redeemDiscount",@"Sachin Tendulkar",@"Discount 2",@"",@"doctor.jpg",@"22 hours",@"",@"77"];
    
    NSArray *valueArray3 = @[@"3",@"favedLocation",@"Ilayaraja",@"Discount 3",@"Bangalore",@"using-a-Laptop-outside.jpg",@"44 minutes",@"",@"77"];
    
    NSArray *valueArray4 = @[@"1",@"captureDiscount",@"David",@"Discount 4",@"",@"sample_profile.png",@"44 minutes",@"",@"77"];
    
    NSArray *valueArray5 = @[@"2",@"redeemDiscount",@"Sachin Tendulkar",@"Discount 5",@"",@"doctor.jpg",@"5 hours",@"",@"77"];
    
    NSArray *valueArray6 = @[@"3",@"favedLocation",@"Ilayaraja",@"Discount 6",@"Bangalore",@"using-a-Laptop-outside.jpg",@"44 minutes",@"",@"77"];
    
    NSArray *valueArray7 = @[@"1",@"captureDiscount",@"Boopathi",@"Discount 7",@"",@"sample_profile.png",@"44 minutes",@"",@"77"];
    
    NSArray *valueArray8 = @[@"2",@"redeemDiscount",@"Sachin Tendulkar",@"Discount 8",@"",@"doctor.jpg",@"3 days",@"",@"77"];
    
    NSArray *valueArray9 = @[@"3",@"favedLocation",@"Ilayaraja",@"Discount 9",@"Bangalore",@"using-a-Laptop-outside.jpg",@"5 days",@"",@"77"];
    
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionaryWithDictionary:[NSDictionary dictionaryWithObjects:valueArray1 forKeys:keysArray]];
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionaryWithDictionary:[NSDictionary dictionaryWithObjects:valueArray2 forKeys:keysArray]];
    NSMutableDictionary *dict3 = [NSMutableDictionary dictionaryWithDictionary:[NSDictionary dictionaryWithObjects:valueArray3 forKeys:keysArray]];
    NSMutableDictionary *dict4 = [NSMutableDictionary dictionaryWithDictionary:[NSDictionary dictionaryWithObjects:valueArray4 forKeys:keysArray]];
    NSMutableDictionary *dict5 = [NSMutableDictionary dictionaryWithDictionary:[NSDictionary dictionaryWithObjects:valueArray5 forKeys:keysArray]];
    NSMutableDictionary *dict6 = [NSMutableDictionary dictionaryWithDictionary:[NSDictionary dictionaryWithObjects:valueArray6 forKeys:keysArray]];
    NSMutableDictionary *dict7 = [NSMutableDictionary dictionaryWithDictionary:[NSDictionary dictionaryWithObjects:valueArray7 forKeys:keysArray]];
    NSMutableDictionary *dict8 = [NSMutableDictionary dictionaryWithDictionary:[NSDictionary dictionaryWithObjects:valueArray8 forKeys:keysArray]];
    NSMutableDictionary *dict9 = [NSMutableDictionary dictionaryWithDictionary:[NSDictionary dictionaryWithObjects:valueArray9 forKeys:keysArray]];
    
    itemsArray = [[NSMutableArray alloc] initWithObjects:dict1,dict2,dict3,dict4,dict5,dict6,dict7,dict8,dict9,nil];
    
    //itemsArray = [[NSMutableArray alloc] initWithObjects:dict1,dict2,nil];
    
    [myTable registerNib:[UINib nibWithNibName:@"NotificationCell" bundle:nil]
       forCellReuseIdentifier:@"NotificationCell"];
    
    for (int i=0; i< [itemsArray count]; i++) {
        [self setAttributedString:i : itemsArray];
    }
    
    
    [myTable reloadData];
}

-(void)setAttributedString :(int)i :(NSMutableArray*)tempArr {

    OHParagraphStyle* paragraphStyle = [OHParagraphStyle defaultParagraphStyle];
    paragraphStyle.textAlignment = kCTTextAlignmentLeft;
    paragraphStyle.lineBreakMode = kCTLineBreakByWordWrapping;
    paragraphStyle.firstLineHeadIndent = 0.f; // indentation for first line
    paragraphStyle.lineSpacing = 3.f; // increase space between lines by 3 points
    
    switch ([[[tempArr objectAtIndex:i] objectForKey:@"activityID"]intValue]) {
            
        case 1:  // capture Discount
        {
            
            NSMutableAttributedString *title_attributedText;
            
            NSString  *title_text;
            
            title_text = [NSString stringWithFormat:@"%@ captured a discount %@.",[[[tempArr objectAtIndex:i] objectForKey:@"userName"] capitalizedString],[[[tempArr objectAtIndex:i] objectForKey:@"discountName"] capitalizedString]];
            
            title_attributedText = [[NSMutableAttributedString alloc] initWithString:title_text];
            
            title_attributedText = [[NSMutableAttributedString alloc] initWithString:title_text];
            NSRange range = [title_text rangeOfString:[[[tempArr objectAtIndex:i] objectForKey:@"userName"] capitalizedString]];
            NSRange range1;
            range1.location=[title_text length]-([[[[tempArr objectAtIndex:i] objectForKey:@"discountName"] capitalizedString] length]+1);
            range1.length=[[[[tempArr objectAtIndex:i] objectForKey:@"discountName"] capitalizedString] length];
            
            [title_attributedText setFont:LATO_REGULAR(15) range:NSMakeRange(0, [title_text length])];
            [title_attributedText setTextColor:[UIColor blackColor] range:NSMakeRange(0, [title_text length])];
            
            [title_attributedText setParagraphStyle:paragraphStyle];
            
            [title_attributedText setLink:[NSURL URLWithString:[NSString stringWithFormat: @"group_id=%@",[[tempArr objectAtIndex:i] objectForKey:@"group_id"]]] range:range1];
            
            [title_attributedText setLink:[NSURL URLWithString:[NSString stringWithFormat:@"user_id=%@,buddy_status=%@,group_member_status=%@",[[tempArr objectAtIndex:i] objectForKey:@"user_id"],[[tempArr objectAtIndex:i] objectForKey:@"buddy_status"],[[tempArr objectAtIndex:i] objectForKey:@"group_member_status"]]] range:range];
            
            [[tempArr objectAtIndex:i] setObject:title_attributedText forKey:@"titleAttributedText"];
            
            NSLog(@"%@",title_attributedText);
            
            break;
        }
            
        case 2:  // Redeem Discount
        {
            
            NSMutableAttributedString *title_attributedText;
            
            NSString  *title_text;
            
            title_text = [NSString stringWithFormat:@"%@ redeemed a discount %@.",[[[tempArr objectAtIndex:i] objectForKey:@"userName"] capitalizedString],[[[tempArr objectAtIndex:i] objectForKey:@"discountName"] capitalizedString]];
            
            title_attributedText = [[NSMutableAttributedString alloc] initWithString:title_text];
            
            title_attributedText = [[NSMutableAttributedString alloc] initWithString:title_text];
            NSRange range = [title_text rangeOfString:[[[tempArr objectAtIndex:i] objectForKey:@"userName"] capitalizedString]];
            NSRange range1;
            range1.location=[title_text length]-([[[[tempArr objectAtIndex:i] objectForKey:@"discountName"] capitalizedString] length]+1);
            range1.length=[[[[tempArr objectAtIndex:i] objectForKey:@"discountName"] capitalizedString] length];
            
            [title_attributedText setFont:LATO_REGULAR(15) range:NSMakeRange(0, [title_text length])];
            [title_attributedText setTextColor:[UIColor blackColor] range:NSMakeRange(0, [title_text length])];
            
            [title_attributedText setParagraphStyle:paragraphStyle];
            
            [title_attributedText setLink:[NSURL URLWithString:[NSString stringWithFormat: @"group_id=%@",[[tempArr objectAtIndex:i] objectForKey:@"group_id"]]] range:range1];
            
            [title_attributedText setLink:[NSURL URLWithString:[NSString stringWithFormat:@"user_id=%@,buddy_status=%@,group_member_status=%@",[[tempArr objectAtIndex:i] objectForKey:@"user_id"],[[tempArr objectAtIndex:i] objectForKey:@"buddy_status"],[[tempArr objectAtIndex:i] objectForKey:@"group_member_status"]]] range:range];
            
            [[tempArr objectAtIndex:i] setObject:title_attributedText forKey:@"titleAttributedText"];
            
            NSLog(@"%@",title_attributedText);
            
            break;
        }
            
        case 3:  // capture Discount
        {
            
            NSMutableAttributedString *title_attributedText;
            
            NSString  *title_text;
            
            title_text = [NSString stringWithFormat:@"%@ favorited location %@.",[[[tempArr objectAtIndex:i] objectForKey:@"userName"] capitalizedString],[[[tempArr objectAtIndex:i] objectForKey:@"locationName"] capitalizedString]];
            
            title_attributedText = [[NSMutableAttributedString alloc] initWithString:title_text];
            
            title_attributedText = [[NSMutableAttributedString alloc] initWithString:title_text];
            NSRange range = [title_text rangeOfString:[[[tempArr objectAtIndex:i] objectForKey:@"userName"] capitalizedString]];
            NSRange range1;
            range1.location=[title_text length]-([[[[tempArr objectAtIndex:i] objectForKey:@"locationName"] capitalizedString] length]+1);
            range1.length=[[[[tempArr objectAtIndex:i] objectForKey:@"locationName"] capitalizedString] length];
            
            [title_attributedText setFont:LATO_REGULAR(15) range:NSMakeRange(0, [title_text length])];
            [title_attributedText setTextColor:[UIColor blackColor] range:NSMakeRange(0, [title_text length])];
            
            [title_attributedText setParagraphStyle:paragraphStyle];
            
            [title_attributedText setLink:[NSURL URLWithString:[NSString stringWithFormat: @"group_id=%@",[[tempArr objectAtIndex:i] objectForKey:@"group_id"]]] range:range1];
            
            [title_attributedText setLink:[NSURL URLWithString:[NSString stringWithFormat:@"user_id=%@,buddy_status=%@,group_member_status=%@",[[tempArr objectAtIndex:i] objectForKey:@"user_id"],[[tempArr objectAtIndex:i] objectForKey:@"buddy_status"],[[tempArr objectAtIndex:i] objectForKey:@"group_member_status"]]] range:range];
            
            [[tempArr objectAtIndex:i] setObject:title_attributedText forKey:@"titleAttributedText"];
            
            NSLog(@"%@",title_attributedText);
            
            break;
        }
            
    }

}

#pragma mark  - Table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [itemsArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 77;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NotificationCell *cell = (NotificationCell *)[tableView dequeueReusableCellWithIdentifier:@"NotificationCell"];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    NSDictionary *currentDict=[itemsArray objectAtIndex:indexPath.row];
    
    cell.itemPic.image = [UIImage imageNamed:[currentDict objectForKey:@"displayPicture"]];
    
    cell.timeLbl.text = [NSString stringWithFormat:@"%@ ago",[currentDict objectForKey:@"time"]];
    
//    OHAttributedLabel *label = [[OHAttributedLabel alloc] init];
    
    [cell.messageLbl setAttributedText:[currentDict objectForKey:@"titleAttributedText"]];
    
    if (indexPath.row%2==0) {
        cell.backgroundColor = [UIColor whiteColor];
    }else {
    
        cell.backgroundColor = RGB(232, 232, 232);
    }
    
    
    return cell;
}





@end
