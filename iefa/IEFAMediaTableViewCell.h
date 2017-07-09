//
//  IEFAMediaTableViewCell.h
//  iefa
//
//  Created by Paruyr Danielian on 6/20/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IEFAMediaTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mediaImage;
@property (nonatomic, assign) BOOL isPDF;
@property (nonatomic, strong) NSString *PDFpath;
@end
