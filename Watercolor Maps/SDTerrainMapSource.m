//
//  SDTerrainMapSource.m
//  Watercolor Maps
//

#import "SDTerrainMapSource.h"


@implementation SDTerrainMapSource

- (id)init
{
    if (!(self = [super init])) {
        return nil;
    }
    
    self.minZoom = 4;
    self.maxZoom = 18;
    
    return self;
}

#pragma mark - RMAbstractMercatorTileSource overrides

- (RMSphericalTrapezium)latitudeLongitudeBoundingBox
{
    return kUnitedStatesLatLonBoundingBox;
}

#pragma mark - RMAbstractWebMapSource overrides

- (NSURL *)URLForTile:(RMTile)tile
{
	NSAssert4(((tile.zoom >= self.minZoom) && (tile.zoom <= self.maxZoom)),
			  @"%@ tried to retrieve tile with zoomLevel %d, outside source's defined range %f to %f",
			  self, tile.zoom, self.minZoom, self.maxZoom);
    
	return [NSURL URLWithString:[NSString stringWithFormat:@"http://tile.stamen.com/terrain/%d/%d/%d.jpg", tile.zoom, tile.x, tile.y]];
}

- (NSString *)uniqueTilecacheKey
{
	return @"StamenTerrain";
}

- (NSString *)shortName
{
	return @"Terrain";
}

- (NSString *)longDescription
{
	return @"Orient yourself with our terrain maps, featuring hill shading and natural vegetation colors. These maps showcase advanced labeling and linework generalization of dual-carriageway roads. Terrain was developed in collaboration with Gem Spear and Nelson Minar.";
}

- (NSString *)shortAttribution
{
	return @"<style>body { text-align: left; font-size: 12px; }</style>Map tiles by Stamen Design, under CC BY 3.0. Data by OpenStreetMap, under CC BY SA.";
}

@end
