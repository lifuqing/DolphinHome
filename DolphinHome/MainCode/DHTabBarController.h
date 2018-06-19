//
//  DHTabBarController.h
//  DolphinHome
//
//  Created by 李福庆 on 2018/6/18.
//
//

#import <UIKit/UIKit.h>
#import "DHTabBar.h"

@interface DHTabBarController : UIViewController

@property (nonatomic, readonly) DHTabBar * customTabBar;
@property (nonatomic, assign) NSUInteger selectedIndex;

@end
