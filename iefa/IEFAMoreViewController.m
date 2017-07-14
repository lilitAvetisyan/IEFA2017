//
//  IEFAMoreViewController.m
//  iefa
//
//  Created by Lilit Avetisyan on 6/6/17.
//  Copyright © 2017 Paruyr Danielian. All rights reserved.
//

#import "IEFAMoreViewController.h"
#import <SafariServices/SafariServices.h>

@interface IEFAMoreViewController ()

@end

@implementation IEFAMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view.
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:25.0],NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = size;
}
-(void)viewWillAppear:(BOOL)animated{
//    self.navigationController.navigationBar.hidden = YES;

}

-(IBAction)btnStatsTapped:(id)sender{
    NSURL *URL = [NSURL URLWithString:@"https://stats.eyp.org"];
    
    if ([SFSafariViewController class] != nil) {
        SFSafariViewController *sfvc = [[SFSafariViewController alloc] initWithURL:URL];
        [self presentViewController:sfvc animated:YES completion:nil];
    } else {
        if (![[UIApplication sharedApplication] openURL:URL]) {
            NSLog(@"%@%@",@"Failed to open url:",[URL description]);
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
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
