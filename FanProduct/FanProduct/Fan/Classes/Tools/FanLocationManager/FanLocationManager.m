//
//  FanLocationManager.m
//  Baletu
//
//  Created by fangkangpeng on 2019/1/9.
//  Copyright © 2019 Fan. All rights reserved.
//

#import "FanLocationManager.h"

@interface FanLocationManager()<CLLocationManagerDelegate>
/**回调block 一次定位仅提供一次回调*/
@property (nonatomic ,copy)void (^hander)(CLLocationCoordinate2D coor ,cat_action_type idx );
/**定位manager*/
@property(nonatomic,strong)CLLocationManager *locationManager;

@end

@implementation FanLocationManager
+ (void)startUpdatingLocationWithHander:(void (^)(CLLocationCoordinate2D coor ,cat_action_type idx ))hander{
    [FanLocationManager shareInstance].hander = hander;
    [[FanLocationManager shareInstance] startUpdatingLocation];
}

+ (instancetype)shareInstance{
    static FanLocationManager *tools = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[FanLocationManager alloc] init];
    });
    return tools;
}
- (void)startUpdatingLocation{
    if ([CLLocationManager locationServicesEnabled]
        && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied
        && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusNotDetermined) {
        if(!_coor.latitude){
            [self.locationManager startUpdatingLocation];
        }else{
            if (_hander) {
                _hander(_coor,cat_action_nil);
                _hander = nil;
            }
        }
    }else{
        //未开启定位
        _coor.latitude = 0;
        _coor.longitude = 0;
        if (_hander) {
            _hander(_coor,cat_action_nil);
            _hander = nil;
        }
    }
}

- (void)stopUpdatingLocation{
    [_locationManager stopUpdatingLocation];
}
#pragma makr -- CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
//    _coor = AMapCoordinateCocat_action_nilnvert(newLocation.coordinate,AMapCoordinateTypeGPS);
    [manager stopUpdatingLocation];
    if (_hander) {
        _hander(_coor,cat_action_nil);
        _hander = nil;
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    [manager stopUpdatingLocation];
    _coor.latitude = 0;
    _coor.longitude = 0;
    if (_hander) {
        _hander(_coor,cat_action_nil);
        _hander = nil;
    }
}
#pragma mark -- get
- (CLLocationManager *)locationManager{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = kCLDistanceFilterNone;
    }return _locationManager;
}
@end
