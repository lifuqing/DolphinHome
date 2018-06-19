//
//  AppDelegate.m
//  DolphinHome
//
//  Created by 李福庆 on 2018/6/17.
//
//

#import "AppDelegate.h"
#import "DHConfig.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //最新设置版本
//    [self setupAppVersion];
    
    /******************************************************************************/
    
    /**
     *  是否显示log，开始回归测试时，需要去掉log
     *  YES显示log
     *  NO不显示log
     */
    [[DHConfig sharedInstance] setIsNeedLog:NO];
    /**
     *  设置正式线和测试线的方法
     *  YES为测试线
     *  NO为正式线
     *  请在提交前将个人修改还原！避免影响其他同学的开发与测试工作
     *  如必须修改，请询问Team Leader
     */
    [[DHConfig sharedInstance] setIsDebug:NO];
    
    self.tabBarController =  [[DHTabBarController alloc] initWithNibName:nil bundle:nil];
    _dhNav = [[DHNavigationController alloc] initWithRootViewController:self.tabBarController];
    _dhNav.navigationBarHidden = YES;
    self.window.backgroundColor = [UIColor blackColor];
    self.window.rootViewController = _dhNav;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
