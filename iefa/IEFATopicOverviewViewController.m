//
//  IEFATopicOverviewViewController.m
//  iefa
//
//  Created by Paruyr Danielian on 6/15/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "IEFATopicOverviewViewController.h"
#import <SafariServices/SafariServices.h>
#import "IEFACommitteViewController.h"

@interface IEFATopicOverviewViewController () <UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UITextView *textView;
@end

@implementation IEFATopicOverviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    NSArray *bolds = @[@"1. Topic question", @"2. Explanation of the problem and relevance of the topic", @"2. Explanation of the problem and relevance of the topic/Main conflicts",@"3. Main conflicts", @"4. Stakeholders", @"5. Measures in place and legislative background", @"6. Questions", @"7. Additional links", @"3. KeyTerms, 5.Measuresinplace Joint Action Plan", @"3. Measures in place", @"5. Questions", @"6. Additional links"];
    NSMutableAttributedString *yourAttributedString = [[NSMutableAttributedString alloc] initWithString:self.prepKitText];
    
    for (NSString *boldString in bolds) {
        NSRange boldRange = [self.prepKitText rangeOfString:boldString];
        [yourAttributedString addAttribute: NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:boldRange];
        [self.textView setAttributedText: yourAttributedString];
}

    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGesture:)];
    
    // And add it to your text view.
    [self.textView addGestureRecognizer:pinchGestureRecognizer];


    [self.textView setFont:[UIFont systemFontOfSize:16]];

    
}

- (void)pinchGesture:(UIPinchGestureRecognizer *)gestureRecognizer {
    
    UIFont *font = self.textView.font;
    CGFloat pointSize = font.pointSize;
    NSString *fontName = font.fontName;
    
    pointSize = ((gestureRecognizer.velocity > 0) ? 1 : -1) * 1 + pointSize;
    
    if (pointSize < 13) pointSize = 13;
    if (pointSize > 42) pointSize = 42;
    
    self.textView.font = [UIFont fontWithName:fontName size:pointSize];
    
}



- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {

    if ([SFSafariViewController class] != nil) {
        SFSafariViewController *sfvc = [[SFSafariViewController alloc] initWithURL:URL];
        [self presentViewController:sfvc animated:YES completion:nil];
    } else if (![[UIApplication sharedApplication] openURL:URL]) {
        NSLog(@"%@%@",@"Failed to open url:",[URL description]);
    }
    
    return NO;
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
