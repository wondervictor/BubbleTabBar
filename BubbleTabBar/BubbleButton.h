//
//  BubbleButton.h
//  transform_Change
//
//  Created by VicChan on 7/5/16.
//  Copyright © 2016 VicChan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^Triger)(UIButton *sender);

@interface BubbleButton : UIButton

@property (nonatomic, strong) UIImage *selectedImage;

@property (nonatomic, strong) UIImage *normalImage;

@property (nonatomic, copy) Triger trigerBlock;

@property (nonatomic, assign) BOOL isSelected;

- (instancetype)initWithFrame:(CGRect)frame;

- (instancetype)initWithFrame:(CGRect)frame selectedImage:(UIImage *)selectedImage mormalImage:(UIImage *)image trigerBlock:(Triger)block;

- (instancetype)initWithSize:(CGSize)size center:(CGPoint)center selectedImage:(UIImage *)selectedImage mormalImage:(UIImage *)image trigerBlock:(Triger)block;
- (void)setHighlight;

- (void)resetButton;


@end
