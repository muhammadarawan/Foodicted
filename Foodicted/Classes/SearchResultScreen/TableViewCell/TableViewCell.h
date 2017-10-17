//
//  TableViewCell.h
//  Foodicted
//
//  Created by ali on 10/17/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *dishImage;
@property (strong, nonatomic) IBOutlet UILabel *recipieTitle;
@property (strong, nonatomic) IBOutlet UILabel *recipieRank;

@end
