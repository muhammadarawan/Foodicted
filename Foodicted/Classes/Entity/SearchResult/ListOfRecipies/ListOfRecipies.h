//
//  ListOfRecipies.h
//  Foodicted
//
//  Created by ali on 10/17/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface ListOfRecipies : MTLModel<MTLJSONSerializing>
@property (strong,nonatomic) NSNumber *count;
@property (strong,nonatomic) NSArray *recipiesListArray;

@end
