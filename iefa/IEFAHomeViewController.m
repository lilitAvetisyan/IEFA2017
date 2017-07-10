//
//  IEFAHomeViewController.m
//  iefa
//
//  Created by Paruyr Danielian on 6/13/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "IEFAHomeViewController.h"
#import "IEFARandomFactDB.h"
#import "IEFAConstants.h"
#import "AppDelegate.h"
#import "IEFADropBoxAccessTokenManager.h"
#import "IEFAWeatherAPIManager.h"
#import <DropboxSDK/DropboxSDK.h>

@interface IEFAHomeViewController () <DBRestClientDelegate, UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrlviewNews;
@property (strong, nonatomic) IEFADropBoxAccessTokenManager *tokenManager;
@property (strong, nonatomic) DBRestClient *restClient;
@property (weak, nonatomic) IBOutlet UIButton *resolutionBookletButton;
@property (nonatomic, strong) NSString *downloadPath;
@property (nonatomic, assign) BOOL download;
@property (strong, nonatomic) UIActivityIndicatorView *resolutionBookletActivityIndicator;
@property (strong, nonatomic) IBOutlet UILabel *newsLabel;

@end

@implementation IEFAHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrlviewNews.delegate = self;
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kFileNameResolutionBooklet]) {
        [self resolutionBooklet];
    } else {
        DBSession *dbSession = [[DBSession alloc] initWithAppKey:kKeyApp appSecret:kSecretApp root:kDBRootDropbox];
        
        [DBSession setSharedSession:dbSession];
        [[DBSession sharedSession] updateAccessToken:kTokenAccess accessTokenSecret:kSecretToken forUserId:kUserID];
        
        self.restClient = [[DBRestClient alloc] initWithSession:[DBSession sharedSession]];
        self.restClient.delegate = self;
        [self.restClient loadMetadata:@"/"];
    }
    _newsLabel.text = @"He determined to drop his litigation with the monastry, and relinguish his claims to the wood-cuting and fishery rihgts at once. He was the more ready to do this becuase the rights had becom much less valuable, and he had indeed the vaguest idea where the wood and river in quedtion were. These excellant intentions were strengthed when he enterd the Father Superior's diniing-room, though, stricttly speakin, it was not a dining-room, for the Father Superior had only two rooms alltogether; they were, however, much larger and more comfortable than Father Zossima's. But tehre was was no great luxury about the furnishng of these rooms eithar. The furniture was of mohogany, covered with leather, in the old-fashionned style of 1820 the floor was He determined to drop his litigation with the monastry, and relinguish his claims to the wood-cuting and fishery rihgts at once. He was the more ready to do this becuase the rights had becom much less valuable, and he had indeed the vaguest idea where the wood and river in quedtion were. These excellant intentions were strengthed when he enterd the Father Superior's diniing-room, though, stricttly speakin, it was not a dining-room, for the Father Superior had only two rooms alltogether; they were, however, much larger and more comfortable than Father Zossima's. But tehre was was no great luxury about the furnishng of these rooms eithar. The furniture was of mohogany, covered with leather, in the old-fashionned style of 1820 the floor was ";
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (IBAction)resolutionBookletAction:(id)sender {
    
    if (self.download) {
        self.download = NO;
        self.resolutionBookletButton.enabled = NO;
        self.resolutionBookletActivityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        self.resolutionBookletActivityIndicator.center =self.resolutionBookletButton.titleLabel.center;
        [self.resolutionBookletActivityIndicator startAnimating];
        [self.resolutionBookletButton addSubview:self.resolutionBookletActivityIndicator];
        
        NSString *path;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        path = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"/"];
        path = [path stringByAppendingPathComponent:kFileNameResolutionBooklet];
        [self.restClient loadFile:self.downloadPath intoPath:path];

        
        
    } else {
        NSString *filePath;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"/"];
        filePath = [filePath stringByAppendingPathComponent:kFileNameResolutionBooklet];
        
        UIViewController *pdfViewController = [[UIViewController alloc]init];
        UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
        NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
        NSString *urlString = [fileUrl absoluteString];
        NSString *encodedString=[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *webViewURL = [NSURL URLWithString:encodedString];
        webView.scalesPageToFit = YES;
        NSURLRequest *request = [NSURLRequest requestWithURL:webViewURL];
        [webView loadRequest:request];
        [pdfViewController.view addSubview:webView];
        [self.navigationController pushViewController:pdfViewController animated:YES ];
        [self.navigationController setNavigationBarHidden:NO];
    }
    
    
    
    
    
}

- (void)restClient:(DBRestClient *)client loadedMetadata:(DBMetadata *)metadata {
    if (metadata.isDirectory) {
       // NSLog(@"Folder '%@' contains:", metadata.path);
        for (DBMetadata *file in metadata.contents) {
            if([file.filename.stringByStandardizingPath hasSuffix:kFileNameResolutionBooklet]) {
                
                
                
                self.downloadPath = [NSString stringWithFormat:@"%@/%@",metadata.path,file.filename];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [self downloadIsReady];
                });
                
                
            }
        }
    }
}


- (void)restClient:(DBRestClient *)client loadedFile:(NSString *)localPath
       contentType:(NSString *)contentType metadata:(DBMetadata *)metadata {
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kFileNameResolutionBooklet];
        dispatch_async(dispatch_get_main_queue(), ^{
        
        [self resolutionBooklet];
        [self.resolutionBookletActivityIndicator stopAnimating];
    });
}


- (void)downloadIsReady {
    
    self.resolutionBookletButton.enabled = YES;
//    [self.resolutionBookletButton setTitle:@"Download\nResolution\nBooklet" forState:UIControlStateNormal];
//    [self.resolutionBookletButton setTitle:@"Download\nResolution\nBooklet" forState:UIControlStateDisabled];
    [self.view layoutIfNeeded];
    self.download = YES;

}

- (void)resolutionBooklet {
    self.resolutionBookletButton.enabled = YES;
//    [self.resolutionBookletButton setTitle:@"Resolution\nBooklet" forState:UIControlStateNormal];
    [self.view layoutIfNeeded];

    
}


- (void)restClient:(DBRestClient *)client
loadMetadataFailedWithError:(NSError *)error {
    NSLog(@"Error loading metadata: %@", error);
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
