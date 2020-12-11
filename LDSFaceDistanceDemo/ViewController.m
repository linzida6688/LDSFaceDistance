//
//  ViewController.m
//  LDSFaceDistanceDemo
//
//  Created by Lindashuai on 2020/12/8.
//

#import "ViewController.h"
#import <LDSFaceDistance/LDSFDDefine.h>
#import <LDSFaceDistance/LDSFDFaceToCameraDistance.h>

@interface ViewController ()

@property(nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.label];
    // Privacy - Camera Usage Description ->info.plist
    __weak typeof(self) weakSelf = self;
    [LDSFDFaceToCameraDistance startWithConfiguration:[self createFDConfig] detectBlock:^(BOOL success, NSUInteger distance) {
        NSLog(@"distance %ld", distance);
        weakSelf.label.text = [NSString stringWithFormat:@"face to camera distance %ld", distance];
        if(distance < 1000) {
            //weakSelf.label.hidden = NO;
        } else {
            //weakSelf.label.hidden = YES;
        }
    }];
}

- (LDSFDConfiguration *)createFDConfig {
    LDSFDConfiguration *config = [[LDSFDConfiguration alloc] init];
    config.repeatCount = NSIntegerMax;
    config.firstRepeatDelay = 5.0;
    config.timeInterval = 2.0;
    return config;
}

- (UILabel *)label {
    if(_label == nil) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, (self.view.frame.size.height / 2) - 100, self.view.frame.size.width, 100)];
        _label.font = [UIFont systemFontOfSize:20];
        _label.textColor = [UIColor blackColor];
        _label.textAlignment = NSTextAlignmentCenter;
        //_label.hidden = YES;
    }
    return _label;
}

@end
