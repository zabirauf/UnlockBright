#import <Preferences/Preferences.h>

@interface UnlockBrightSettingsListController: PSListController {
}
@end

@implementation UnlockBrightSettingsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"UnlockBrightSettings" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
