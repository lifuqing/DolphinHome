//
//  DHTitleBar.m
//  DolphinHome
//
//  Created by 李福庆 on 2018/6/18.
//
//

#import "DHTitleBar.h"
int sSTATUS_BAR_MARGIN_TOP=20;  //非ios7下是20

@interface DHTitleBar (){
    SEL _leftSelector;
    SEL _rightSelector;
}

@property (nonatomic, weak) id target;
@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UIButton *leftItem;
@property (nonatomic, strong, readwrite) UIButton *rightItem;

@end
@implementation DHTitleBar


- (id)init
{
    return [self initWithFrame:CGRectMake(0, 0, screenSize().width, TitleBar_Height)];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:18.f];
        [self addSubview:_titleLabel];
        
        //返回键
        _leftItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftItem addTarget:self action:@selector(clickLeft) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftItem];
        _leftItem.hidden = YES;
        
        //右侧
        _rightItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightItem addTarget:self action:@selector(clickRight) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightItem];
        _rightItem.hidden = YES;

    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

}

- (void)setTitle:(NSString *)title
{
    [self setTitle:title withColor:[UIColor whiteColor]];
}

- (void)setTitle:(NSString *)title withColor:(UIColor *)color
{
    if (title.length > 0) {
        _titleLabel.text = title;
    }
    _titleLabel.textColor = color;
    _titleLabel.hidden = NO;
}

- (void)setRightTitle:(NSString *)title withSelector:(SEL)selector target:(id)target
{
    [self configButton:_rightItem image:nil hightLight:nil title:title];
    [self setRightSelector:selector];
    _target = target;
}

- (void)setLeft:(UIImage *)image highLight:(UIImage *)highlightImage withSelector:(SEL)selector target:(id)target
{
    [self configButton:_leftItem image:image hightLight:highlightImage title:nil];
    [self setLeftSelector:selector];
    _target = target;
}

- (void)setRight:(UIImage *)image highLight:(UIImage *)highlightImage withSelector:(SEL)selector target:(id)target{
    [self configButton:_rightItem image:image hightLight:highlightImage title:nil];
    [self setRightSelector:selector];
    _target = target;
}

////////////////////////////////////////////////////////////
#pragma mark - method set images & selector both
////////////////////////////////////////////////////////////

- (void)configButton:(UIButton *)button image:(UIImage *)image hightLight:(UIImage *)highLightImage title:(NSString *)title{
    button.hidden = NO;
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:RGBA(255, 255, 255, 0.5) forState:UIControlStateDisabled];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:16.f];
    }
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    if (highLightImage) {
        [button setImage:highLightImage forState:UIControlStateHighlighted];
    }
}

- (void)setLeftSelector:(SEL)selector
{
    _leftSelector = selector;
    _leftItem.userInteractionEnabled = !(selector == nil);
}

- (void)setRightSelector:(SEL)selector
{
    _rightSelector = selector;
    _rightItem.userInteractionEnabled = !(selector == nil);
}

////////////////////////////////////////////////////////////
#pragma mark -action
////////////////////////////////////////////////////////////

- (void)clickLeft
{
    if([_target respondsToSelector:_leftSelector])
    {
        SuppressPerformSelectorLeakWarning([_target performSelector:_leftSelector withObject:_leftItem]);
    }
}

- (void)clickRight
{
    if([_target respondsToSelector:_rightSelector])
    {
        SuppressPerformSelectorLeakWarning([_target performSelector:_rightSelector withObject:_rightItem]);
    }
}

@end
