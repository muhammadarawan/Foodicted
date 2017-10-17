//
//  ListOfRecipies.m
//  Foodicted
//
//  Created by ali on 10/17/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import "ListOfRecipies.h"
#import "Recipie.h"
@implementation ListOfRecipies

+(NSDictionary*)JSONKeyPathsByPropertyKey{
    return @{@"count":@"count"
             ,@"recipiesListArray":@"recipes"
             };
}

+(NSValueTransformer*)recipiesListArrayJSONTransformer{
    
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Recipie class]];
}
@end
