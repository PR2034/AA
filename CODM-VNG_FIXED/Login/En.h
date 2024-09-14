#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface Enn : NSObject
+ (NSString*)Enc:(NSString*)String;
+ (NSString*)Dec:(NSString*)String;
@end

@interface En : NSObject
+ (NSString *)Enc:(NSString *)plainText;
+ (NSString *)Dec:(NSString *)plainText;
@end
NS_ASSUME_NONNULL_END