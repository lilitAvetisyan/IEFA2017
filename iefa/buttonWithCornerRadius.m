//
//  buttonWithCornerRadius.m
//  UIForInnoma
//
//  Created by User on 6/23/16.
//  Copyright © 2016 ACA. All rights reserved.
//

#import "buttonWithCornerRadius.h"

IB_DESIGNABLE

@interface buttonWithCornerRadius ()

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

@end

@implementation buttonWithCornerRadius





// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [self.layer setCornerRadius:self.cornerRadius];
    [self.layer setBorderWidth:self.borderWidth];
    [self.layer setBorderColor:self.borderColor.CGColor];
    
}


@end
