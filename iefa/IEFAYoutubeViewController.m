//
//  IEFAYoutubeViewController.m
//  iefa
//
//  Created by User on 6/26/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "IEFAYoutubeViewController.h"
#import "YTPlayerView.h"

@interface IEFAYoutubeViewController ()

@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;

@end

@implementation IEFAYoutubeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.playerView loadWithVideoId:self.videoID];
    self.automaticallyAdjustsScrollViewInsets = NO;

    //self.playerView.center = self.view.superview.center;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
