//
//  IEFAEvantDayViewController.h
//  iefa
//
//  Created by User on 6/11/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IEFAEvantDayViewController : UIViewController

@property (nonatomic, strong) NSString *aboutPlace;
@property (nonatomic, strong) NSString *dressCode;
@property (nonatomic, strong) NSArray *place;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) BOOL map;

@end
