//
//  TabBar.m
//  transform_Change
//
//  Created by VicChan on 7/5/16.
//  Copyright © 2016 VicChan. All rights reserved.
//

#import "TabBar.h"

@interface TabBar()
{
    CGSize buttonSize;
    NSInteger buttonCount;
    
}


@property (nonatomic, assign) NSInteger currentSelectedIndex;



@end



@implementation TabBar



- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame withImageArrays:(NSArray *)imageNames selectedImages:(NSArray *)selectedImages buttonSize:(CGSize)size buttonCount:(NSInteger)count backColor:(UIColor *)backgroundColor {
    if (self = [super initWithFrame:frame]) {
        [self configureBubbleButtonsWithArray:imageNames selectedImage:selectedImages];
        self.backgroundColor = backgroundColor;
        self.layer.cornerRadius = self.frame.size.height/2.0;
        buttonSize = size;
        buttonCount = count;
        self.currentSelectedIndex = 0;
    }
    return self;
}

- (void)configureBubbleButtonsWithArray:(NSArray *)images selectedImage:(NSArray *)selectedImages {
    _bubleButtons = [NSMutableArray new];
    CGSize size = buttonSize;
    id __weak weakSelf = self;
    CGFloat width = self.frame.size.width;
    CGFloat space = (width - size.width * buttonCount)/(buttonCount - 1);
    CGFloat radius = size.width/2.0;
    
    
    for(int i = 0; i < buttonCount; i ++) {
    
        BubbleButton *button = [[BubbleButton alloc]initWithSize:size center:CGPointMake(radius + i * space, radius) selectedImage:[UIImage imageNamed:selectedImages[i]] mormalImage:[UIImage imageNamed:images[i]] trigerBlock:^(UIButton *sender) {
            
            [weakSelf didSelectedIndex:i];
            
        }];
        if (i == 0) {
            [button setHighlight];
        }
        
        [self addSubview:button];
        [self.bubleButtons addObject:button];
    }
}

- (void)didSelectedIndex:(NSInteger)index {
    BubbleButton *previousButton = (BubbleButton *)[self.bubleButtons objectAtIndex:_currentSelectedIndex];
    [previousButton resetButton];
    _currentSelectedIndex = index;
    [_delegate didSelectedAtIndex:index];
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
