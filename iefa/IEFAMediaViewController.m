//
//  IEFAMediaViewController.m
//  iefa
//
//  Created by Lilit Avetisyan on 6/6/17.
//  Copyright © 2017 Paruyr Danielian. All rights reserved.
//

#import "IEFAMediaViewController.h"
#import <XCDYouTubeKit/XCDYouTubeKit.h>

@interface IEFAMediaViewController ()<UITextViewDelegate>
{
    
    IBOutlet UIView *iefaTextView;
}

@end

@implementation IEFAMediaViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    CGRect textViewFrame = CGRectMake(iefaTextView.frame.origin.x, iefaTextView.frame.origin.y, iefaTextView.frame.size.width, iefaTextView.frame.size.height);
    UITextView *textView = [[UITextView alloc] initWithFrame:textViewFrame];
    textView.returnKeyType = UIReturnKeyDone;
    textView.delegate = self;
    iefaTextView.backgroundColor = [UIColor whiteColor];
    //textView.backgroundColor = iefaTextView.backgroundColor;
    [iefaTextView addSubview:textView];
    
    [textView setText:@"/n a /n very /n very /n very /n long /n text /n with /n several /n maybe more /n paragrapahs"];
    textView.text =@"/n a /n very /n very /n very /n long /n text /n with /n several /n maybe more /n paragrapahs";
//    textView.textColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = YES;    
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}

-(IBAction)playVideo:(id)sender{
    
    XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:[self youtubeVideoID:@"https://www.youtube.com/watch?v=okM4Ku0l-0M"]];
    [self presentMoviePlayerViewControllerAnimated:videoPlayerViewController];
}
- (NSString *)youtubeVideoID:(NSString*)youtubeUrl {
    NSString *regexString = @"^(?:http(?:s)?://)?(?:www\\.)?(?:m\\.)?(?:youtu\\.be/|youtube\\.com/(?:(?:watch)?\\?(?:.*&)?v(?:i)?=|(?:embed|v|vi|user)/))([^\?&\"'>]+)";
    
    NSError *error;
    NSRegularExpression *regex =
    [NSRegularExpression regularExpressionWithPattern:regexString
                                              options:NSRegularExpressionCaseInsensitive
                                                error:&error];
    NSTextCheckingResult *match = [regex firstMatchInString:youtubeUrl
                                                    options:0
                                                      range:NSMakeRange(0, [youtubeUrl length])];
    
    if (match && match.numberOfRanges == 2) {
        NSRange videoIDRange = [match rangeAtIndex:1];
        NSString *videoID = [youtubeUrl substringWithRange:videoIDRange];
        
        return videoID;
    }
    
    return nil;
}
- (UIWebView*)embedYouTube:(NSString *)urlString frame:(CGRect)frame {
    
    
    NSString* embedHTML = [NSString stringWithFormat:@"<html><body style='margin:0px;padding:0px;'><script type='text/javascript' src='http://www.youtube.com/iframe_api'></script><script type='text/javascript'>function onYouTubeIframeAPIReady(){ytplayer=new YT.Player('playerId',{events:{onReady:onPlayerReady}})}function onPlayerReady(a){a.target.playVideo();}</script><iframe id='playerId' type='text/html' width='%f' height='%f' src='http://www.youtube.com/embed/%@?enablejsapi=1&playsinline=1&autoplay=1&controls=0&loop=0&modestbranding=0&rel=0&showinfo=0&color=white&iv_load_policy=3' frameborder='0'></body></html>", frame.size.width, frame.size.height,urlString];
    
    UIWebView *videoView = [[UIWebView alloc] initWithFrame:frame];
    videoView.scrollView.scrollEnabled = NO;
    videoView.backgroundColor = [UIColor clearColor];
    videoView.scrollView.backgroundColor = [UIColor colorWithRed:199.0/255.0 green:201.0/255.0 blue:206.0/255.0 alpha:1.0];
    videoView.allowsInlineMediaPlayback = YES;
    videoView.mediaPlaybackRequiresUserAction = NO;
    
    [videoView loadHTMLString:embedHTML baseURL:[[NSBundle mainBundle] resourceURL]];
    videoView.tag = 1;
    //    videoView.delegate = self;
    videoView.hidden = NO;
    return videoView;
}

#pragma mark UITextView methods





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 
 - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
 NSLog(@"touchesBegan:withEvent:");
 [self.view endEditing:YES];
 [super touchesBegan:touches withEvent:event];
 }
 - (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
 NSLog(@"textViewShouldBeginEditing:");
 return YES;
 }
 
 - (void)textViewDidBeginEditing:(UITextView *)textView {
 NSLog(@"textViewDidBeginEditing:");
 textView.backgroundColor = [UIColor greenColor];
 }
 
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end