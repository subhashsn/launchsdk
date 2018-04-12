#import <Cordova/CDV.h>

@interface Launcher : CDVPlugin

- (void)canLaunchsdk:(CDVInvokedUrlCommand*)command;
- (void)launchersdk:(CDVInvokedUrlCommand*)command;

@end
