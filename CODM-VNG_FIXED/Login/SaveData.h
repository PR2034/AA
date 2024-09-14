#import <Foundation/Foundation.h>
#import "SaveData.h"
#import "UIKit/UIKit.h"
#import <Security/Security.h>

@interface CHKeychain : NSObject
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;
+ (void)Set;
+ (void)SetAlert:(bool)Exit Name:(NSString *)Name Text:(NSString *)Text;
+ (NSString *)GetUUID;
+ (NSString *)GetBundle;
+ (NSString *)GetName;
@end
