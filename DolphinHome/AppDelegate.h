//
//  AppDelegate.h
//  DolphinHome
//
//  Created by 李福庆 on 2018/6/17.
//
//

#import <UIKit/UIKit.h>
#import "DHNavigationController.h"
#import "DHTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) DHNavigationController *dhNav;
@property (nonatomic, strong) DHTabBarController *tabBarController;


@end

