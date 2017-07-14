//
//  IEFAAgendaViewController.m
//  iefa
//
//  Created by Lilit Avetisyan on 7/13/17.
//  Copyright © 2017 Paruyr Danielian. All rights reserved.
//

#import "IEFAAgendaViewController.h"

@interface IEFAAgendaViewController ()
{
    
    IBOutlet UIButton *btnOne;
    IBOutlet UIButton *btnTwo;
    IBOutlet UIButton *btnThree;
    IBOutlet UIButton *btnFour;
    IBOutlet UIButton *btnFive;
    
    int dayNum;
}
@end

@implementation IEFAAgendaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dayNum = 1;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnone:(id)sender {
    dayNum = 1;
    // set button names
}
- (IBAction)btntwo:(id)sender {
    dayNum = 2;
    // set button names

}
- (IBAction)btnthree:(id)sender {
    dayNum = 3;
    // set button names

}
- (IBAction)btnfour:(id)sender {
    dayNum = 4;
    // set button names

}
- (IBAction)btnfive:(id)sender {
    dayNum = 5;
    // set button names

}
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




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
