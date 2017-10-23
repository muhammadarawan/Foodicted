//
//  SearchResultViewController.m
//  Foodicted
//
//  Created by ali on 10/16/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import "SearchResultViewController.h"
#import "SearchResultView.h"
#include "TableViewCell.h"
#import "Recipie.h"
#include "ListOfRecipies.h"
#include "RecipieWebViewController.h"
#include "UIImageView+Helpers.h"
@interface SearchResultViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet SearchResultView *searchResultTableView;
@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchResultTableView.resultTableView.delegate=self;
    _searchResultTableView.resultTableView.dataSource=self;
    self.navigationController.navigationBar.hidden=NO;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listOfRecipies.count.integerValue;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   TableViewCell  *cell=(TableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
  
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    [cell layoutSubviews];
    cell.imageView.clipsToBounds = YES;
    cell.imageView.layer.cornerRadius = CGRectGetWidth(cell.imageView.frame) / 2;
    cell.layer.borderWidth=1;
    cell.layer.borderColor=[[UIColor lightGrayColor] CGColor];
    Recipie *r=(Recipie*) [_listOfRecipies.recipiesListArray objectAtIndex:indexPath.row];
    cell.recipieTitle.text=r.title;
    NSString *rankNumber=[r.social_rank stringValue];
    if([rankNumber isEqualToString:@"100"]){
    cell.recipieRank.text=[rankNumber substringWithRange:NSMakeRange(0, 3)];
    }
    else{
        cell.recipieRank.text=[rankNumber substringWithRange:NSMakeRange(0, 5)];
        
    }
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: r.image_url]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            // WARNING: is the cell still using the same data by this point??
            cell.dishImage.image = [UIImage imageWithData: data];
            
        });
    });        return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        return 85;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    RecipieWebViewController *recipieController=[[RecipieWebViewController alloc] init];
    Recipie *r=(Recipie*) [_listOfRecipies.recipiesListArray objectAtIndex:indexPath.row];
    recipieController.recipieURL=r.source_url;
    [self.navigationController pushViewController:recipieController animated:YES];

}

#pragma - cellDesign
-(TableViewCell*)cellDesign:(TableViewCell*)cell{
    cell.dishImage=[cell.dishImage setBGImageAttributes];
    return cell;
}

-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
}
@end
