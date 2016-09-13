//
//  SLCardView.m
//  SaberPoker
//
//  Created by songlong on 16/7/11.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import "SLCardView.h"

@interface SLCardView()

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *pointLabel;

@end

@implementation SLCardView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _pointLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 5, frame.size.height / 5)];
        
    }
    return self;
}

- (void)setCard:(SLCard *)card {
    _card = card;
}

@end
