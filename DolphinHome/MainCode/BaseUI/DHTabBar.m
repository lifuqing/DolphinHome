//
//  DHTabBar.m
//  DolphinHome
//
//  Created by 李福庆 on 2018/6/19.
//
//

#import "DHTabBar.h"
#import <QuartzCore/QuartzCore.h>

#define MARGIN 0//第一个item的左边距
#define kTabBarBorderLineColor RGBS(217)


@interface DHTabBarItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation DHTabBarItem

@end

@interface DHTabBar(){
    CGFloat backgroundWidth;
    CGFloat leftMargin;
    CGFloat itemLayerWidth;
    CGFloat itemTopMargin;
}
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) UIImageView *selectView;
@end

@implementation DHTabBar

- (void)dealloc
{
    
}

- (id)init
{
    self = [self initWithFrame:CGRectZero];
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _items = [NSMutableArray array];
        itemTopMargin = 6;
        for (int i = 0; i < 3; i++) {
            DHTabBarItem *item = [[DHTabBarItem alloc] init];
            switch (i) {
                case 0:
                    item.image = Image(@"tab_home");
                    item.selectedImage = Image(@"tab_home_pre");
                    break;
                case 1:
                    item.image = Image(@"tab_discovery");
                    item.selectedImage = Image(@"tab_discovery_pre");
                    break;
                case 2:
                    item.image = Image(@"tab_my");
                    item.selectedImage = Image(@"tab_my_pre");
                    break;
                default:
                    break;
            }
            [_items addObject:item];
        }
        self.userInteractionEnabled = YES;
        [self reload];
    }
    return self;
}

- (void)reload {
    backgroundWidth = CGRectGetWidth(self.frame);
    leftMargin =  MARGIN + (self.bounds.size.width - backgroundWidth) / 2;
    
    [self initBar];
    [self setSelectIndex:_selectIndex];
    
}

-(void)initBar {
    itemLayerWidth = (backgroundWidth - MARGIN * 2) / self.items.count;
    for (int i = 0; i < self.items.count; i++) {
        DHTabBarItem *item = self.items[i];
        
        UIImageView *iconView = [[UIImageView alloc] initWithImage:item.image];//设置图片图层
        
        iconView.frame = CGRectMake(itemLayerWidth * i + (itemLayerWidth - item.image.size.width) / 2.0,
                                    (self.bounds.size.height - item.image.size.height)/2.0,
                                    item.image.size.width,
                                    item.image.size.height);
        item.iconView = iconView;
        
        [self addSubview:item.iconView];
    }
    
    //4.0需要，给tabbar顶端增加一条灰线。采用了增加frame border 1像素的方式实现
    self.layer.borderColor = kTabBarBorderLineColor.CGColor;
    self.layer.borderWidth = 1.f;
    CGRect orginFrame = self.frame;
    self.frame = CGRectMake(orginFrame.origin.x - 1, orginFrame.origin.y, orginFrame.size.width + 1, orginFrame.size.height + 1);
}

- (void)setSelectIndex:(NSInteger)index {
    if (index >= 0) {
        [CATransaction begin];
        [CATransaction setValue:(id)kCFBooleanTrue
                         forKey:kCATransactionDisableActions];
        
        self.selectView.frame = CGRectMake(leftMargin + itemLayerWidth * index, 0, itemLayerWidth, self.bounds.size.height);
        self.selectView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        DHTabBarItem *selectIndexItem = self.items[self.selectIndex];
        selectIndexItem.iconView.image = selectIndexItem.image;
        selectIndexItem.titleLabel.textColor = RGBS(130);
        
        DHTabBarItem *indexItem = self.items[index];
        indexItem.iconView.image = indexItem.selectedImage;
        indexItem.iconView.layer.opacity = 1.0f;
        indexItem.titleLabel.textColor = [UIColor whiteColor];
        
        [CATransaction commit];
    }
    _selectIndex = index;
}

#pragma mark lazyload
- (UIImageView *)selectView
{
    if (!_selectView) { // 设置默认选中阴影
        _selectView = [[UIImageView alloc] initWithImage:Image(@"tab_clicked.png")];
    }
    return _selectView;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    if (point.x > leftMargin && (point.x < leftMargin + backgroundWidth - MARGIN)) {
        NSInteger index = (point.x - leftMargin) / itemLayerWidth;
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(willSelectIndex:)]) {
            BOOL mayI = [self.delegate willSelectIndex:index];
            if (!mayI) {
                return;
            }
        }
        _lastSelected = self.selectIndex;
        [self setSelectIndex:index];
        if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectIndex:)]) {
            [self.delegate didSelectIndex:index];
        }
        
    }
}

@end
