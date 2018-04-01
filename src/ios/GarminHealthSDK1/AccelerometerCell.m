//
//  AccelerometerCell.m
//  HealthSample
//
//  Created by Echeandia, Augie on 11/27/17.
//  Copyright © 2017 Garmin International. All rights reserved.
//

#import "AccelerometerCell.h"
#import <health/health.h>


@interface AccelerometerCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeStampLabel;
@property (weak, nonatomic) IBOutlet UILabel *xValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *yValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *zValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *zValueLabel1;

@property (strong) NSDateFormatter *dateFormatter;

@end

@implementation AccelerometerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"MMM d h:mm a"];
    
    self.timeStampLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    self.timeStampLabel.textColor = [UIColor darkGrayColor];
    
    self.xValueLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    self.xValueLabel.textColor = [UIColor darkGrayColor];
    
    self.yValueLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    self.yValueLabel.textColor = [UIColor darkGrayColor];
    
    self.zValueLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    self.zValueLabel.textColor = [UIColor darkGrayColor];
    
}

-(void)configureWith:(GHAccelerometerData*)data {
    
    GHAccelerometerSample *sample = data.accelerometerSamples[0];
    
    NSString *date = [self.dateFormatter stringFromDate:sample.timestamp];
    self.timeStampLabel.text = [NSString stringWithFormat:@"%@", date];
    
    NSMutableString *xValuesString = [NSMutableString new];
    NSMutableString *yValuesString = [NSMutableString new];
    NSMutableString *zValuesString = [NSMutableString new];

    for (GHAccelerometerSample *sample in data.accelerometerSamples) {
        
        [xValuesString appendString:[NSString stringWithFormat:@"%.2f\n", sample.xValue.floatValue]];
        [yValuesString appendString:[NSString stringWithFormat:@"%.2f\n", sample.yValue.floatValue]];
        [zValuesString appendString:[NSString stringWithFormat:@"%.2f\n", sample.zValue.floatValue]];
    }
    
    self.xValueLabel.text = [NSString stringWithFormat:@"x: %@", xValuesString];
    self.yValueLabel.text = [NSString stringWithFormat:@"y: %@", yValuesString];
    self.zValueLabel.text = [NSString stringWithFormat:@"z: %@", zValuesString];

}

@end



