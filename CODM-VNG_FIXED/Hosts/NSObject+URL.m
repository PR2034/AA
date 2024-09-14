


#import "NSObject+URL.h"
#import "EtcHostsURLProtocol.h"

@implementation NSObject (URL)

+ (void)load
{
    [NSURLProtocol registerClass:[EtcHostsURLProtocol class]];
    [EtcHostsURLProtocol configureHostsWithBlock:^(id <EtcHostsConfiguration> configuration) {
        [configuration resolveHostName:@"googleads.g.doubleclick.net" toIPAddress:@"127.0.0.1"];
        [configuration resolveHostName:@"west-midas.codm.activision.com" toIPAddress:@"127.0.0.1"];
        [configuration resolveHostName:@"west-tdm.codmwest.com" toIPAddress:@"127.0.0.1"];
        [configuration resolveHostName:@"usalive.lobby1.west.codm.activision.com" toIPAddress:@"127.0.0.1"];
        [configuration resolveHostName:@"dir.4.401402081.west-gcloud.codm.activision.com" toIPAddress:@"127.0.0.1"];
    }];
}
   

@end
