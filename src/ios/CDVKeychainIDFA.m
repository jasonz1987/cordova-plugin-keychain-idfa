#import <Cordova/CDV.h>
#import "CDVKeychainIDFA.h"
#import "KeychainHelper.h"
#import <AdSupport/ASIdentifierManager.h>

#define kIsStringValid(text) (text && text!=NULL && text.length>0)

NSString *key = @"com.jason-z.test.idfa";


@implementation CDVKeychainIDFA {
    
}

- (void)getDeviceID:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    NSDictionary *args = [command.arguments objectAtIndex:0];

    if(args.length>0) {
       if([args objectForkey:@"key"]) {
            key = args objectForkey:@"key"];
       }
    }

    //  read cache
    NSString *deviceID = [CDVKeychainIDFA getIdfaString];
    if (kIsStringValid(deviceID))
    {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:deviceID];
    } else {
        if([ASIdentifierManager sharedManager].advertisingTrackingEnabled)
        {
            deviceID = [[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString] lowercaseString];
            [CDVKeychainIDFA setIdfaString:deviceID];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:deviceID];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"未开启adsupport"];

        }
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

+ (NSString*)getIdfaString
{
    NSString *idfaStr = [KeychainHelper load:key];
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
        [KeychainHelper save:key data:secValue];
        return YES;
    }
    else
    {
        return NO;
    }
}


@end
