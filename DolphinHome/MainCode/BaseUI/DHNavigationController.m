//
//  DHNavigationController.m
//  DolphinHome
//
//  Created by 李福庆 on 2018/6/19.
//
//

#import "DHNavigationController.h"

@interface DHNavigationController ()<UINavigationControllerDelegate>

@end

@implementation DHNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return [[self topViewController] shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

- (BOOL)shouldAutorotate {
    return [[self topViewController] shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return [[self topViewController] supportedInterfaceOrientations];
}


@end
