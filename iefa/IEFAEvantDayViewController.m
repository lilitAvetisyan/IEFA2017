//
//  IEFAEvantDayViewController.m
//  iefa
//
//  Created by User on 6/11/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "IEFAEvantDayViewController.h"
#import "IEFAConstants.h"
#import <MapKit/MapKit.h>

@interface IEFAEvantDayViewController () <MKAnnotation,MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *dressCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *aboutPlaceLabel;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (nonatomic, assign) BOOL initalLoad;
@property (nonatomic, strong) MKPointAnnotation *annotation;
@property (nonatomic, strong) CLLocationManager *locMan;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign) BOOL initalRegion;

@end

@implementation IEFAEvantDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.scrollView.frame.size.height)];
    self.navigationItem.title = self.time;
    [self setup];
}


- (void)setup {
    self.dressCodeLabel.numberOfLines = 0;
    self.dressCodeLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.dressCodeLabel.textAlignment = NSTextAlignmentJustified;
    self.dressCodeLabel.text = self.dressCode;
    
    if (self.map) {
        self.initalLoad = YES;
        self.initalRegion = NO;
        self.aboutPlaceLabel.numberOfLines = 0;
        self.addressLabel.numberOfLines = 0;
        self.aboutPlaceLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.addressLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.aboutPlaceLabel.textAlignment = NSTextAlignmentJustified;
        self.addressLabel.textAlignment = NSTextAlignmentJustified;
        self.aboutPlaceLabel.text = self.aboutPlace;
        self.addressLabel.text = self.address;

        [self setupMap];
    } else {
        self.aboutPlaceLabel.hidden = YES;
        self.mapView.hidden = YES;
        self.locationLabel.hidden = YES;
        self.addressLabel.hidden = YES;
    }

}



- (void)setupMap {
    
    CLLocationCoordinate2D coordinats;
    coordinats.latitude = [self.place[0] floatValue];
    coordinats.longitude = [self.place[1] floatValue];
    
    self.annotation = [[MKPointAnnotation alloc] init];
    self.annotation.coordinate = coordinats;
    
    self.locMan = [[CLLocationManager alloc] init];
    self.locMan.delegate = self;
    
    [self.locMan requestWhenInUseAuthorization];
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(self.annotation.coordinate,500 ,500);
    [self.mapView setRegion:viewRegion];
    [self.mapView setShowsUserLocation:YES];
    [self.mapView addAnnotation:self.annotation];
    
    

}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    if (self.initalLoad) {
        CLLocationDistance distanceBetweenAnnotationAndUserLocation = MKMetersBetweenMapPoints(MKMapPointForCoordinate(self.annotation.coordinate), MKMapPointForCoordinate(userLocation.location.coordinate));
        if (distanceBetweenAnnotationAndUserLocation > 5000000) {
            distanceBetweenAnnotationAndUserLocation = 5000000;
        }
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, 2*distanceBetweenAnnotationAndUserLocation,2*distanceBetweenAnnotationAndUserLocation);
        self.initalRegion = YES;
        [self.mapView setRegion:viewRegion animated:YES];
    } else {
       // [self.mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
    }
    
}


- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    if (self.initalRegion) {
        self.initalLoad = NO;
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
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
