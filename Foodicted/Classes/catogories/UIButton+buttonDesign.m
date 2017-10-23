//
//  UIButton+buttonDesign.m
//  Foodicted
//
//  Created by ali on 10/20/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import "UIButton+buttonDesign.h"

@implementation UIButton (buttonDesign)
-(UIButton*)setbuttonAttributes{
    
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width-26, 52);
gradient.colors = @[(id)[[UIColor colorWithRed:0.715 green:0.544 blue:0.290 alpha:1] CGColor],	(id)[[UIColor colorWithRed:0.880 green:0.710 blue:0.212 alpha:0.8] CGColor]];
    //gradient.colors =@[(id)[[UIColor colorNamed:@"yellowish"]CGColor],(id)[[UIColor colorNamed:@"darkBrown"]CGColor]];
    gradient.locations = @[@(0), @(1)];
    gradient.startPoint = CGPointMake(0.5, 0);
    gradient.endPoint = CGPointMake(0.5, 1);
    gradient.cornerRadius = 15;
    self.layer.cornerRadius = 15;
    self.clipsToBounds = true;
    [self.layer addSublayer:gradient];
    
    
    return self;
}

@end
