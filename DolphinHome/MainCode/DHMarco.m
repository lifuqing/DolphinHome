//
//  DHMarco.m
//  DolphinHome
//
//  Created by 李福庆 on 2018/6/18.
//
//

#import "DHMarco.h"

@implementation DHMarco


CGSize screenSize()
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if(UIInterfaceOrientationIsPortrait(interfaceOrientation))
        return CGSizeMake(rect.size.width, rect.size.height);
    else
        return CGSizeMake(rect.size.height, rect.size.width);
}

UIImage *Image(NSString *name)
{
    NSString * path = [NSString stringWithFormat:@"Resources.bundle/image/%@",name];
    return [UIImage imageNamed:path];
}

@end
