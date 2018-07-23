#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

#define IDFA_STRING @"com.jason-z.test.idfa"

@interface CDVCamera : CDVPlugin {
  // Member variables go here.
}

- (void)getDeviceID:(CDVInvokedUrlCommand*)command;

@end