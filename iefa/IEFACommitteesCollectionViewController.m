//
//  IEFACommitteesCollectionViewController.m
//  iefa
//
//  Created by Paruyr Danielian on 6/6/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "IEFACommitteesCollectionViewController.h"
#import "IEFACommitteeCollectionViewCell.h"
#import "IEFAConstants.h"
#import "IEFACommitteViewController.h"

@interface IEFACommitteesCollectionViewController () <UICollectionViewDelegate, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *committeeNames;
@property (nonatomic, strong) NSArray *commmitteeCellBgImages;
@end

@implementation IEFACommitteesCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.committeeNames = @[@"AFCO", @"ECON", @"AFET", @"PECH", @"JURI", @"SEDE", @"DROI", @"DEVE", @"LIBE", @"ENVI"];
    self.commmitteeCellBgImages = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10"];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
  //  [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    [self setNeedsStatusBarAppearanceUpdate];
    [self preferredStatusBarStyle];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath*)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    IEFACommitteViewController *vc = [segue destinationViewController];
    vc.selectedCommitteeCell = sender.item;

    
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items
    return [self.committeeNames count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IEFACommitteeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifierCommittees forIndexPath:indexPath];
    
    // Configure the cell
    
    
    //cell.committeeNameLabel.text = [NSString stringWithFormat:@"%@", self.committeeNames[indexPath.row]];
    
    [[cell committeeCellBgImage]setImage:[UIImage imageNamed:[self.commmitteeCellBgImages objectAtIndex:indexPath.item]]];
    return cell;
}


#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"SegueToCommittee" sender:indexPath];
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
// NSLog(@"%ld highlighted", (long)indexPath.item);
    
}

-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    float width = collectionView.frame.size.width / 2.07;
    float height = width;
    return CGSizeMake(width, height);

}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
