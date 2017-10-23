//
//  RecipieApiCall.m
//  Foodicted
//
//  Created by ali on 10/17/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import "RecipieApiCall.h"
#import "AFNetworking.h"

@implementation RecipieApiCall
-(void)recipieApiCall:(NSString *)recipieCode{
    NSString *apiKey=@"8bf0ea213bed1c7191bf4096260fa37f";
    
    NSString* apiCall=[[NSString alloc]initWithFormat:@"http://food2fork.com/api/get?key=%@&rId=%@",apiKey,recipieCode];
    apiCall=[apiCall stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    
    [manager GET:apiCall parameters: nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        // NSLog(@"JSON: %@", responseObject[@"count"]);
        _returnResponce(responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}
@end
