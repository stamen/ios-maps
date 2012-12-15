//
//  SDWatercolorMapSource.m
//  Watercolor Maps
//

#import "SDWatercolorMapSource.h"

@implementation SDWatercolorMapSource

- (id)init
{
    if (!(self = [super init])) {
        return nil;
    }
    
    self.minZoom = 1;
    self.maxZoom = 20;
    
    return self;
}

#pragma mark - RMAbstractWebMapSource overrides

- (NSURL *)URLForTile:(RMTile)tile
{
	NSAssert4(((tile.zoom >= self.minZoom) && (tile.zoom <= self.maxZoom)),
			  @"%@ tried to retrieve tile with zoomLevel %d, outside source's defined range %f to %f",
			  self, tile.zoom, self.minZoom, self.maxZoom);
    
	return [NSURL URLWithString:[NSString stringWithFormat:@"http://tile.stamen.com/watercolor/%d/%d/%d.jpg", tile.zoom, tile.x, tile.y]];
}

- (NSString *)uniqueTilecacheKey
{
	return @"StamenWatercolor";
}

- (NSString *)shortName
{
	return @"Watercolor";
}

- (NSString *)longDescription
{
	return @"Reminiscent of hand drawn maps, our watercolor maps apply raster effect area washes and organic edges over a paper texture to add warm pop to any map. Watercolor was inspired by the Bicycle Portraits project. Thanks to Cassidy Curtis for his early advice.";
}

- (NSString *)shortAttribution
{
	return @"<style>body { text-align: left; font-size: 12px; }</style>Map tiles by Stamen Design, under CC BY 3.0. Data by OpenStreetMap, under CC BY SA.";
}

@end
