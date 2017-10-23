//
//  SearchView.h
//  Foodicted
//
//  Created by ali on 10/15/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchView : UIView
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) IBOutlet UILabel *searchLable;
@property (strong ,nonatomic) void (^searchCall)(NSString*);

- (IBAction)searchButtonAciton:(id)sender;
@end
