//
//  OBBoxColor.h
//  occupyBox
//
//  Created by biqinglin on 2017/4/20.
//  Copyright © 2017年 biqinglin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OBBoxColor : NSObject

UIColor *occupiedColor();

UIColor *transformColor(NSString *string);

void changeColor(NSString *string);

@end
