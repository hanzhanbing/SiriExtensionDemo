//
//  CarInfoModel.m
//  SiriExtensionDemo
//
//  Created by Jason_zyl on 2019/1/18.
//  Copyright © 2019 haofree. All rights reserved.
//

#import "CarInfoModel.h"

@implementation CarInfoModel

+ (NSArray <CarInfoModel *> *)carList {
    
    CarInfoModel *car1  = [[CarInfoModel alloc] init];
    car1.carIcon        = @"http://wuqinewapp2.evcoming.com/sharego/vehiclemodelimgs/microweb/b3f307fe-55a9-41e6-8b21-1f4631925199.png";
//    car1.carName        = @"浙B39DU2";
    car1.carName        = @"123";
    
    CarInfoModel *car2  = [[CarInfoModel alloc] init];
    car2.carIcon        = @"http://wuqinewapp2.evcoming.com/sharego/vehiclemodelimgs/microweb/b3f307fe-55a9-41e6-8b21-1f4631925199.png";
    car2.carName        = @"苏AD07950";
    
    return @[car1, car2];
}

+ (CarInfoModel *)carInfoNamed:(NSString *)name {
    
    if (!name.length) {
        return nil;
    }
    
    for (CarInfoModel *info in [self carList]) {
        if ([info.carName isEqualToString:name]) {
            return info;
        }
    }
    
    return nil;
}

@end
