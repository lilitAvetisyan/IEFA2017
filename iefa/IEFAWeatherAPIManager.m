//
//  IEFAWeatherAPIManager.m
//  iefa
//
//  Created by User on 6/16/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "IEFAWeatherAPIManager.h"
#import <UIKit/UIKit.h>


@interface IEFAWeatherAPIManager ()

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation IEFAWeatherAPIManager


+ (IEFAWeatherAPIManager *)sharedManager {
    
    static IEFAWeatherAPIManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[IEFAWeatherAPIManager alloc] init];
    });
    return sharedManager;
    
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return self;
}

- (void)getWeatherComplitionHandler:(weatherComplitionHandler)handler {
    NSString *URLString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?id=%@&appid=%@&units=metric",kIDYerevan,kKeyWeatherAPI];
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLSessionDataTask *task = [self.session dataTaskWithURL:URL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *dict;
        
        
        
        if (!error) {
            switch ([(NSHTTPURLResponse *)response statusCode]) {
                case 200: {
                    
                    dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                   // NSLog(@"%ld",[[dict objectForKey:@"weather"] objectForKey:@"main"]);
                    NSString *weather = [[[dict objectForKey:@"weather"] objectAtIndex:0] objectForKey:@"main"] ;
                    NSString *temp = [NSString stringWithFormat:@"%0.1f",[[[dict objectForKey:@"main"] objectForKey:@"temp"] floatValue] ];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        handler(temp,weather);
                        
                    }) ;
                    
                    
                    
                    break;
                }
                default:
                    break;
            }
        }
        
        
        
    }];
    [task resume];
}





@end
