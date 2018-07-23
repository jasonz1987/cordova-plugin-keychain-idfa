/********* cordova-plugin-keychain-idfa.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "KeychainHelper.h"
#import ADSupport
#define kIsStringValid(text) (text && text!=NULL && text.length>0)

@implementation CDVKeychainIDFA

- (void)getDeviceID:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    //  read cache

    NSString *deviceID = [KeychainIDFA getIdfaString];
    if (kIsStringValid(deviceID))
    {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        if ([ASIdentifierManager sharedManager].advertisingTrackingEnabled)
        {
            deviceID = [[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString] lowercaseString];
            [KeychainIDFA setIdfaString:deviceID];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"未开启adsupport"];

        }
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

+ (NSString*)getIdfaString
{
    NSString *idfaStr = [KeychainHelper load:IDFA_STRING];
    if (kIsStringValid(idfaStr))
    {
        return idfaStr;
    }
    else
    {
        return nil;
    }
}

+ (BOOL)setIdfaString:(NSString *)secValue
{
    if (kIsStringValid(secValue))
    {
        [KeychainHelper save:IDFA_STRING data:secValue];
        return YES;
    }
    else
    {
        return NO;
    }
}


@end
