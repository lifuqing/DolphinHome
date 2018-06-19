//
//  DHViewController.m
//  DolphinHome
//
//  Created by 李福庆 on 2018/6/18.
//
//

#import "DHViewController.h"
#import "DHTitleBar.h"

@interface DHViewController ()
@property (nonatomic, strong) DHTitleBar *titleBar;
@end

@implementation DHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if(_titleBar)
        [self.view bringSubviewToFront:_titleBar];
}


- (void)reloadData {
}
- (void)refreshUI {
}
- (void)refreshNetworkData {
}

- (float)titleBarHeight
{
    if(_titleBar)
        return TitleBar_Height;
    else
        return 0;
}

- (DHTitleBar *) titleBar
{
    if(!_titleBar)
    {
        _titleBar = [[DHTitleBar alloc] init];
        if([self isViewLoaded])
            [self.view addSubview:_titleBar];
    }
    return _titleBar;
}


@end
