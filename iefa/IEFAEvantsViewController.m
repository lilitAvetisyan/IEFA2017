//
//  IEFAEvantsViewController.m
//  iefa
//
//  Created by User on 6/18/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "IEFAEvantsViewController.h"

#import "IEFAMainViewController.h"
#import "IEFACommitteViewController.h"

#import "RZTransitions.h"

@interface IEFAEvantsViewController () <RZTransitionInteractionControllerDelegate>

@property (nonatomic, strong) id<RZTransitionInteractionController> presentInteractionController;

@end

@implementation IEFAEvantsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Create the presentation interaction controller that allows a custom gesture
    // to control presenting a new VC via a presentViewController
    self.presentInteractionController = [[RZVerticalSwipeInteractionController alloc] init];
    [self.presentInteractionController setNextViewControllerDelegate:self];
    [self.presentInteractionController attachViewController:self withAction:RZTransitionAction_Present];

    
    // Setup the push & pop animations as well as a special animation for pushing a
    // RZSimpleCollectionViewController
    [[RZTransitionsManager shared] setAnimationController:[[RZCardSlideAnimationController alloc] init]
                                       fromViewController:[self class]
                                                forAction:RZTransitionAction_PushPop];
    
    // Setup the animations for presenting and dismissing a new VC
    [[RZTransitionsManager shared] setAnimationController:[[RZCirclePushAnimationController alloc] init]
                                       fromViewController:[self class]
                                                forAction:RZTransitionAction_PresentDismiss];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[RZTransitionsManager shared] setInteractionController:self.presentInteractionController
                                         fromViewController:[self class]
                                           toViewController:nil
                                                  forAction:RZTransitionAction_Present];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Actions

- (IBAction)presentButton:(UIButton *)sender {
    
    [self presentViewController:[self nextSimpleColorViewController] animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Next View Controller Logic

- (UIViewController *)nextSimpleColorViewController
{
    IEFACommitteViewController* newColorVC = [self.storyboard instantiateViewControllerWithIdentifier:@"IEFAMainViewControllerID"];
    [newColorVC setTransitioningDelegate:[RZTransitionsManager shared]];
    
    // Create a dismiss interaction controller that will be attached to the presented
    // view controller to allow for a custom dismissal
    /*
    RZVerticalSwipeInteractionController *dismissInteractionController = [[RZVerticalSwipeInteractionController alloc] init];
    [dismissInteractionController attachViewController:newColorVC withAction:RZTransitionAction_Dismiss];
    [[RZTransitionsManager shared] setInteractionController:dismissInteractionController
                                         fromViewController:[self class]
                                           toViewController:nil
                                                  forAction:RZTransitionAction_Dismiss];
     */
    return newColorVC;
}

#pragma mark - RZTransitionInteractorDelegate

- (UIViewController *)nextViewControllerForInteractor:(id<RZTransitionInteractionController>)interactor
{
    if ([interactor isKindOfClass:[RZVerticalSwipeInteractionController class]]) {
        return [self nextSimpleColorViewController];
    }
    else if ([interactor isKindOfClass:[RZPinchInteractionController class]]) {
        return [self nextSimpleColorViewController];
    }
    else {
        return nil;
    }
}


@end
