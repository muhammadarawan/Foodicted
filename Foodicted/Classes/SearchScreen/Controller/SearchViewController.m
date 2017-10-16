//
//  SearchViewController.m
//  Foodicted
//
//  Created by ali on 10/12/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import "SearchViewController.h"
#import "AFNetworking.h"
@interface SearchViewController ()
@property (strong,atomic) NSString *api;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *searchName=@"lasagna";
//    NSString *apiKey=@"8bf0ea213bed1c7191bf4096260fa37f";
//     _api=[[NSString alloc]initWithFormat:@"http://food2fork.com/api/search?key=%@&q=%@",apiKey,searchName];
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
////    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
//    
//    [manager GET:_api parameters: nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"JSON: %@", responseObject[@"count"]);
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
