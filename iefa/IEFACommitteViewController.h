//
//  IEFACommitteViewController.h
//  iefa
//
//  Created by Paruyr Danielian on 6/10/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IEFACommitteViewController : UIViewController

@property (assign, nonatomic) NSInteger selectedCommitteeCell;
@property (strong, nonatomic) IBOutlet UIScrollView *committeScrollView;

@end
