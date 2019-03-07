//
//  UZModuleDemo.m
//  UZModule
//
//  Created by kenny on 14-3-5.
//  Copyright (c) 2014年 APICloud. All rights reserved.
//

#import "IDFAModule.h"
#import "UZAppDelegate.h"
#import "NSDictionaryUtils.h"
@import AdSupport;

@interface IDFAModule ()


@end

@implementation IDFAModule

+ (void)onAppLaunch:(NSDictionary *)launchOptions {
    // 该方法在应用启动时被自动调用
}

- (id)initWithUZWebView:(UZWebView *)webView_ {
    if (self = [super initWithUZWebView:webView_]) {
        
    }
    return self;
}

- (void)dispose {
    //do clean
}


- (NSString *)getIDFA:(NSDictionary *)param {
    NSString *type = [param stringValueForKey:@"type" defaultValue:@"upper"];//lower upper
    
    NSString * idfa = @"";
    if ([ASIdentifierManager sharedManager].advertisingTrackingEnabled){
        idfa = [[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString] lowercaseString];
        if([@"lower" isEqualToString:type]){
            idfa = [idfa lowercaseString];
        }else{
            idfa = [idfa uppercaseString];
        }
        
    }
    return idfa;
}

@end
