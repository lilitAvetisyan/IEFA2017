//
//  IEFAAboutViewController.m
//  iefa
//
//  Created by Khoren Markosyan on 29.06.16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "IEFAAboutViewController.h"

@interface IEFAAboutViewController ()

@property (weak, nonatomic) IBOutlet UILabel *aboutLabel;

@end

@implementation IEFAAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSAttributedString *organisersHeader = [self attributedBoldTextFromString:@"Heads Organisers\n"];
    NSAttributedString *organiser1 = [self attributedRegularTextFromString:@"Nune Hayrapetyan\n"];
    NSAttributedString *organiser2 = [self attributedRegularTextFromString:@"Arman Gasparian\n"];
    
    NSAttributedString *presidentHeader = [self attributedBoldTextFromString:@"President\n"];
    NSAttributedString *president1 = [self attributedRegularTextFromString:@"Rodrigo Vaz\n"];
    
    NSAttributedString *editorHeader = [self attributedBoldTextFromString:@"Editor\n"];
    NSAttributedString *editor1 = [self attributedRegularTextFromString:@"Armen Khudgaryan\n"];
    
    NSAttributedString *appHeader = [self attributedBoldTextFromString:@"App made by\n"];
    NSAttributedString *app1 = [self attributedRegularTextFromString:@"Sanasar Kolyan\n"];
    NSAttributedString *app2 = [self attributedRegularTextFromString:@"Arman Markosyan\n"];
    NSAttributedString *app3 = [self attributedRegularTextFromString:@"Paruyr Danielian\n"];
    NSAttributedString *app4 = [self attributedRegularTextFromString:@"for the 2nd International EYP Forum Armenia\n"];
    
    
    NSMutableAttributedString *aboutString = [[NSMutableAttributedString alloc]init];
    [aboutString appendAttributedString:organisersHeader];
    [aboutString appendAttributedString:organiser1];
    [aboutString appendAttributedString:organiser2];
    
    [aboutString appendAttributedString:presidentHeader];
    [aboutString appendAttributedString:president1];
    
    [aboutString appendAttributedString:editorHeader];
    [aboutString appendAttributedString:editor1];
    
    [aboutString appendAttributedString:appHeader];
    [aboutString appendAttributedString:app1];
    [aboutString appendAttributedString:app2];
    [aboutString appendAttributedString:app3];
    [aboutString appendAttributedString:app4];
    
    
    self.aboutLabel.attributedText = aboutString;
}

- (NSAttributedString *)attributedBoldTextFromString:(NSString *)string {
    UIFont *font = [UIFont boldSystemFontOfSize:20.f];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 0.1 * font.lineHeight;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSAttributedString *attributedString =
    [[NSAttributedString alloc]initWithString:string
                                   attributes:@{NSFontAttributeName: font,
                                                NSParagraphStyleAttributeName: paragraphStyle}];
    return attributedString;
}

- (NSAttributedString *)attributedRegularTextFromString:(NSString *)string {
    UIFont *font = [UIFont systemFontOfSize:17.f];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 0.2 * font.lineHeight;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSAttributedString *attributedString =
    [[NSAttributedString alloc]initWithString:string
                                   attributes:@{NSFontAttributeName: font,
                                                NSParagraphStyleAttributeName: paragraphStyle}];
    
    return attributedString;
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
