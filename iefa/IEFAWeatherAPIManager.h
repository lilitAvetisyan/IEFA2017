//
//  IEFAWeatherAPIManager.h
//  iefa
//
//  Created by User on 6/16/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IEFAConstants.h"

@interface IEFAWeatherAPIManager : NSObject

+ (IEFAWeatherAPIManager *)sharedManager;
- (void)getWeatherComplitionHandler:(weatherComplitionHandler)handler;

@end
