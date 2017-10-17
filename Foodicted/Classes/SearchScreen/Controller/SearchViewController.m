//
//  SearchViewController.m
//  Foodicted
//
//  Created by ali on 10/12/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import "SearchViewController.h"
#import "AFNetworking.h"
#import "SearchView.h"
#import "SearchApiHandler.h"
#include "SearchResultViewController.h"
#include "ListOfRecipies.h"
@interface SearchViewController ()
//@property (strong,nonatomic) SearchView *searchView;
@property (strong,nonatomic) NSDictionary *searchData;
@property (strong, nonatomic) IBOutlet SearchView *searchView;
@property (strong,nonatomic) ListOfRecipies *listOfRecipies;
@property (strong,nonatomic) SearchApiHandler *searchHandlerObj;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchHandlerObj=[SearchApiHandler alloc];
//    _searchView =[SearchView alloc];
//    _searchView=[SearchView alloc];
    [self setCallForResponce];
    [self setCallForSearchButtonPress];
}

#pragma - setCallForSearchButton

-(void)setCallForSearchButtonPress{

    void (^searchCall)(NSString* searchText)=^(NSString *searchText){
        [_searchHandlerObj searchApiCall:searchText];
    };
    _searchView.searchCall=searchCall;
}

#pragma - setCallForHandlerResponce

-(void)setCallForResponce{
    
    void (^callFroRespnseFromHandler)(NSDictionary* response)=^(NSDictionary *response){
        _searchData=response;
        _listOfRecipies=[MTLJSONAdapter modelOfClass:[ListOfRecipies class] fromJSONDictionary:response error:nil];
        SearchResultViewController *controler = [[SearchResultViewController alloc] init];
        controler.listOfRecipies=_listOfRecipies;
        [self.navigationController pushViewController:controler animated:YES];
    };
    _searchHandlerObj.returnResponceToController=callFroRespnseFromHandler;
}

-(void)viewDidAppear:(BOOL)animated{
   
}
@end
