//
//  SLScoreSelectView.m
//  SaberPoker
//
//  Created by songlong on 16/9/14.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import "SLScoreSelectView.h"
#define margin 10

@implementation SLScoreSelectView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        CGFloat width = (frame.size.width - 3 * margin) / 4;
        CGFloat height = frame.size.height;
        
        
        for (int i = 0; i < 4; i++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * (width + margin), 0, width, height)];
            button.backgroundColor = [UIColor blueColor];
            if (i <= 2) {
                [button setTitle:[NSString stringWithFormat:@"%zd分", i +1] forState:0];
            } else {
                [button setTitle:[NSString stringWithFormat:@"不叫"] forState:0];
            }
            [button setTitleColor:[UIColor whiteColor] forState:0];
            button.layer.cornerRadius = 10;
            button.clipsToBounds = YES;
            button.tag = i;
            [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
        }
    }
    return self;
}

- (void)clickButton:(UIButton *)button {
    if (self.scoreSelectBlock) {
        self.scoreSelectBlock(button.tag);
        [self removeFromSuperview];
    }
}

@end
