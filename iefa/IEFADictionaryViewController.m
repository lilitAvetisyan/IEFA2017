//
//  IEFADictionaryViewController.m
//  iefa
//
//  Created by Khoren Markosyan on 08.06.16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "IEFADictionaryViewController.h"

@interface IEFADictionaryViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation IEFADictionaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"dictionary.pdf" ofType:nil];
    NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
    NSURLRequest *request = [NSURLRequest requestWithURL:fileUrl];
    [self.webView loadRequest:request];
}

@end
