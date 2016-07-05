//
//  TabBarController.h
//  transform_Change
//
//  Created by VicChan on 7/5/16.
//  Copyright © 2016 VicChan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarController : UITabBarController

- (void)setTabBarColor:(UIColor *)color;

- (instancetype)initWithImages:(NSArray *)images
                selectedImages:(NSArray *)selectedImages
           withControllerBlock:(void(^)(TabBarController *))block
              withTabBarCenter:(CGPoint)center
                          size:(CGSize)size
                   buttonCount:(NSInteger)count;

- (void)setViewController:(UIViewController *)controller;

@end
