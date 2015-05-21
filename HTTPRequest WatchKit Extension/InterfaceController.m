//
//  InterfaceController.m
//  HTTPRequest WatchKit Extension
//
//  Created by Dang Thanh Than on 5/21/15.
//  Copyright (c) 2015 Than Dang. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *lblWeather;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


- (IBAction)updateWeather {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=Cupertino,usa"]];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *dataResponse = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSMutableDictionary *dictResponse = [NSJSONSerialization JSONObjectWithData:dataResponse options:NSJSONReadingMutableContainers error:&error];
    if (!error) {
        NSArray *weathers = dictResponse[@"weather"];
        NSString *currentWeather = @"";
        for (NSDictionary *dict in weathers) {
            currentWeather = dict[@"main"];
        }
        self.lblWeather.text = currentWeather;
    }
}


@end



