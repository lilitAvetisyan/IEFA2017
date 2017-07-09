//
//  IEFAMediaVideoTableViewCell.h
//  iefa
//
//  Created by User on 6/26/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IEFAMediaVideoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mediaImage;
@property (nonatomic, assign) CGSize imageSize;
@end
