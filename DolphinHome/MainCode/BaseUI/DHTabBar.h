//
//  DHTabBar.h
//  DolphinHome
//
//  Created by 李福庆 on 2018/6/19.
//
//

#import <UIKit/UIKit.h>

@protocol DHTabBarDelegate<NSObject>
-(void)didSelectIndex:(NSInteger)index;
@optional
-(BOOL)willSelectIndex:(NSInteger)index;
@end

@interface DHTabBar : UIView
@property (nonatomic, assign) id<DHTabBarDelegate> delegate;
@property (nonatomic, assign, readonly) NSInteger lastSelected;
@property (nonatomic, assign) NSInteger selectIndex;
@end
