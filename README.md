# BubbleTabBar

![]()

#### **An intresting TabBarController!**


### We can start from this:

First we need to initialize a UIWindow to contain our TabBarController

in your `AppDelegate.m `:  
we need to implement this method:

```
- (instancetype)initWithImages:(NSArray *)images
                selectedImages:(NSArray *)selectedImages
           withControllerBlock:(void(^)(TabBarController *))block
              withTabBarCenter:(CGPoint)center
                          size:(CGSize)size
                   buttonCount:(NSInteger)count;

```
just like this in the demo:

```
TabBarController *tabController = [[TabBarController alloc]initWithImages:@[@"account_normal",@"home_normal",@"message_normal",@"mycity_normal"]  selectedImages:@[@"account_highlight",@"home_highlight",@"message_highlight",@"mycity_highlight"] withControllerBlock:^(TabBarController *tb) {
	[tb setViewController:[[UINavigationController alloc]initWithRootViewController:[FirstViewController new]]];
	[tb setViewController:[[UINavigationController alloc]initWithRootViewController:[SecondViewController new]]];
	[tb setViewController:[[UINavigationController alloc] initWithRootViewController:[ThirdViewController new]]];
	[tb setViewController:[[UINavigationController alloc]initWithRootViewController:[FourthViewController new]]];
        
} withTabBarCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, [UIScreen mainScreen].bounds.size.height-55) size:CGSizeMake(260, 50) buttonCount:4];

```


you need to provie your **images** for normal state(or unselected) as well as **selectedImages**. Taked attention when write the count of the buttons. after this, you will meet this intrestig tabbar.

Happy Coding!