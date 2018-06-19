//
//  DHConfig.h
//  DolphinHome
//
//  Created by 李福庆 on 2018/6/18.
//
//

#import <Foundation/Foundation.h>

@interface DHConfig : NSObject

//Config
@property(nonatomic, assign) BOOL isDebug;
@property(nonatomic, assign) BOOL isNeedLog;

+ (instancetype)sharedInstance;;
@end
