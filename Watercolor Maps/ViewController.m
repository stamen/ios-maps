//
//  ViewController.m
//  Watercolor Maps
//

#import "ViewController.h"

#import <MapBox/RMOpenStreetMapSource.h>
#import "SDTerrainMapSource.h"
#import "SDWatercolorMapSource.h"


@implementation ViewController

- (RMMapView *)mapView
{
    return (RMMapView *) self.view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.mapView.debugTiles = YES;
    self.mapView.zoom = 11;
    self.mapView.showLogoBug = NO;
    self.mapView.centerCoordinate = CLLocationCoordinate2DMake(37.7648, -122.4194);
//    [self.mapView setTileSource:[[SDTerrainMapSource alloc] init]];
    [self.mapView setTileSource:[[SDWatercolorMapSource alloc] init]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - RMMapViewDelegate methods


@end
