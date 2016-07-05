//
//  TabBar.h
//  transform_Change
//
//  Created by VicChan on 7/5/16.
//  Copyright © 2016 VicChan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BubbleButton.h"

@protocol TabBarDelegate <NSObject>

- (void)didSelectedAtIndex:(NSInteger)index;

@end

@interface TabBar : UIView


@property (nonatomic, weak) id<TabBarDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *bubleButtons;

- (instancetype)initWithFrame:(CGRect)frame;

- (instancetype)initWithFrame:(CGRect)frame withImageArrays:(NSArray *)imageNames selectedImages:(NSArray *)selectedImages;


@end
