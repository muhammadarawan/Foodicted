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
@property (strong,nonatomic)    UIBarButtonItem *shareButton;

@end

@implementation RecipieWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _shareButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(share:)];
    self.navigationItem.rightBarButtonItem = _shareButton;
    NSURL *url = [NSURL URLWithString:_recipieURL];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:urlRequest];
    self.navigationController.navigationBar.topItem.title = @"Recipies";

}

- (void)share:(id)sender {
    NSString *textToShare = @"I found a great recipie here at Recipeanut app! Check this link out! \n";
    NSURL *myWebsite = [NSURL URLWithString:_recipieURL];
    
    NSArray *objectsToShare = @[textToShare, myWebsite];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    NSArray *excludeActivities = @[UIActivityTypeAirDrop,
                                   UIActivityTypePrint,
                                   UIActivityTypeAssignToContact,
                                   UIActivityTypeSaveToCameraRoll,
                                   UIActivityTypeAddToReadingList,
                                   UIActivityTypePostToFlickr,
                                   UIActivityTypePostToVimeo];
    
    activityVC.excludedActivityTypes = excludeActivities;
    
    [self presentViewController:activityVC animated:YES completion:nil];
}
@end
