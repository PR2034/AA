#import "SaveData.h"
#import "Login.h"

static UIViewController *_ShooterController(UIViewController *cont) {
    UIViewController *ShooterTopController = cont;
    while (ShooterTopController.presentedViewController) {
        ShooterTopController = ShooterTopController.presentedViewController;
    }
    if ([ShooterTopController isKindOfClass:[UINavigationController class]]) {
        UIViewController *visible = ((UINavigationController *)ShooterTopController).visibleViewController;
        if (visible) {
            ShooterTopController = visible;
        }
    }
    return (ShooterTopController != cont ? ShooterTopController : nil);
}
static UIViewController *ShooterController() {
    UIViewController *ShooterTopController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *next = nil;
    while ((next = _ShooterController(ShooterTopController)) != nil) {
        ShooterTopController = next;
    }
    return ShooterTopController;
}

static UIViewController *_ShooterController2(UIViewController *cont) {
    UIViewController *ShooterTopController = cont;
    while (ShooterTopController.presentedViewController) {
        ShooterTopController = ShooterTopController.presentedViewController;
    }
    if ([ShooterTopController isKindOfClass:[UINavigationController class]]) {
        UIViewController *visible = ((UINavigationController *)ShooterTopController).visibleViewController;
        if (visible) {
        ShooterTopController = visible;
        }
    }
    return (ShooterTopController != cont ? ShooterTopController : nil);
}
static UIViewController *ShooterController2() {
    UIViewController *ShooterTopController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *next = nil;
    while ((next = _ShooterController2(ShooterTopController)) != nil) {
        ShooterTopController = next;
    }
    return ShooterTopController;
}

@implementation CHKeychain
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
return [NSMutableDictionary dictionaryWithObjectsAndKeys:(__bridge id)kSecClassGenericPassword,(__bridge id)kSecClass, service, (__bridge id)kSecAttrService, service, (__bridge id)kSecAttrAccount, (__bridge id)kSecAttrAccessibleAfterFirstUnlock,(__bridge id)kSecAttrAccessible, nil];
}

+ (void)save:(NSString *)service data:(id)data {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge id)kSecValueData];
    SecItemAdd((__bridge CFDictionaryRef)keychainQuery, NULL);
}

+ (id)load:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    [keychainQuery setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}

+ (void)delete:(NSString *)service {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
}

+ (void)Set {
    UIAlertController *AlertS = [UIAlertController alertControllerWithTitle:@"Byano" message:@"قم بنسخ الكود وضعط زر الدخول" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *LoginBtn = [UIAlertAction actionWithTitle:@"تسجيل دخول جديد" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [Login Lifand:false];
    }];
    [AlertS addAction:LoginBtn];
    [ShooterController2() presentViewController:AlertS animated:YES completion:nil];
}

+ (void)SetAlert:(bool)Exit Name:(NSString *)Name Text:(NSString *)Text {
    UIAlertController *Alert = [UIAlertController alertControllerWithTitle:Name message:Text preferredStyle:UIAlertControllerStyleAlert];
    [ShooterController() presentViewController:Alert animated:true completion:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (Exit) {
            exit(0);
        } else {
            [Alert dismissViewControllerAnimated:YES completion:nil];
        }
    });
}

+ (NSString *)GetUUID {
    return [[UIDevice currentDevice] identifierForVendor].UUIDString;
}

+ (NSString *)GetBundle {
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)GetName {
    return [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
}
@end
