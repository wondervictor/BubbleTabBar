//
//  TabBar.m
//  transform_Change
//
//  Created by VicChan on 7/5/16.
//  Copyright © 2016 VicChan. All rights reserved.
//

#import "TabBar.h"

@interface TabBar()

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

- (instancetype)initWithFrame:(CGRect)frame withImageArrays:(NSArray *)imageNames selectedImages:(NSArray *)selectedImages {
    if (self = [super initWithFrame:frame]) {
        [self configureBubbleButtonsWithArray:imageNames selectedImage:selectedImages];
        self.backgroundColor = [UIColor lightGrayColor];
        self.layer.cornerRadius = 25;
        self.currentSelectedIndex = 0;
    }
    return self;
}

- (void)configureBubbleButtonsWithArray:(NSArray *)images selectedImage:(NSArray *)selectedImages {
    _bubleButtons = [NSMutableArray new];
    CGSize size = CGSizeMake(50, 50);
    
    id __weak weakSelf = self;
    
    for(int i = 0; i < 4; i ++) {
    
        BubbleButton *button = [[BubbleButton alloc]initWithSize:size center:CGPointMake(25 + i * 80, 25) selectedImage:[UIImage imageNamed:selectedImages[i]] mormalImage:[UIImage imageNamed:images[i]] trigerBlock:^(UIButton *sender) {
            
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
    NSLog(@"%lu",index);
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
