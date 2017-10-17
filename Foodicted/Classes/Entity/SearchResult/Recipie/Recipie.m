//
//  Recipie.m
//  Foodicted
//
//  Created by ali on 10/17/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import "Recipie.h"

@implementation Recipie

+(NSDictionary*)JSONKeyPathsByPropertyKey{
    return @{
             @"publisher": @"publisher",
             @"f2f_url": @"f2f_url",
             @"title": @"title",
             @"source_url": @"source_url",
             @"recipe_id": @"recipe_id",
             @"image_url": @"image_url",
             @"social_rank": @"social_rank",
             @"publisher_url": @"publisher_url"             
             };
}
@end
