//
//  SearchApiHandler.h
//  Foodicted
//
//  Created by ali on 10/15/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchApiHandler : NSObject

@property (strong,nonatomic) void (^returnResponceToController)(NSDictionary*);
@property (strong,nonatomic) void (^searchCall)(NSString*);

-(void)searchApiCall:(NSString*)seacrhText;

@end
