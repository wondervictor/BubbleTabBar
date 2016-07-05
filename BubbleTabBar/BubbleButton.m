//
//  BubbleButton.m
//  transform_Change
//
//  Created by VicChan on 7/5/16.
//  Copyright © 2016 VicChan. All rights reserved.
//

#import "BubbleButton.h"

@interface BubbleButton()

@end

@implementation BubbleButton


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (instancetype)initWithSize:(CGSize)size center:(CGPoint)center selectedImage:(UIImage *)selectedImage mormalImage:(UIImage *)image trigerBlock:(Triger)block {
    CGRect frame = CGRectMake(center.x - size.width/2.0, center.y - size.height/2.0, size.width, size.height);
    self = [super initWithFrame:frame];
    if (self) {
        _selectedImage = selectedImage;
        _normalImage = image;
        _trigerBlock = [block copy];
        _isSelected = NO;
        self.layer.cornerRadius = size.height/2.0;
        [self setBackgroundImage:_normalImage forState:UIControlStateNormal];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame selectedImage:(UIImage *)selectedImage mormalImage:(UIImage *)image trigerBlock:(Triger)block {
    self = [super initWithFrame:frame];
    if (self) {
        _selectedImage = selectedImage;
        _normalImage = image;
        _trigerBlock = [block copy];
        _isSelected = NO;
        self.layer.cornerRadius = frame.size.height/2.0;
        [self setBackgroundImage:_normalImage forState:UIControlStateNormal];
    }
    return self;
}

- (void)setSelectedButton:(BOOL)isSelected {
    _isSelected = isSelected;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"end");
    if (_isSelected == NO) {
        [self setBackgroundImage:_selectedImage forState:UIControlStateNormal];
        [self selectedAnimation];
        _trigerBlock(self);
        _isSelected = YES;
    }
}



- (void)selectedAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.keyTimes = @[@0.1,@0.4];
    animation.values =  @[@1.2,@1];
    animation.duration = 0.7;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    self.layer.anchorPoint = CGPointMake(0.5, 0.5);
    [self.layer addAnimation:animation forKey:@"scaleAniamtion"];
}

- (void)unselectedAnimation {
    
}

- (void)resetButton {
    _isSelected = NO;
    [self setBackgroundImage:_normalImage forState:UIControlStateNormal];
    [self unselectedAnimation];
}

- (void)setHighlight {
    [self setBackgroundImage:_selectedImage forState:UIControlStateNormal];
    _isSelected = YES;
}




/*
- (void)buttonClicked {
    if (self.selected) {
        _trigerBlock(self);
        [self setBackgroundImage:_selectedImage forState:UIControlStateSelected];
    }
    else {
        [self setBackgroundImage:_normalImage forState:UIControlStateNormal];
    }
}

 */




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
