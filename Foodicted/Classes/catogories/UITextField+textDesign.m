//
//  UITextField+textDesign.m
//  Foodicted
//
//  Created by ali on 10/20/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import "UITextField+textDesign.h"

@implementation UITextField (textDesign)
-(UITextField*)setSearchTextViewProperties{
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.layer.cornerRadius = 15;
    
    return self;
}

@end
