//
//  OBBoxColor.m
//  occupyBox
//
//  Created by biqinglin on 2017/4/20.
//  Copyright © 2017年 biqinglin. All rights reserved.
//

#import "OBBoxColor.h"

static NSString *const kColorKey = @"colorkey";

@implementation OBBoxColor

UIColor *occupiedColor() {
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:kColorKey]) {
        
        NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:kColorKey];
        NSArray *strings = [string componentsSeparatedByString:@","];
        return RGB([strings[0] integerValue], [strings[1] integerValue], [strings[2] integerValue]);
    }
    return RGB(244, 89, 27);
}

UIColor *transformColor(NSString *string) {
    
    NSArray *strings = [string componentsSeparatedByString:@","];
    return RGB([strings[0] integerValue], [strings[1] integerValue], [strings[2] integerValue]);
}

void changeColor(NSString *string) {
    
    [[NSUserDefaults standardUserDefaults] setValue:string forKey:kColorKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
