//
//  SetCarLockStatusIntentHandler.m
//  SiriExtension
//
//  Created by Jason_zyl on 2019/1/18.
//  Copyright © 2019 haofree. All rights reserved.
//

#import "SetCarLockStatusIntentHandler.h"
#import "CarInfoModel.h"

@interface SetCarLockStatusIntentHandler () <INSetCarLockStatusIntentHandling>

@end

@implementation SetCarLockStatusIntentHandler

- (nullable id)handlerForIntent:(nonnull INIntent *)intent {
    // 这是默认的实现,如果你想要不同的对象来处理不同的意图,你可以覆盖重写
    return self;
}

//以下是锁定或解锁用户汽车的意图类型代理方法
#pragma mark - INSetCarLockStatusIntentHandling

/*
 解析用户汽车的名称              - resolveCarNameForSetCarLockStatus:withCompletion:
 解析请求的锁定状态（锁定或解锁）   - resolveLockedForSetCarLockStatus:withCompletion:
 确认您的应用可以锁定或解锁汽车     - confirmSetCarLockStatus:completion:
 通过联系汽车并锁定或解锁来处理请求  - handleSetCarLockStatus:completion:
 */

// 解析用户汽车的名称
- (void)resolveCarNameForSetCarLockStatus:(INSetCarLockStatusIntent *)intent withCompletion:(void (^)(INSpeakableStringResolutionResult * _Nonnull))completion {
    
    NSLog(@"%@",intent.carName);
    
    INSpeakableString *text = intent.carName;
    
    NSString *carName = [NSString stringWithFormat:@"%@",text];
    
    // 如果没有汽车名称,返回，需要Siri提示:你要锁定或解锁哪辆汽车。
    if (text && ![carName isEqualToString:@""]) {
        CarInfoModel *car = [CarInfoModel carInfoNamed:carName];
        if (car) {
            completion([INSpeakableStringResolutionResult successWithResolvedString:text]);
        } else {
            completion([INSpeakableStringResolutionResult unsupported]);
        }
    } else {
        completion([INSpeakableStringResolutionResult needsValue]);
    }
}

// 解析请求的锁定状态（锁定或解锁）
- (void)resolveLockedForSetCarLockStatus:(INSetCarLockStatusIntent *)intent withCompletion:(void (^)(INBooleanResolutionResult * _Nonnull))completion {
    
    NSLog(@"%@",intent.locked);
    
    NSNumber *locked = intent.locked;
    if (!locked) {
        completion([INBooleanResolutionResult needsValue]);
        return;
    }
    completion([INBooleanResolutionResult successWithResolvedValue:[locked boolValue]]);
    
}

// 确认您的应用可以锁定或解锁汽车
- (void)confirmSetCarLockStatus:(INSetCarLockStatusIntent *)intent completion:(void (^)(INSetCarLockStatusIntentResponse * _Nonnull))completion {
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INSetCarLockStatusIntent class])];
    INSetCarLockStatusIntentResponse *response = [[INSetCarLockStatusIntentResponse alloc] initWithCode:INSetCarLockStatusIntentResponseCodeReady userActivity:userActivity];
    completion(response);
}

/**
 通过联系汽车并锁定或解锁来处理请求

 @param intent 锁定或解锁用户汽车意图
 @param completion 使用此对象确认请求是否有效并传达汽车是否已成功锁定或解锁，或报告发生的任何错误
 */
- (void)handleSetCarLockStatus:(nonnull INSetCarLockStatusIntent *)intent completion:(nonnull void (^)(INSetCarLockStatusIntentResponse * _Nonnull))completion {
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INSetCarLockStatusIntent class])];
    INSetCarLockStatusIntentResponse *response = [[INSetCarLockStatusIntentResponse alloc] initWithCode:INSetCarLockStatusIntentResponseCodeSuccess userActivity:userActivity];
    completion(response);
}

@end
