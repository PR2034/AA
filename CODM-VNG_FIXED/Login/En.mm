#import "En.h"

NSString *IV = @"PTT?D@DS?Q?GPCTC";
NSString *KEY = @"HBBEDJDDA@PDU?GAQQDVAHTAT?BB@RPH";

int offset = 15;
@implementation Enn
+ (NSString*)Enc:(NSString*)String {
    NSMutableString *encrptedString = [[NSMutableString alloc] init];
    for (int i = 0; i < String.length; i++) {
        unichar character = [String characterAtIndex:i];
        character += offset;
        [encrptedString appendFormat:@"%C",character];
    }
    return encrptedString;
}

+ (NSString*)Dec:(NSString*)String {
    NSMutableString *decrptedString = [[NSMutableString alloc] init];
    for (int i = 0; i < String.length; i++) {
        unichar character = [String characterAtIndex:i];
        character -= offset;
        [decrptedString appendFormat:@"%C",character];
    }
    return decrptedString;
}
@end

@implementation En
+ (NSString *)Enc:(NSString *)plainText {
    NSMutableData *result =  [En doAES:[plainText dataUsingEncoding:NSUTF8StringEncoding] context: kCCEncrypt error:nil];
    return [result base64EncodedStringWithOptions:0];
}

+ (NSString *)Dec:(NSString *)encryptedBase64String {
    NSData *dataToDecrypt = [[NSData alloc] initWithBase64EncodedString:encryptedBase64String options:0];
    NSMutableData *result = [En doAES:dataToDecrypt context: kCCDecrypt error:nil];
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
}

+ (NSMutableData *)doAES:(NSData *)dataIn context:(CCOperation)kCCEncrypt_or_kCCDecrypt error:(NSError **)error {
    CCCryptorStatus ccStatus = kCCSuccess;
    size_t          cryptBytes = 0;
    NSMutableData  *dataOut    = [NSMutableData dataWithLength:dataIn.length + kCCKeySizeAES256];
NSString *const IVV = [Enn Dec:IV];
NSString *const KEYY =  [Enn Dec:KEY];
NSData *key = [KEYY dataUsingEncoding:NSUTF8StringEncoding];
        NSData *iv = [IVV dataUsingEncoding:NSUTF8StringEncoding];
    
    ccStatus = CCCrypt( kCCEncrypt_or_kCCDecrypt,
                       kCCAlgorithmAES,
                       kCCOptionPKCS7Padding,
                       key.bytes,
                       kCCKeySizeAES256,
                       iv.bytes,
                       dataIn.bytes,
                       dataIn.length,
                       dataOut.mutableBytes,
                       dataOut.length,
                       &cryptBytes);
    
    if (ccStatus == kCCSuccess) {
        dataOut.length = cryptBytes;
    } else {
        dataOut = nil;
    }
    return dataOut;
}
@end