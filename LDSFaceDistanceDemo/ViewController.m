//
//  ViewController.m
//  LDSFaceDistanceDemo
//
//  Created by Lindashuai on 2020/12/8.
//

#import "ViewController.h"
#import <LDSFaceDistance/LDSFDDefine.h>
#import <LDSFaceDistance/LDSFDFaceToCameraDistance.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Privacy - Camera Usage Description ->info.plist
    [LDSFDFaceToCameraDistance startWithConfiguration:[self createFDConfig] detectBlock:^(BOOL success, NSUInteger distance) {
        NSLog(@"distance %ld", distance);
    }];
}

- (LDSFDConfiguration *)createFDConfig {
    LDSFDConfiguration *config = [[LDSFDConfiguration alloc] init];
    config.repeatCount = NSIntegerMax;
    config.firstRepeatDelay = 5.0;
    config.timeInterval = 2.0;
    return config;
}

@end
