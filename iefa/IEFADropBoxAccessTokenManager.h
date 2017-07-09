//
//  IEFADropBoxAccessTokenManager.h
//  iefa
//
//  Created by User on 6/18/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SafariServices/SafariServices.h>
#import <DropboxSDK/DropboxSDK.h>
#import "IEFAConstants.h"





/* Usage
 
 
 tha allocated manager should be stored in property
 
 
 DBSession *dbSession = [[DBSession alloc]
 initWithAppKey:@"ykdeccp0qb202dv"
 appSecret:@"tl2tl7imfdsvj27"
 root:kDBRootDropbox]; // either kDBRootAppFolder or kDBRootDropbox
 
 [DBSession setSharedSession:dbSession];
 
 [[DBSession sharedSession] unlinkAll];
 
 [[DBSession sharedSession] updateAccessToken:@"c30k0a7kihrf0i55" accessTokenSecret:@"wchutecki6gnd9q" forUserId:@"575444574"];
 self.restClient = [[DBRestClient alloc] initWithSession:[DBSession sharedSession] userId:@"575444574"];
 self.restClient.delegate = self;
*/



@interface IEFADropBoxAccessTokenManager : NSObject

- (void)AccessTokenForAppKey:(NSString *)appKey appSecret:(NSString *)appSectret userID:(NSString *)userID     onVC:(UIViewController *)vc complitionHandler:(complitionHandler)handle;

@end
