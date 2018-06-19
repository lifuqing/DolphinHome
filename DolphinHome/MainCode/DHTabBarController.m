//
//  DHTabBarController.m
//  DolphinHome
//
//  Created by 李福庆 on 2018/6/18.
//
//

#import "DHTabBarController.h"
#import "DHHomeViewController.h"
#import "DHVIPViewController.h"
#import "DHShoppingCartViewController.h"
#import "DHMyViewController.h"

@interface DHTabBarController ()<DHTabBarDelegate>
{
    DHViewController *currentViewController;
}
@property (nonatomic, readwrite) DHTabBar *customTabBar;
@property (nonatomic, strong) UIView *mainView;

@end

@implementation DHTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        _selectedIndex = 0;
        
        DHHomeViewController *home = [[DHHomeViewController alloc] init];
        DHVIPViewController *vip = [[DHVIPViewController alloc] init];
        DHShoppingCartViewController *cart = [[DHShoppingCartViewController alloc] init];
        DHMyViewController *my = [[DHMyViewController alloc] init];
        
        [self addChildViewController:home];
        [self addChildViewController:vip];
        [self addChildViewController:cart];
        [self addChildViewController:my];

    }
    return self;
}

- (void)dealloc
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!_mainView) {
        _mainView = [[UIView alloc] initWithFrame:self.view.bounds];
        _mainView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    [self.view addSubview:_mainView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (!_customTabBar) {
        _customTabBar = [[DHTabBar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - TAB_BAR_HEIGHT, self.view.bounds.size.width, TAB_BAR_HEIGHT)];
        _customTabBar.delegate = self;
    }
    _customTabBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_customTabBar];
    
    currentViewController = self.selectedViewController;
    
    currentViewController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    currentViewController.view.clipsToBounds= YES;
    
    [_mainView addSubview:currentViewController.view];
    
    [self setSelectedViewController:currentViewController];
}

////////////////////////////////////////////////////////
#pragma mark - 业务逻辑
////////////////////////////////////////////////////////

- (DHViewController *)selectedViewController
{
    return [self.childViewControllers objectAtIndex:_selectedIndex];
}

- (void)setSelectedViewController:(DHViewController *)controller
{
    controller.view.frame = _mainView.bounds;
    
    if (!currentViewController) {
        currentViewController = controller;
        return;
    }
    
    if (currentViewController == controller) {
        return;
    }
    
    [self transitionFromViewController:currentViewController toViewController:controller duration:0 options:UIViewAnimationOptionTransitionNone animations:^{
        
    } completion:^(BOOL finished) {
        currentViewController = controller;
    }];
    
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    [self setSelectedViewController:self.selectedViewController];
}

#pragma mark TDTabBarDelegate
-(void)didSelectIndex:(NSInteger)index
{
    switch (index)
    {
        case 0:{
            if (index != _customTabBar.lastSelected) {
                [self setSelectedIndex:0];
            }
        }
            break;
        case 1:{
            if (index != _customTabBar.lastSelected) {
                [self setSelectedIndex:1];
            }
        }
            break;
        case 2:{
            if (index != _customTabBar.lastSelected) {
                [self setSelectedIndex:2];
            }
            
        }
            
            break;
        case 3:{
            if (index != _customTabBar.lastSelected) {
                [self setSelectedIndex:3];
            }
        }
            break;
        case 4:{
            if (index != _customTabBar.lastSelected) {
                [self setSelectedIndex:4];
            }
        }
            break;
        default:
            break;
    }
}
@end
