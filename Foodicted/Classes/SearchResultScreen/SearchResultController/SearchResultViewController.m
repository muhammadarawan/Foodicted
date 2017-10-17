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
@interface SearchResultViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet SearchResultView *searchResultTableView;
@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchResultTableView.resultTableView.delegate=self;
    _searchResultTableView.resultTableView.dataSource=self;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listOfRecipies.count.integerValue;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell=(TableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    Recipie *r=(Recipie*) [_listOfRecipies.recipiesListArray objectAtIndex:indexPath.row];
    cell.recipieTitle.text=r.title;
    cell.recipieRank.text=[r.social_rank stringValue];
    
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
@end
