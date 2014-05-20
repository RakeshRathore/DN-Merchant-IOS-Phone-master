//
//  MultiSelect.h
//  Discount Merchant
//
//  Created by Sajith KG on 26/03/14.
//  Copyright (c) 2014 Sajith KG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiSelect : UIViewController

@property (nonatomic,copy) NSString *titleStr;
@property (nonatomic,readwrite) int currentIndex;

@property(nonatomic,weak) id delegate;

- (void) setMultiSelectWithBaseArray:(NSMutableArray*) baseAry andSelectedArray:(NSMutableArray*) selectedAry;


@end
