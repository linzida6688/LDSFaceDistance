
#ifndef LDSFDDefine_h
#define LDSFDDefine_h

/*
 success: is success to get face
 distance: face to camera distance
 */
typedef void(^LDSFDFaceDistanceBlock)(BOOL success, NSUInteger distance);

@protocol LDSFDDetectorDelegate <NSObject>

+ (BOOL)isSupported;

- (void)setCompleteBlock:(LDSFDFaceDistanceBlock)block;

- (void)start;

- (void)stop;

- (void)pause;

- (void)resume;

@end


#endif
