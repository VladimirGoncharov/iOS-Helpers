//
//  MKMapView+Zooming.m
//  myfab5
//
//  Created by John Gulbronson on 2/15/13.
//  Copyright (c) 2013 myfab5. All rights reserved.
//

#import "MKMapView+Zooming.h"

@implementation MKMapView (Zooming)

- (void)zoomToFitMapAnnotations
{
    [self zoomToFitMapAnnotationsExpandX:0 expandY:0];
}

/*
- (void)zoomToLocation:(MF5Location *)location
{
    MKCoordinateRegion region;
    region.center = location.coordinate;
    region.span.latitudeDelta = 1.0;
    region.span.longitudeDelta = 1.0;

    region = [self regionThatFits:region];
    [self setRegion:region animated:YES];
}
*/
- (void)zoomToFitMapAnnotationsExpandX:(CGFloat)x expandY:(CGFloat)y
{
    if ([self.annotations count] == 0) return;
    
    CLLocationCoordinate2D topLeftCoord;
    topLeftCoord.latitude = -90;
    topLeftCoord.longitude = 180;
    
    CLLocationCoordinate2D bottomRightCoord;
    bottomRightCoord.latitude = 90;
    bottomRightCoord.longitude = -180;
    
    for(id<MKAnnotation> annotation in self.annotations) {
   
        if([annotation isKindOfClass:[MKUserLocation class]])
            continue;
        
        if (annotation.coordinate.longitude == 0 || annotation.coordinate.latitude == 0)
            continue;
        if (annotation.coordinate.longitude > 180 || annotation.coordinate.longitude < -180)
            continue;
        if (annotation.coordinate.latitude > 90 || annotation.coordinate.latitude < -90)
            continue;
        
        topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
        topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);
        bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
        bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
    }
    
    MKCoordinateRegion region;
    region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.4;
    region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
    region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * (1.2 + x);
    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * (1.2 + y);
    //NSLog(@"%f",region.span.longitudeDelta);

    if (region.span.latitudeDelta < 0.01)
        region.span.latitudeDelta = 0.01;

    if (region.span.longitudeDelta < 0.01)
        region.span.longitudeDelta = 0.01;
    
    if (region.center.longitude > 180 || region.center.longitude < -180)
        return;
    if (region.center.latitude > 90 || region.center.latitude < -90)
        return;

    if (region.span.longitudeDelta > 180)
        return;
    if (region.span.latitudeDelta > 90)
        return;

    region = [self regionThatFits:region];
    [self setRegion:region animated:YES];
}

@end
