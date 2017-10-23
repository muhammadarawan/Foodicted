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
#include "UIButton+buttonDesign.h"
#include "DGActivityIndicatorView.h"
#include "UITextField+textDesign.h"
@interface SearchViewController ()
//@property (strong,nonatomic) SearchView *searchView;
@property (strong,nonatomic) NSDictionary *searchData;
@property (strong, nonatomic) IBOutlet SearchView *searchView;
@property (strong,nonatomic) ListOfRecipies *listOfRecipies;
@property (strong,nonatomic) SearchApiHandler *searchHandlerObj;

@property (strong,nonatomic)  DGActivityIndicatorView *activityIndicatorView;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchHandlerObj=[SearchApiHandler alloc];
self.searchView.searchTextField.delegate = self;
    [self setCallForResponce];
    [self setCallForSearchButtonPress];
     _activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeDoubleBounce tintColor:[UIColor colorNamed:@"yellowish"] size:100.0f];
    _activityIndicatorView.frame = CGRectMake(_searchView.frame.size.width/2, _searchView.frame.size.height/2, 50.0f, 50.0f);
    [self.searchView addSubview:_activityIndicatorView];
    self.navigationController.navigationBar.hidden=YES;
    self.navigationController.navigationBar.tintColor=[UIColor colorNamed:@"yellowish"];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.searchView.searchTextField) {
        [_searchView.searchTextField resignFirstResponder];
        [self.searchView.searchButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        return YES;
        ;
    }
    return YES;
}
#pragma - setCallForSearchButton

-(void)setCallForSearchButtonPress{

    void (^searchCall)(NSString* searchText)=^(NSString *searchText){
        
        if(![self.searchView.searchTextField.text isEqual:@""]){
        [_activityIndicatorView startAnimating];

            [_searchHandlerObj searchApiCall:searchText];
        }
        else{
            UIAlertController * alert1 = [UIAlertController
                                          alertControllerWithTitle:@""
                                          message:@"Please Enter Recipie Name"
                                          preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* okayButton = [UIAlertAction
                                         actionWithTitle:@"Okay"
                                         style:UIAlertActionStyleDefault
                                         handler:^(UIAlertAction * action) {
                                         }];
            [alert1 addAction:okayButton];
            [self presentViewController:alert1 animated:YES completion:nil];
        }
    };
    _searchView.searchCall=searchCall;
}

#pragma - setCallForHandlerResponce

-(void)setCallForResponce{
    
    void (^callFroRespnseFromHandler)(NSDictionary* response)=^(NSDictionary *response){
        _searchData=response;
        _listOfRecipies=[MTLJSONAdapter modelOfClass:[ListOfRecipies class] fromJSONDictionary:response error:nil];
        [_activityIndicatorView stopAnimating];

        if(_listOfRecipies.count.integerValue != 0){
       
        SearchResultViewController *controler = [[SearchResultViewController alloc] init];
        controler.listOfRecipies=_listOfRecipies;
            [self.navigationController pushViewController:controler animated:YES];
        }
        else{
            
            UIAlertController * alert1 = [UIAlertController
                                          alertControllerWithTitle:@""
                                          message:@"Sorry we can't find any recipie with that name!Please Try Another Search"
                                          preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* okayButton = [UIAlertAction
                                         actionWithTitle:@"Okay"
                                         style:UIAlertActionStyleDefault
                                         handler:^(UIAlertAction * action) {
                                         }];
            [alert1 addAction:okayButton];
            [self presentViewController:alert1 animated:YES completion:nil];
        
        }
    };
    _searchHandlerObj.returnResponceToController=callFroRespnseFromHandler;
}
-(void) configureTapGesture{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(submitTapped:)];
    [self.searchView.searchLable addGestureRecognizer:tap];
}

-(void) submitTapped:(UITapGestureRecognizer*)tap{
  
    [self.searchView searchButtonAciton:nil];
    
}
-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=YES;

    self.searchView.searchButton=[self.searchView.searchButton setbuttonAttributes];
    self.searchView.searchLable.textColor=[UIColor whiteColor];
    self.searchView.searchTextField=[self.searchView.searchTextField setSearchTextViewProperties];
}
@end
