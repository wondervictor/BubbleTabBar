//
//  TabBarController.m
//  transform_Change
//
//  Created by VicChan on 7/5/16.
//  Copyright © 2016 VicChan. All rights reserved.
//

#import "TabBarController.h"
#import "TabBar.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FirstViewController.h"
#import "FourthViewController.h"


@interface TabBarController ()<TabBarDelegate>

@property (nonatomic, strong) TabBar *bubbleTabBar;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSArray *selectedImages;


@end

@implementation TabBarController


- (instancetype)initWithImages:(NSArray *)images selectedImages:(NSArray *)selectedImages withControllerBlock:(void(^)(TabBarController *))block withTabBarCenter:(CGPoint)center size:(CGSize)size buttonCount:(NSInteger)count{
    if (self = [super init]) {
        _images = images;
        _selectedImages = selectedImages;
        block(self);
        [self.tabBar removeFromSuperview];
        CGSize buttonSize = CGSizeMake(size.height, size.height);
        
        _bubbleTabBar = [[TabBar alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height) withImageArrays:images selectedImages:selectedImages buttonSize:buttonSize buttonCount:count backColor:[UIColor whiteColor]];
        _bubbleTabBar.center = center;
        _bubbleTabBar.delegate = self;
        
        [self.view addSubview:_bubbleTabBar];
    }
    return self;
}


- (void)setTabBarColor:(UIColor *)color {
    _bubbleTabBar.backgroundColor = color;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didSelectedAtIndex:(NSInteger)index {
    NSLog(@"%lu",self.viewControllers.count);
    
    UIViewController *currentController = (UIViewController *)[self.viewControllers objectAtIndex:index];
    self.selectedViewController = currentController;
}


- (void)setViewController:(UIViewController *)controller {
    NSMutableArray *controllers = [[NSMutableArray alloc]initWithArray:self.viewControllers];
    [controllers addObject:controller];
    self.viewControllers = controllers;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
