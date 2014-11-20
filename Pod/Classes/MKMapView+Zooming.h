//
//  MKMapView+Zooming.h
//  myfab5
//
//  Created by John Gulbronson on 2/15/13.
//  Copyright (c) 2013 myfab5. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (Zooming)

- (void)zoomToFitMapAnnotations;
- (void)zoomToFitMapAnnotationsExpandX:(CGFloat)x expandY:(CGFloat)y;
//- (void)zoomToLocation:(MF5Location *)location;

@end
