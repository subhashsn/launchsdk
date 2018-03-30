//
//  AccelerometerCell.h
//  HealthSample
//
//  Created by Echeandia, Augie on 11/27/17.
//  Copyright © 2017 Garmin International. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GHAccelerometerData;

@interface AccelerometerCell : UITableViewCell

-(void)configureWith:(GHAccelerometerData*)data;

@end
