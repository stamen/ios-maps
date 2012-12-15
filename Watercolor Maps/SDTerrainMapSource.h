//
//  SDTerrainMapSource.h
//  Watercolor Maps
//

#import <MapBox.h>
#import <UIKit/UIKit.h>

#define kUnitedStatesLatLonBoundingBox ((RMSphericalTrapezium){.northEast = {.latitude = 49.3845, .longitude = -66.9326}, .southWest = {.latitude = 24.5210, .longitude = -125.7624}})


@interface SDTerrainMapSource : RMAbstractWebMapSource

@end
