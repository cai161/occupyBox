//
//  OBCalcu.m
//  occupyBox
//
//  Created by biqinglin on 2017/4/19.
//  Copyright © 2017年 biqinglin. All rights reserved.
//

#import "OBCalcu.h"

@implementation OBCalcu

/**
 游戏规则：
 每个box都有两个状态，即free状态（数据源为NO）以及 occupied状态（数据源为YES） 初始状态都为free状态
 当box被点击，那么该box的当前状态会变为对立状态，即free->occupied 或者 occupied->free
 同时该box相邻（不包含对角线相邻的box）的box状态也会互换
 当所有的box都变为occupied状态时游戏结束
 
 思路：
 根据被点击box的索引规则区分 设阶数为:d
 1：边角索引规律
    左上：x0 = 0
        相邻： 
            x0 + 1
            x0 + d
    右上：x1 = 阶数 - 1
        相邻： 
            x1 - 1
            x1 + d
    左下：x2 = 阶数的平方 - 阶数  
        相邻：
            x2 - d
            x2 + 1
    右下：x3 = 阶数的平方 - 1
        相邻：
            x3 - 1
            x3 - d
 2：边线索引规律（不包括边角） [y0]表示索引集合 [y0] + 1表示y0中每个索引都 + 1得到新索引
    top：    
        x0 < [y0] < x1
        相邻：
            [y0] + d
            y0 - 1 >= 0
            y0 + 1 <= x1
    left：
        [y1] = d的整数倍(0 < 倍数 < d) 例如四阶左边线索引[y1] = [4,8]
        相邻：
            [y1] + 1
            y2 - d >= 0
            y2 + d <= x2
    bottom：
        x2 < [y2] < x3
        相邻：
            [y2] - d
            y2 - 1 >= x2
            y2 + 1 <= x3
    right：
        [y3] = [y1] + (d - 1)
 3：其他 z
    相邻：
        z - d
        z - 1
        z + d
        z + 1
 
 */


NSArray *newBoxs(NSInteger index, NSArray *allBoxs) {
    
    NSMutableArray *handeled = [NSMutableArray arrayWithCapacity:0];
    NSArray *adjacents = adjacentBox(index, sqrt(allBoxs.count));
    [allBoxs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        BOOL status = [obj boolValue];
        if(index == idx || [adjacents containsObject:@(idx)]) {
            status = !status;
        }
        [handeled addObject:@(status)];
    }];
    return handeled;
}


/**
 获取相邻索引

 @param index 当前被点击索引
 @param degree 阶数
 @return 相邻索引
 */
NSArray *adjacentBox(NSInteger index, NSInteger degree) {
    
    // 先列出边角
    NSUInteger up_left = 0;
    NSUInteger up_right = degree - 1;
    NSUInteger left_lower = pow(degree, 2) - degree;
    NSUInteger right_lower = pow(degree, 2) - 1;
    // 是边角
    if(index == up_left) {
        // 左上
        return @[@(index + 1),@(index + degree)];
    }
    if(index == up_right) {
        // 右上
        return @[@(index - 1),@(index + degree)];
    }
    if(index == left_lower) {
        // 左下
        return @[@(index - degree),@(index + 1)];
    }
    if(index == right_lower) {
        // 右下
        return @[@(index - 1),@(index - degree)];
    }
    // 是边线
    if(index > up_left && index < up_right) {
        // 上边线
        return @[@(index + degree),@(index - 1),@(index + 1)];
    }
    NSMutableArray *left_lines = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *right_lines = [NSMutableArray arrayWithCapacity:0];
    for(NSUInteger i = degree; i < degree * (degree - 1); i ++) {
        if(i % degree == 0) {
            [left_lines addObject:@(i)];
            [right_lines addObject:@(i + degree - 1)];
        }
    }
    if([left_lines containsObject:@(index)]) {
        // 左边线
        return @[@(index + 1),@(index - degree),@(index + degree)];
    }
    if([right_lines containsObject:@(index)]) {
        // 右边线
        return @[@(index - 1),@(index - degree),@(index + degree)];
    }
    if(index > left_lower && index < right_lower) {
        // 下边线
        return @[@(index - degree),@(index - 1),@(index + 1)];
    }
    // 其他
    return @[@(index - degree),@(index - 1),@(index + degree),@(index + 1)];
}

@end




