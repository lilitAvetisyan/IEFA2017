//
//  IEFADailyScheduleViewController.m
//  iefa
//
//  Created by User on 6/7/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "IEFADailyScheduleViewController.h"
#import "IEFADailyScheduleTableViewCell.h"
#import "IEFAEvantDayViewController.h"
#import "IEFAConstants.h"
#import "IEFASchedule.h"

@interface IEFADailyScheduleViewController ()

@property (nonatomic, strong) NSArray *evants;
@property (nonatomic, strong) UIColor *const kColorLightRed;
@property (nonatomic, strong) UIColor *const kColorDarkRed;

@end

@implementation IEFADailyScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.kColorLightRed = [UIColor colorWithRed:182.0/255.0 green:32.0/255.0 blue:32.0/255.0 alpha:1];
    self.kColorDarkRed = [UIColor colorWithRed:90.0/255.0 green:16.0/255.0 blue:19.0/255.0 alpha:1];
    
    switch (self.day) {
        case 3: self.evants = [IEFASchedule scheduleForThirdDay];
            break;
        case 4: self.evants = [IEFASchedule scheduleForForthDay];
            break;
        case 5: self.evants = [IEFASchedule scheduleForFifthDay];
            break;
        case 6: self.evants = [IEFASchedule scheduleForSixthDay];
            break;
        case 7: self.evants = [IEFASchedule scheduleForSeventhDay];
            break;
        case 8: self.evants = [IEFASchedule scheduleForEighthDay];
            break;
        case 9: self.evants = [IEFASchedule scheduleForNinthDay];
            break;
    }
    NSArray *days = @[ @"July 3", @"July 4", @"July 5", @"July 6", @"July 7", @"July 8", @"July 9"];

    
    
    // Uncomment the following line to preserve selection between presentations.
    self.navigationItem.title = days[self.day-3];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.evants count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIFont *cellFont = [UIFont systemFontOfSize:17];
    CGSize constraintSize = CGSizeMake(self.view.frame.size.width - 150, MAXFLOAT);
    CGRect labelSize = [[[self.evants objectAtIndex:indexPath.row] objectForKey:@"evant"] boundingRectWithSize:constraintSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : cellFont} context:nil];
    return labelSize.size.height + 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IEFADailyScheduleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifierDailySchedule forIndexPath:indexPath];
    
    if (indexPath.row % 2 == 0) {
        cell.contentView.backgroundColor = self.kColorDarkRed;
        cell.evantLabel.backgroundColor = self.kColorDarkRed;
        cell.timeLabel.backgroundColor = self.kColorDarkRed;
        cell.arroyLabel.backgroundColor = self.kColorDarkRed;
    } else {
        cell.contentView.backgroundColor = self.kColorLightRed;
        cell.evantLabel.backgroundColor = self.kColorLightRed;
        cell.timeLabel.backgroundColor = self.kColorLightRed;
        cell.arroyLabel.backgroundColor = self.kColorLightRed;
    }
    
    
    if ([[[self.evants objectAtIndex:indexPath.row] objectForKey:@"show"] integerValue] == DailySceduleStayleNone) {
        cell.arroyLabel.hidden = YES;
    }
    
    cell.timeLabel.text = [NSString stringWithFormat:@"%@ - %@",
                           [[self.evants objectAtIndex:indexPath.row] objectForKey:@"startTime"],
                           [[self.evants objectAtIndex:indexPath.row] objectForKey:@"endTime"]];
    cell.evantLabel.text = [[self.evants objectAtIndex:indexPath.row] objectForKey:@"evant"];
    ;
    
    cell.evantLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.evantLabel.numberOfLines = 0;
    
    UIFont *cellFont = cell.evantLabel.font;
    CGSize constraintSize = CGSizeMake(cell.frame.size.width - 150, MAXFLOAT);
    CGRect labelSize = [cell.evantLabel.text boundingRectWithSize:constraintSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : cellFont} context:nil];
    cell.evantLabel.frame = labelSize;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([[[self.evants objectAtIndex:indexPath.row] objectForKey:@"show"] integerValue] != DailySceduleStayleNone) {
        [self performSegueWithIdentifier:kSegueIdentifierDay sender:indexPath];
    }
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath *)sender {
    IEFAEvantDayViewController *vc = [segue destinationViewController];
    vc.dressCode = [self.evants[sender.row] objectForKey:@"dressCode"];
    vc.time = [NSString stringWithFormat:@"%@ - %@",
               [[self.evants objectAtIndex:sender.row] objectForKey:@"startTime"],
               [[self.evants objectAtIndex:sender.row] objectForKey:@"endTime"]];
    
    if ([[[self.evants objectAtIndex:sender.row] objectForKey:@"show"] integerValue] == DailySceduleStayleDressCode) {
        vc.map = NO;
    } else {
        vc.address = [self.evants[sender.row] objectForKey:@"address"];
        vc.map = YES;
        vc.aboutPlace = [self.evants[sender.row] objectForKey:@"aboutPlace"];
        vc.place = [self.evants[sender.row] objectForKey:@"place"];
    }
    // Pass the selected object to the new view controller.
}


@end
