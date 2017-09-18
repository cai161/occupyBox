//
//  OBCalcu.h
//  occupyBox
//
//  Created by biqinglin on 2017/4/19.
//  Copyright © 2017年 biqinglin. All rights reserved.
//

#import <Foundation/Foundation.h>

// 计算类

@interface OBCalcu : NSObject

/**
 找出当前被占领的box

 @param index 当前被点击的索引
 @param allBoxs 所有box状态集合(包含未被占领NO以及被占领YES的box集合)
 @return 当前被占领的box集合
 */
NSArray *newBoxs(NSInteger index, NSArray *allBoxs);

@end
