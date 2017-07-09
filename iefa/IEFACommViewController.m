//
//  IEFACommViewController.m
//  iefa
//
//  Created by Lilit Avetisyan on 6/4/17.
//  Copyright © 2017 Paruyr Danielian. All rights reserved.
//

#import "IEFACommViewController.h"
#import "iCarousel.h"
#import "IEFACommitteeTableViewCell.h"

@interface IEFACommViewController ()<iCarouselDataSource, iCarouselDelegate, UITableViewDataSource, UITableViewDelegate>
{
    NSArray* committees;
    __weak IBOutlet iCarousel *carouselComm;
    __weak IBOutlet UITableView *tblComm;
    

}
@end

@implementation IEFACommViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.c = [UIColor purpleColor];
    committees = @[@"AFCO", @"ECON", @"AFET", @"PECH", @"JURI", @"SEDE", @"DROI", @"DEVE", @"LIBE", @"ENVI"];
//    carousel.delegate = self;
//    carousel.dataSource = self;
//    carousel.type = iCarouselTypeCoverFlow2;
    
    [self loadCommittees];
    [tblComm setTableHeaderView:carouselComm];

    // Do any additional setup after loading the view.
}

-(void)loadCommittees{
    carouselComm.type = iCarouselTypeRotary;
    [carouselComm reloadData];
//    [tblFilms reloadData];

}

#pragma mark Tableview delegate datasource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath == 0) {
        return 50;
    }
    else
        return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    IEFACommitteeTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"IEFACommitteeTableViewCell"];
    cell.textLabel.text = committees[indexPath.row];
//    [cell setInfo:[committees objectAtIndex:indexPath.row]];
    return cell;
}



#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return [committees count];
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
//     UILabel *label = nil;
//    if (view == nil)
//    {
//        
//        label = [[UILabel alloc] initWithFrame:view.bounds];
//        label.backgroundColor = [UIColor clearColor];
//        label.textAlignment = NSTextAlignmentCenter;
//        label.font = [label.font fontWithSize:30];
//        label.tag = 1;
//        [carousel addSubview:label];
//    }
//    else
//    {
//        label = (UILabel *)[view viewWithTag:1];
//    }
//    
//    label.text = committees[index];
//    
//    return carousel;
    UILabel *label = nil;

    view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
    ((UIImageView *)view).image = [UIImage imageNamed:@"page"];
    view.contentMode = UIViewContentModeCenter;
    label = [[UILabel alloc] initWithFrame:view.bounds];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [label.font fontWithSize:30];
    label.tag = 1;
    [carousel addSubview:label];
    label.text = committees[index];
    return view;
}

- (CATransform3D)carousel:(__unused iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    const CGFloat centerItemZoom = 1.3;
    const CGFloat centerItemSpacing = 1.3;
    
    CGFloat spacing = [self carousel:carousel valueForOption:iCarouselOptionSpacing withDefault:1.0f];
    CGFloat absClampedOffset = MIN(1.0, fabs(offset));
    CGFloat clampedOffset = MIN(1.0, MAX(-1.0, offset));
    CGFloat scaleFactor = 1.0 + absClampedOffset * (1.0/centerItemZoom - 1.0);
    offset = (scaleFactor * offset + scaleFactor * (centerItemSpacing - 1.0) * clampedOffset) * carousel.itemWidth * spacing;
    
    if (carousel.vertical)
    {
        transform = CATransform3DTranslate(transform, 0.0f, offset, -absClampedOffset);
    }
    else
    {
        transform = CATransform3DTranslate(transform, offset, 0.0f, -absClampedOffset);
    }
    
    transform = CATransform3DScale(transform, scaleFactor, scaleFactor, 2.0f);
    
    return transform;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            return NO;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 1.1f;
        }
        case iCarouselOptionFadeMax:
        {
            if (carouselComm.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 1.0f;
            }
            return value;
        }
        case iCarouselOptionShowBackfaces:
        {
            return 1;
        }
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
        {
            return value;
        }
        case iCarouselOptionVisibleItems:
        {
            return 3;
        }
    }
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
