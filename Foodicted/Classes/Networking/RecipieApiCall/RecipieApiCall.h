//
//  RecipieApiCall.h
//  Foodicted
//
//  Created by ali on 10/17/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecipieApiCall : NSObject
@property (strong,nonatomic) void(^returnResponce)(NSDictionary*);

-(void)recipieApiCall:(NSString*)recipieCode;
@end
