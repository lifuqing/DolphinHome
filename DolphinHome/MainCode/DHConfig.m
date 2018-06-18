//
//  DHConfig.m
//  DolphinHome
//
//  Created by 李福庆 on 2018/6/18.
//
//

#import "DHConfig.h"

@implementation DHConfig

+(instancetype)sharedInstance
{
    static id config = nil;
    if (config == nil)
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            config = [[[self class] alloc] init];
            [config loadConfig];
        });
    }
    
    return config;
}

- (void)loadConfig {
}
@end
