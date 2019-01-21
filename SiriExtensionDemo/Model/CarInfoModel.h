//
//  CarInfoModel.h
//  SiriExtensionDemo
//
//  Created by Jason_zyl on 2019/1/18.
//  Copyright © 2019 haofree. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 汽车模型
@interface CarInfoModel : NSObject

// 汽车头像
@property (nonatomic, copy) NSString *carIcon;

// 汽车名称
@property (nonatomic, copy) NSString *carName;


// 测试数据返回汽车列表
+ (NSArray <CarInfoModel *> *)carList;

// 返回名称对应的汽车信息
+ (CarInfoModel *)carInfoNamed:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
