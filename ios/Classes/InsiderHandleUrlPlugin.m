#import "InsiderHandleUrlPlugin.h"
#import <InsiderMobile/Insider.h>
//#import <InsiderHybrid/InsiderHybrid.h>
//#import <UserNotifications/UserNotifications.h>

@interface InsiderHandleUrlPlugin ()
//<FlutterStreamHandler, UIApplicationDelegate, UNUserNotificationCenterDelegate>
//@property(nonatomic, copy) NSMutableArray *eventsPreSink;
@end

@implementation InsiderHandleUrlPlugin
//{
//    FlutterEventSink _eventSink;
//    NSMutableArray *eventsPreSink;
//}

static id _instance;

+ (InsiderHandleUrlPlugin *)sharedInstance {
    if (_instance == nil) {
        _instance = [[InsiderHandleUrlPlugin alloc] init];
    }
    return _instance;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    InsiderHandleUrlPlugin *instance = [InsiderHandleUrlPlugin sharedInstance];
//    instance.eventsPreSink = [[NSMutableArray alloc] init];

    
//    FlutterEventChannel* eventChannel = [FlutterEventChannel
//                                         eventChannelWithName:@"insider_handle_url/events"
//                                         binaryMessenger:[registrar messenger]];
//
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"insider_handle_url"
                                     binaryMessenger:[registrar messenger]];

    [registrar addMethodCallDelegate:instance channel:channel];
    
//    [eventChannel setStreamHandler:instance];
//    [registrar addApplicationDelegate:instance];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"handleUrl" isEqualToString:call.method]) {
        NSDictionary* argsMap = call.arguments;
        NSString* urlStr = argsMap[@"url"];
        
        NSURL* url = [NSURL URLWithString:urlStr];
        
        [Insider handleUrl:url];
    } else {
        result(FlutterMethodNotImplemented);
    }
}
//
//// will track insider's initialization
//- (BOOL)application:(UIApplication *)application
//    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    // Insider initialization
//    UNUserNotificationCenter.currentNotificationCenter.delegate = self;
//    NSURL *url = (NSURL *)launchOptions[UIApplicationLaunchOptionsURLKey];
//    [Insider initWithLaunchOptions:launchOptions partnerName:@"reallifeenglishbr" appGroup:@"group.com.reallifeglobal.app"];
//    [Insider registerInsiderCallbackWithSelector:@selector(registerCallback:) sender:self];
//
//    return YES;
//}
//
//
//- (BOOL)application:(UIApplication *)application
//            openURL:(NSURL *)url
//            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
//  return YES;
//}
//
//- (BOOL)application:(UIApplication *)application
//    continueUserActivity:(NSUserActivity *)userActivity
//      restorationHandler:(void (^)(NSArray *_Nullable))restorationHandler {
//  if ([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]) {
//    return YES;
//  }
//  return NO;
//}
//
//// will dispatch events to the callback functions as soon we register for them
//-(void)registerCallback:(NSDictionary*)dict {
//    @try {
//        // not triggering nulled events
//        if (!dict || dict == NULL || dict == [NSNull null] || dict == nil) {
//            return;
//        }
//
//        if (!_eventSink || _eventSink == nil) {
//            [self.eventsPreSink addObject:[InsiderHybrid dictToJson:dict]];
//            return;
//        }
//
//        _eventSink([InsiderHybrid dictToJson:dict]);
//    } @catch (NSException *e) {
//        [Insider sendError:e desc:[NSString stringWithFormat:@"%s:%d", __func__, __LINE__]];
//    }
//}
//
//
//- (FlutterError * _Nullable)onCancelWithArguments:(id _Nullable)arguments {
//    _eventSink = nil;
//    return nil;
//}
//
//- (FlutterError * _Nullable)onListenWithArguments:(id _Nullable)arguments eventSink:(nonnull FlutterEventSink)events {
//    @try {
//        _eventSink = events;
//    } @catch (NSException *e) {
//        [Insider sendError:e desc:[NSString stringWithFormat:@"%s:%d", __func__, __LINE__]];
//    }
//    // add preSink events
//    for (id object in self.eventsPreSink) {
//        // do something with object
//        _eventSink(object);
//    }
//
//    return nil;
//}

@end
