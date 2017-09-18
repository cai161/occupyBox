//
//  OBRuleController.m
//  occupyBox
//
//  Created by biqinglin on 2017/4/21.
//  Copyright © 2017年 biqinglin. All rights reserved.
//

#import "OBRuleController.h"
#import "Masonry.h"

@interface OBRuleController ()

@end

@implementation OBRuleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *ruleString = @"1. 每个方块都有两个状态，即free状态（白色方块）以及occupied状态（颜色方块）。\n2. 初始状态都为free状态，当方块被点击，那么该方块的当前状态会变为对立状态，即：变色。\n3. 同时该方块相邻（不包含对角线相邻的方块）的方块状态也会变化，当所有的方块都变为occupied状态时游戏结束。\n4. 尽量去挑战更多阶数的游戏难度吧~";
    UILabel *rule = [[UILabel alloc] init];
    rule.font = [UIFont systemFontOfSize:16];
    rule.textColor = RGB(102, 102, 102);
    rule.numberOfLines = 0;
    [self.view addSubview:rule];
    [rule mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(15.f);
        make.right.mas_equalTo(-15.f);
        make.top.mas_equalTo(80.f);
    }];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:ruleString];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 8.f;
    paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [ruleString length])];
    rule.attributedText = attributedString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
