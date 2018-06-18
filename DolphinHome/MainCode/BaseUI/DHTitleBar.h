//
//  DHTitleBar.h
//  DolphinHome
//
//  Created by 李福庆 on 2018/6/18.
//
//

#import <UIKit/UIKit.h>

extern int sSTATUS_BAR_MARGIN_TOP ;     //距离顶边距20

#define TitleBar_NoStatus_Height 44
#define TitleBar_Height (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")?(TitleBar_NoStatus_Height+20):TitleBar_NoStatus_Height)

@interface DHTitleBar : UIView
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UIButton *leftItem;
@property (nonatomic, strong, readonly) UIButton *rightItem;


- (void)setTitle:(NSString *)title;
- (void)setTitle:(NSString *)title withColor:(UIColor *)color;

- (void)setLeft:(UIImage *)image highLight:(UIImage *)highlightImage withSelector:(SEL)selector target:(id)target;
- (void)setRight:(UIImage *)image highLight:(UIImage *)highlightImage withSelector:(SEL)selector target:(id)target;


@end
