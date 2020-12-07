
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <LDSFaceDistance/LDSFDDefine.h>

@interface LDSFDConfiguration : NSObject

//default is 0, NSIntegerMax for ever
@property(nonatomic, assign) NSInteger repeatCount;

//must bigger than 1.0s
@property(nonatomic, assign) NSTimeInterval timeInterval;

//default firstRepeatDelay = timeInterval, must bigger than 1.0s
@property(nonatomic, assign) NSTimeInterval firstRepeatDelay;

@end

@interface LDSFDFaceToCameraDistance : NSObject

+ (void)cameraAuthorization:(void(^)(BOOL authorized))block;

+ (BOOL)isSupported;

+ (BOOL)isCaptureDeviceSupport;

+ (BOOL)authorized;

+ (void)startWithConfiguration:(LDSFDConfiguration *)configuration detectBlock:(LDSFDFaceDistanceBlock)block;

+ (void)setStartWithoutFirstBlock:(void(^)(void))block;

+ (void)stop;

+ (AVAuthorizationStatus)cameraAuthorizationStatus;

@end
