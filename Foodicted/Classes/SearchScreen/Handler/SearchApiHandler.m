//
//  SearchApiHandler.m
//  Foodicted
//
//  Created by ali on 10/15/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import "SearchApiHandler.h"
#import "SearchApiCall.h"
@implementation SearchApiHandler

-(void)searchApiCall:(NSString *)seacrhText{
    SearchApiCall *searchApiCallObj=[SearchApiCall alloc];
    [searchApiCallObj searcApiCall:seacrhText];
    searchApiCallObj.returnResponce=^(NSDictionary* response){
        _returnResponceToController(response);
    };
}

@end
