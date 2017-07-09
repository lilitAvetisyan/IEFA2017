//
//  IEFADropBoxAccessTokenManager.m
//  iefa
//
//  Created by User on 6/18/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "IEFADropBoxAccessTokenManager.h"


@interface IEFADropBoxAccessTokenManager () <SFSafariViewControllerDelegate>

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) UIViewController *VC;
@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSString *tokenSecret;
@property (nonatomic, strong) NSString *appKey;
@property (nonatomic, strong) NSString *appSecret;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, assign) complitionHandler handle;



@end

@implementation IEFADropBoxAccessTokenManager


- (instancetype)init {
    self = [super init];
    if (self) {
        self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return self;
}


- (void)AccessTokenForAppKey:(NSString *)appKey appSecret:(NSString *)appSectret userID:(NSString *)userID     onVC:(UIViewController *)vc complitionHandler:(complitionHandler)handle {
    self.appKey = appKey;
    self.appSecret = appSectret;
    self.VC = vc;
    self.handle = handle;
    [self requestToken];
}


- (void)requestToken {
    
    
    NSString* oauthVersion=@"1";
    NSString* oauth_signature_method=@"PLAINTEXT";
    NSString* authorizationHeader = [NSString stringWithFormat: @"OAuth oauth_version=\"%@\", oauth_signature_method=\"%@\", oauth_consumer_key=\"%@\", oauth_signature=\"%@&\"",oauthVersion,oauth_signature_method,self.appKey , self.appSecret];
    
    NSMutableURLRequest* request= [[NSMutableURLRequest alloc]init];
    
    [request setURL:[NSURL URLWithString:@"https://api.dropbox.com/1/oauth/request_token"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:authorizationHeader forHTTPHeaderField:@"Authorization"];
    
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        self.tokenSecret =  [str substringWithRange:NSMakeRange(19, 16)];
        self.accessToken = [str substringWithRange:NSMakeRange(48, 16)];
        
        [self authorizationWithAppKey];
    }];
    [task resume];
}


- (void)authorizationWithAppKey {
    
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.dropbox.com/1/oauth/authorize?oauth_token=%@",self.accessToken]];
    
    if ([SFSafariViewController class] != nil) {
        SFSafariViewController *sfvc = [[SFSafariViewController alloc] initWithURL:URL];
        sfvc.delegate = self;
        [self.VC presentViewController:sfvc animated:YES completion:nil];
    } else {
        if (![[UIApplication sharedApplication] openURL:URL]) {
            NSLog(@"%@%@",@"Failed to open url:",[URL description]);
        }
    }
    
}


- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    [self authorize];
}

- (void)authorize {
    NSString* oauthVersion=@"1";
    NSString* oauth_signature_method=@"PLAINTEXT";
    
    NSString* authorizationHeader = [NSString stringWithFormat: @"OAuth oauth_version=\"%@\", oauth_signature_method=\"%@\", oauth_consumer_key=\"%@\", oauth_nonce=6756756,oauth_timestamp=100, oauth_token=\"%@\", oauth_signature=\"%@&%@\"",oauthVersion,oauth_signature_method,self.appKey,self.accessToken,self.appSecret,self.tokenSecret];
    
    
    NSMutableURLRequest* request= [[NSMutableURLRequest alloc]init];
    
    [request setURL:[NSURL URLWithString:@"https://api.dropbox.com/1/oauth/access_token"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:authorizationHeader forHTTPHeaderField:@"Authorization"];

    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        self.tokenSecret =  [str substringWithRange:NSMakeRange(19, 15)];
        self.accessToken = [str substringWithRange:NSMakeRange(47, 16)];
        
        self.handle(self.accessToken, self.tokenSecret);
    }];
    
    [task resume];

}


@end
