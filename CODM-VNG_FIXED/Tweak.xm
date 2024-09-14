#include <stdio.h>
#include <math.h>
#include <string>

#import "substrate.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SpringBoard/SpringBoard.h>
#import "Utilities/XORstring.h"
#import "Login/Login.h"

@interface SBApplication : NSObject
@end

#define UIColorFromHex(hexColor) [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:1.0]

#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^

void nano89proc() {
	UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
	UILabel *menuTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
	menuTitle.text = [NSString stringWithUTF8String:make_string("@jairback owner, R6X9 is scammerrrr!!!!!!!!!!").c_str()];
	menuTitle.textColor = UIColorFromHex(0x72FF13);
	menuTitle.font = [UIFont fontWithName:@"AppleSDGothicNeo-Light" size:40.0f];
	menuTitle.textAlignment = NSTextAlignmentCenter;
	[menuTitle sizeToFit]; //make container the same size as the resulting text
	menuTitle.center = CGPointMake(CGRectGetMidX(mainWindow.bounds), 20);
	menuTitle.adjustsFontSizeToFitWidth = true;
	[mainWindow addSubview: menuTitle];
}

static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {
	timer(4) {		
		/*NSCharacterSet *set = [NSCharacterSet URLHostAllowedCharacterSet]; 
		NSString * domain = [NSString stringWithUTF8String:make_string("smurfragexd").c_str()];
		NSString * subdomian = [NSString stringWithUTF8String:make_string("000webhostapp").c_str()];
		NSString * endpoint = [NSString stringWithUTF8String:make_string("clients").c_str()];
		NSString *url =[NSString stringWithFormat:@"https://%@.%@.com/%@.php",
			[domain stringByAddingPercentEncodingWithAllowedCharacters:set],
			[subdomian stringByAddingPercentEncodingWithAllowedCharacters:set],
			[endpoint stringByAddingPercentEncodingWithAllowedCharacters:set]];
		NSURL *service = [[NSURL alloc] initWithString:url];
		NSURLRequest *urlRequest = [NSURLRequest requestWithURL:service];
		[[[NSURLSession sharedSession] dataTaskWithRequest:urlRequest completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
			NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
			NSInteger statusCode = httpResponse.statusCode;
			if (statusCode >= 200 && statusCode < 300) {
				NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
				NSNumber *yyyy8888 = [json objectForKey:[NSString stringWithUTF8String:make_string("r6x9").c_str()]];
				if(yyyy8888.boolValue) {
					
				} else {
					dispatch_async(dispatch_get_main_queue(), ^{
						nano89proc();
					});
					timer(10) {	
						exit(0);
					});
				}
			} else {
				dispatch_async(dispatch_get_main_queue(), ^{
					nano89proc();
				});
				timer(10) {
					exit(0);
				});
			}
		}] resume];*/
		NSLog(@"R6X9");
	});
}

%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), 
									NULL, 
									&didFinishLaunching, 
									(CFStringRef)UIApplicationDidFinishLaunchingNotification, 
									NULL, 
									CFNotificationSuspensionBehaviorDeliverImmediately);						
}