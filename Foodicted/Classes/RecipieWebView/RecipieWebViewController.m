//
//  RecipieWebViewController.m
//  Foodicted
//
//  Created by ali on 10/17/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import "RecipieWebViewController.h"

@interface RecipieWebViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation RecipieWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSURL *url = [NSURL URLWithString:_recipieURL];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:urlRequest];
    self.navigationController.navigationBar.topItem.title = @"Recipies";

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
