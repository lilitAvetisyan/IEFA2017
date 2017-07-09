//
//  IEFACommitteViewController.m
//  iefa
//
//  Created by Paruyr Danielian on 6/10/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "IEFACommitteViewController.h"
#import "IEFACommitteDB.h"
#import "IEFATopicOverviewViewController.h"

@interface IEFACommitteViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *committeTopicLabel;
@property (weak, nonatomic) IBOutlet UILabel *peopleInCommittee;
@property (weak, nonatomic) IBOutlet UILabel *nameSurnameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *chairImage;
@property (weak, nonatomic) IBOutlet UILabel *chairDiscription;
@property (weak, nonatomic) IBOutlet UIImageView *committeImage;
@property (strong, nonatomic) NSString *prepKit;

@end

@implementation IEFACommitteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
 
    [self.committeTopicLabel sizeToFit];
    self.committeTopicLabel.numberOfLines = 0;

    NSDictionary *committeInfo = nil;
    
        switch (self.selectedCommitteeCell) {
            case 0:
                committeInfo = [IEFACommitteDB AFCO];
                break;
            case 1:
                committeInfo = [IEFACommitteDB ECON];
                break;
            case 2:
                committeInfo = [IEFACommitteDB AFET];
                break;
            case 3:
                committeInfo = [IEFACommitteDB PECH];
                break;
            case 4:
                committeInfo = [IEFACommitteDB DROI];
                break;
            case 5:
                committeInfo = [IEFACommitteDB SEDE];
                break;
            case 6:
                committeInfo = [IEFACommitteDB JURI];
                break;
            case 7:
                committeInfo = [IEFACommitteDB DEVE];
                break;
            case 8:
                committeInfo = [IEFACommitteDB LIBE];
                break;
            case 9:
                committeInfo = [IEFACommitteDB ENVI];
                break;
            default:
                break;
                
           }
    
    self.committeTopicLabel.text = [committeInfo objectForKey:@"CommitteTopic"];
    self.peopleInCommittee.text = [committeInfo objectForKey:@"PeopleInCommitte"];
    self.nameSurnameLabel.text = [committeInfo objectForKey:@"NameSurname"];
    self.chairDiscription.text = [committeInfo objectForKey:@"ChairDiscription"];
    [self.chairImage setImage:[UIImage imageNamed:[committeInfo objectForKey:@"ChairImage"]]];
    [self.committeImage setImage:[UIImage imageNamed:[committeInfo objectForKey:@"CommitteImage"]]];
    self.prepKit = [committeInfo objectForKey:@"PrepKit"];
    
    [self.view layoutIfNeeded];
    
    if (self.chairImage.frame.size.height > self.chairDiscription.frame.size.height) {
        [self.committeScrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.chairImage.frame.size.height + self.chairImage.frame.origin.y + 5)];
    } else {
        [self.committeScrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.chairDiscription.frame.size.height + self.chairDiscription.frame.origin.y + 5)];
    }
    
    
    self.title = [self.peopleInCommittee.text stringByReplacingOccurrencesOfString:@"People in " withString:@""];
}

- (void)viewDidLayoutSubviews {
 
    
//     self.committeScrollView.contentSize = self.view.frame.size;
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     Get the new view controller using [segue destinationViewController].
//     Pass the selected object to the new view controller.
    
    IEFATopicOverviewViewController *tpvc = [segue destinationViewController];
    tpvc.prepKitText = self.prepKit;
    tpvc.committeeTopicTitle = self.title;
}


@end
