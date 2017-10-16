//
//  UIImageView+Helpers.m
//  Arera
//
//  Created by ali on 10/4/17.
//  Copyright © 2017 1byte. All rights reserved.
//

#import "UIImageView+Helpers.h"
#import <QuartzCore/QuartzCore.h>
@implementation UIImageView (Helpers)

- (UIImageView*)setBGImageAttributes{
    
    self.layer.cornerRadius = self.frame.size.width / 2;
//    self.layer.borderWidth = 3.0f;
//    self.layer.borderColor = [UIColor blueColor].CGColor;
//    self.clipsToBounds = YES;
    
    return self;
}

@end
