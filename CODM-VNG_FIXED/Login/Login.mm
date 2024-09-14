#import "Login.h"
#include "../ModController.h"
#import "SaveData.h"
#import "En.h"

ModController *modController;
NSString *Value;
id VvGg;

@implementation Login
+ (void)load {

dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        if (modController == nil) {
                            modController = [[ModController alloc] initWithNibName:@"ModController" bundle:nil];
                        }
                        [modController view];
                    });
}

+ (void)Lifand:(bool)Swspd {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (modController == nil) {
            modController = [[ModController alloc] initWithNibName:@"ModController" bundle:nil];
        }
        [modController view];
    });

return;

    if (Swspd) {
        NSString *URLString = [NSString stringWithFormat:@"%@%@", [NSString stringWithFormat:[Enn Dec:[En Dec:@"DqPJooUqsk5XLRkk9jJePV65xQu7riDzTj7LEqpqxXh+mjxIoUK6iI1gpYhy4NzIVtXEScq4k/1RRWZdZnKAq9PODNx+XLk/MKiGeKe6DoE="]], [CHKeychain GetUUID], VvGg], @"1"];
        if ([[[NSString alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:URLString]] encoding:NSUTF8StringEncoding] isEqualToString:@""]) {
            [CHKeychain SetAlert:false Name:@"R6X9" Text:@"Code Not Found"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [CHKeychain Set];
            });
        } else {
            NSData *Pqnxjw = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:URLString]];
            NSDictionary *Qdjdie = [NSJSONSerialization JSONObjectWithData:Pqnxjw options:0 error:nil];
            NSData *Lwndpw = [[self Paint:[Qdjdie objectForKey:@"1"] Qaint:[Qdjdie objectForKey:@"0"]] dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *Peldbe = [NSJSONSerialization JSONObjectWithData:Lwndpw options:0 error:nil];
            if ([[Peldbe objectForKey:@"5"] isEqualToString:@"1"]) {
                [CHKeychain SetAlert:true Name:@"R6X9" Text:Peldbe[@"6"]];
            } else if ([[Peldbe objectForKey:@"5"] isEqualToString:@"0"] && [[Peldbe objectForKey:@"1"] isEqualToString:@"1"] && [[Peldbe objectForKey:@"0"] isEqualToString:[CHKeychain GetUUID]]) {
                NSData *Pqnxjw2 = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:Peldbe[@"7"]]];
                NSDictionary *Qdjdie2 = [NSJSONSerialization JSONObjectWithData:Pqnxjw2 options:0 error:nil];
                NSData *Lwndpw2 = [[self Paint:[Qdjdie2 objectForKey:@"1"] Qaint:[Qdjdie2 objectForKey:@"0"]] dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary *Peldbe2 = [NSJSONSerialization JSONObjectWithData:Lwndpw2 options:0 error:nil];
                if ([[Peldbe objectForKey:@"4"] isEqualToString:URLString] && [[Peldbe2 objectForKey:@"4"] isEqualToString:URLString] && [[Peldbe objectForKey:@"7"] isEqualToString:Peldbe2[@"7"]] && [[Peldbe2 objectForKey:@"5"] isEqualToString:@"0"] && [[Peldbe2 objectForKey:@"1"] isEqualToString:@"1"] && [[Peldbe2 objectForKey:@"0"] isEqualToString:[CHKeychain GetUUID]]) {
                    [CHKeychain SetAlert:false Name:@"R6X9" Text:[NSString stringWithFormat:@"%@\n%@", Peldbe[@"2"], Peldbe[@"3"]]];
                    // Start Menu
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        if (modController == nil) {
                            modController = [[ModController alloc] initWithNibName:@"ModController" bundle:nil];
                        }
                        [modController view];
                    });
                } else {
                    [CHKeychain SetAlert:true Name:@"R6X9" Text:@"FuckYou"];
                }
            } else {
                [CHKeychain SetAlert:false Name:@"R6X9" Text:Peldbe[@"2"]];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [CHKeychain Set];
                });
            }
        }
    } else {
        UIPasteboard *GetPaste = [UIPasteboard generalPasteboard];
        NSString *GetKey = GetPaste.string;
        NSString *URLString = [NSString stringWithFormat:@"%@%@", [NSString stringWithFormat:[Enn Dec:[En Dec:@"DqPJooUqsk5XLRkk9jJePV65xQu7riDzTj7LEqpqxXh+mjxIoUK6iI1gpYhy4NzIVtXEScq4k/1RRWZdZnKAq9PODNx+XLk/MKiGeKe6DoE="]], [CHKeychain GetUUID], GetKey], @"1"];
        if ([[[NSString alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:URLString]] encoding:NSUTF8StringEncoding] isEqualToString:@""]) {
            [CHKeychain SetAlert:false Name:@"R6X9" Text:@"Code Not Found"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [CHKeychain Set];
            });
        } else {
            NSData *Pqnxjw = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:URLString]];
            NSDictionary *Qdjdie = [NSJSONSerialization JSONObjectWithData:Pqnxjw options:0 error:nil];
            NSData *Lwndpw = [[self Paint:[Qdjdie objectForKey:@"1"] Qaint:[Qdjdie objectForKey:@"0"]] dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *Peldbe = [NSJSONSerialization JSONObjectWithData:Lwndpw options:0 error:nil];
            if ([[Peldbe objectForKey:@"5"] isEqualToString:@"1"]) {
                [CHKeychain SetAlert:true Name:@"R6X9" Text:Peldbe[@"6"]];
            } else if ([[Peldbe objectForKey:@"5"] isEqualToString:@"0"] && [[Peldbe objectForKey:@"1"] isEqualToString:@"1"] && [[Peldbe objectForKey:@"0"] isEqualToString:[CHKeychain GetUUID]]) {
                NSData *Pqnxjw2 = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:Peldbe[@"7"]]];
                NSDictionary *Qdjdie2 = [NSJSONSerialization JSONObjectWithData:Pqnxjw2 options:0 error:nil];
                NSData *Lwndpw2 = [[self Paint:[Qdjdie2 objectForKey:@"1"] Qaint:[Qdjdie2 objectForKey:@"0"]] dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary *Peldbe2 = [NSJSONSerialization JSONObjectWithData:Lwndpw2 options:0 error:nil];
                if ([[Peldbe objectForKey:@"4"] isEqualToString:URLString] && [[Peldbe2 objectForKey:@"4"] isEqualToString:URLString] && [[Peldbe objectForKey:@"7"] isEqualToString:Peldbe2[@"7"]] && [[Peldbe2 objectForKey:@"5"] isEqualToString:@"0"] && [[Peldbe2 objectForKey:@"1"] isEqualToString:@"1"] && [[Peldbe2 objectForKey:@"0"] isEqualToString:[CHKeychain GetUUID]]) {
                    NSMutableDictionary *R6X9 = [NSMutableDictionary dictionary];
                    [R6X9 setObject:GetKey forKey:Value];
                    [CHKeychain save:@"R6X9" data:R6X9];
                    [CHKeychain SetAlert:true Name:@"R6X9" Text:[NSString stringWithFormat:@"%@\n%@\n سيتم اخراجك من اللعبة اعد الدخول", Peldbe[@"2"], Peldbe[@"3"]]];
                } else {
                    [CHKeychain SetAlert:true Name:@"R6X9" Text:@"FuckYou"];
                }
            } else {
                [CHKeychain SetAlert:false Name:@"R6X9" Text:Peldbe[@"2"]];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [CHKeychain Set];
                });
            }
        }
    }
}

+ (NSString *)Paint:(NSString *)Paint Qaint:(NSString *)Qaint {
    return [[self Qaint:[self Qaint:[self Qaint:[self Qaint:[self Qaint:Paint]]]]] stringByReplacingOccurrencesOfString:[self Qaint:[self Qaint:[self Qaint:[self Qaint:[self Qaint:Qaint]]]]] withString:@""];
}

+ (NSString *)Qaint:(NSString *)Qaint {
    NSData *Nsjdvw = [[NSData alloc] initWithBase64EncodedString:Qaint options:0];
    return [[NSString alloc] initWithData:Nsjdvw encoding:NSUTF8StringEncoding];
}
@end
