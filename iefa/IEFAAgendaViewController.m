//
//  IEFAAgendaViewController.m
//  iefa
//
//  Created by Lilit Avetisyan on 7/13/17.
//  Copyright © 2017 Paruyr Danielian. All rights reserved.
//

#import "IEFAAgendaViewController.h"
#import "iCarousel.h"
@interface IEFAAgendaViewController ()<iCarouselDataSource, iCarouselDelegate>
{
    
//    IBOutlet UIButton *btnOne;
//    IBOutlet UIButton *btnTwo;
//    IBOutlet UIButton *btnThree;
//    IBOutlet UIButton *btnFour;
//    IBOutlet UIButton *btnFive;
    
    __weak IBOutlet iCarousel *daysCarousel;
    int dayNum;
    NSArray* daysNum;
}
@end

@implementation IEFAAgendaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dayNum = 1;
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:25.0],NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = size;
    daysNum = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
    [self loadCarousel];
    // Do any additional setup after loading the view.
}

-(void)loadCarousel{
    daysCarousel.type = iCarouselTypeCylinder;
    [daysCarousel reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)btnone:(id)sender {
//    dayNum = 1;
//    // set button names
//}
//- (IBAction)btntwo:(id)sender {
//    dayNum = 2;
//    // set button names
//
//}
//- (IBAction)btnthree:(id)sender {
//    dayNum = 3;
//    // set button names
//
//}
//- (IBAction)btnfour:(id)sender {
//    dayNum = 4;
//    // set button names
//
//}
//- (IBAction)btnfive:(id)sender {
//    dayNum = 5;
//    // set button names
//
//}
- (IBAction)openMap:(id)sender {
    UIButton* button = (UIButton*)sender;
    if (dayNum == 1) {
        switch (button.tag) {
            case 1:
                //
                break;
            case 2:
                //
                break;
            case 3:
                //
                break;
            case 4:
                //
                break;
            case 5:
                //
                break;
            default:
                break;
        }

    } else if(dayNum == 2){
        switch (button.tag) {
            case 1:
                //
                break;
            case 2:
                //
                break;
            case 3:
                //
                break;
            case 4:
                //
                break;
            case 5:
                //
                break;
            default:
                break;
        }

    } else if (dayNum == 3){
        switch (button.tag) {
            case 1:
                //
                break;
            case 2:
                //
                break;
            case 3:
                //
                break;
            case 4:
                //
                break;
            case 5:
                //
                break;
            default:
                break;
        }

    }else if (dayNum == 4){
        switch (button.tag) {
            case 1:
                //
                break;
            case 2:
                //
                break;
            case 3:
                //
                break;
            case 4:
                //
                break;
            case 5:
                //
                break;
            default:
                break;
        }

    } else{
        switch (button.tag) {
            case 1:
                //
                break;
            case 2:
                //
                break;
            case 3:
                //
                break;
            case 4:
                //
                break;
            case 5:
                //
                break;
            default:
                break;
        }

    }
    
}


#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [daysNum count];
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{

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
    
    [button setTitle:daysNum[index] forState:UIControlStateNormal];
    
    return button;
    
}
-(void)carouselDidScroll:(iCarousel *)carousel{
    NSInteger index = carousel.currentItemIndex;
    dayNum = (int)index;
    
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
