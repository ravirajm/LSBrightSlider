#import <UIKit/UIKit.h>

@interface SBBrightnessController : NSObject {}
+ (id)sharedBrightnessController;
- (void)_setBrightnessLevel:(float)arg1 showHUD:(BOOL)arg2;
@end

%hook SBAwayMediaControlsView
- (id)initWithFrame:(struct CGRect)arg1 {
self = %orig;
UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(9, 65, 300, 20)];
[slider addTarget:self action:@selector(changeBrightness:) forControlEvents:UIControlEventValueChanged];
    slider.minimumValue = 0.0;
slider.maximumValue = 1.0;
NSNumber *bl=nil;
bl = (NSNumber*) CFPreferencesCopyAppValue(CFSTR("SBBacklightLevel2" ), CFSTR("com.apple.springboard"));
slider.value = [bl floatValue];
slider.continuous = YES;
[self addSubview:slider];
return self;
}
%new(v@:)
- (void)changeBrightness:(UISlider *)slider {
CFPreferencesSetAppValue(CFSTR("SBBacklightLevel2" ), [NSNumber numberWithFloat:slider.value], CFSTR("com.apple.springboard"));
    [[objc_getClass("SBBrightnessController") sharedBrightnessController] _setBrightnessLevel:slider.value showHUD:NO];
}
%end