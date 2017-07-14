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
#import "IEFACommitteDB.h"

@interface IEFACommViewController ()<iCarouselDataSource, iCarouselDelegate>
{
    NSArray* committees;
    NSDictionary *committeInfo;
    __weak IBOutlet iCarousel *carouselComm;
    __weak IBOutlet UILabel *chairName;
    __weak IBOutlet UILabel *commInfo;
    __weak IBOutlet UILabel *chairNationality;
}
@end

@implementation IEFACommViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:25.0],NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = size;
    committees = @[@"AFCO", @"ECON", @"AFET", @"PECH", @"JURI", @"SEDE", @"DROI", @"DEVE", @"LIBE", @"ENVI"];
    carouselComm.delegate = self;
    carouselComm.dataSource = self;
//    carouselComm.type = iCarouselTypeCoverFlow2;
    
    [self loadCommittees];

    // Do any additional setup after loading the view.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

-(void)loadCommittees{
    carouselComm.type = iCarouselTypeCylinder;
    [carouselComm reloadData];

}


#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
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
//    UILabel *label = nil;
//
//    view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
//    ((UIImageView *)view).image = [UIImage imageNamed:@"page"];
//    view.contentMode = UIViewContentModeCenter;
//    label = [[UILabel alloc] initWithFrame:view.bounds];
//    label.backgroundColor = [UIColor greenColor];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.font = [label.font fontWithSize:30];
////    label.tag = 1;
//    [carousel addSubview:label];
//    label.text = committees[index];
//    return view;
    UIButton *button = (UIButton *)view;
    if (button == nil)
    {
        //no button available to recycle, so create new one
        UIImage *image = [UIImage imageNamed:@"commBackground"];
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0.0f, 0.0f, 155.0f, 90.0f);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        button.titleLabel.font = [button.titleLabel.font fontWithSize:20];
//        [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [button setTitle:committees[index] forState:UIControlStateNormal];

    return button;

}
-(void)carouselDidScroll:(iCarousel *)carousel{
    NSInteger index = carousel.currentItemIndex;
    
    switch (index) {
        case 0:
            committeInfo = [IEFACommitteDB AFCO];
            break;
        case 1:
            committeInfo = [IEFACommitteDB ECON];
            break;
        case 2:
            committeInfo = [IEFACommitteDB AFET];
            break;
        case 3:
            committeInfo = [IEFACommitteDB PECH];
            break;
        case 4:
            committeInfo = [IEFACommitteDB DROI];
            break;
        case 5:
            committeInfo = [IEFACommitteDB SEDE];
            break;
        case 6:
            committeInfo = [IEFACommitteDB JURI];
            break;
        case 7:
            committeInfo = [IEFACommitteDB DEVE];
            break;
        case 8:
            committeInfo = [IEFACommitteDB LIBE];
            break;
        case 9:
            committeInfo = [IEFACommitteDB ENVI];
            break;
        default:
            break;
            
    }
    
    NSString* chair = [NSString stringWithFormat:@"%@ \n%@", [committeInfo objectForKey:@"ChairImage"],[committeInfo objectForKey:@"NameSurname"]];
    chairName.lineBreakMode = NSLineBreakByWordWrapping;
    chairName.numberOfLines = 0;
    chairName.text = chair;
    //    NSLog(chairName.text);
    ;
    commInfo.text = [committeInfo objectForKey:@"CommitteTopic"];
    
//    self.committeTopicLabel.text = [committeInfo objectForKey:@"CommitteTopic"];
//    self.peopleInCommittee.text = [committeInfo objectForKey:@"PeopleInCommitte"];
//    self.nameSurnameLabel.text = [committeInfo objectForKey:@"NameSurname"];
//    self.chairDiscription.text = [committeInfo objectForKey:@"ChairDiscription"];
    
}


- (void)buttonTapped:(UIButton *)sender
{
    //get item index for button
    NSInteger index = [carouselComm indexOfItemViewOrSubview:sender];
    
    [[[UIAlertView alloc] initWithTitle:@"Button Tapped"
                                message:[NSString stringWithFormat:@"You tapped button number %zd", index]
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
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
