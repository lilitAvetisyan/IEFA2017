//
//  IEFAScheduleViewController.m
//  iefa
//
//  Created by User on 6/7/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "IEFAScheduleViewController.h"
#import "IEFADailyScheduleViewController.h"
#import "IEFAScheduleTableViewCell.h"
#import "IEFAConstants.h"
#import "AppDelegate.h"

@interface IEFAScheduleViewController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UIColor *const kColorLightRed;
@property (nonatomic, strong) UIColor *const kColorDarkRed;


@end


@implementation IEFAScheduleViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.kColorLightRed = [UIColor colorWithRed:182.0/255.0 green:32.0/255.0 blue:32.0/255.0 alpha:1];
    self.kColorDarkRed = [UIColor colorWithRed:90.0/255.0 green:16.0/255.0 blue:19.0/255.0 alpha:1];

}



- (void)loadDays {
    
        
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.frame.size.width/1140*349;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:kSegueIdentifierDailySceduleSegue sender:indexPath];

}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IEFAScheduleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifierDay forIndexPath:indexPath];
    [cell.Image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"jul%ld",indexPath.row + 3]]]  ;
    return cell;
}




#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath *)sender {
    IEFADailyScheduleViewController *vc = [segue destinationViewController];
    vc.day = sender.row + 3;
}


@end
