//
//  SearchApiCall.h
//  Foodicted
//
//  Created by ali on 10/15/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchApiCall : NSObject
@property (strong,nonatomic) void(^returnResponce)(NSDictionary*);

-(void)searcApiCall:(NSString*)searchText;

@end
