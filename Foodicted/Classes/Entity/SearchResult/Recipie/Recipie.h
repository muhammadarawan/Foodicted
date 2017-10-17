//
//  Recipie.h
//  Foodicted
//
//  Created by ali on 10/17/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Recipie : MTLModel <MTLJSONSerializing>
//{
//    "publisher": "All Recipes",
//    "f2f_url": "http://food2fork.com/view/34678",
//    "title": "World’s Best Lasagna",
//    "source_url": "http://allrecipes.com/Recipe/Worlds-Best-Lasagna/Detail.aspx",
//    "recipe_id": "34678",
//    "image_url": "http://static.food2fork.com/3242749be.jpg",
//    "social_rank": 99.9999999999999,
//    "publisher_url": "http://allrecipes.com"
//}

@property (strong,nonatomic) NSString *publisher;
@property (strong,nonatomic) NSString *f2f_url;
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *source_url;
@property (strong,nonatomic) NSString *recipe_id;
@property (strong,nonatomic) NSString *image_url;
@property (strong,nonatomic) NSNumber *social_rank;
@property (strong,nonatomic) NSString *publisher_url;


@end
