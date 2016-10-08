//
//  SLPlayView.m
//  SaberPoker
//
//  Created by songlong on 16/9/13.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import "SLPlayView.h"
#import "SLCard.h"
#import "Masonry.h"

@implementation SLPlayView

- (void)loadViewWithCards:(NSArray *)arr; {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }

    for (int i = 0; i < arr.count; i++) {
        SLCard *card = arr[i];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
        button.layer.cornerRadius = 10;
        button.layer.borderWidth = 2;
        button.layer.borderColor = [UIColor blackColor].CGColor;
        button.clipsToBounds = YES;
        button.tag = i;
        button.backgroundColor = [UIColor whiteColor];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.top.mas_equalTo(0);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.height / 6);
            make.left.mas_equalTo(i * [UIScreen mainScreen].bounds.size.height / 12);
        }];
        
        NSString *type = nil;
        switch (card.cardType) {
            case SLCardTypeSpade:
                type = @"♠️";
                break;
                
            case SLCardTypeHeart:
                type = @"♥️";
                break;
                
            case SLCardTypeDiamond:
                type = @"♦️";
                break;
                
            case SLCardTypeClub:
                type = @"♣️";
                break;
                
            case SLCardTypeKing:
            {
                if (card.point == 14) {
                    type = @"小";
                } else {
                    type = @"大";
                }
            }
                break;
                
            default:
                break;
        }
        
        UILabel *typeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        typeLabel.text = type;
        [button addSubview:typeLabel];
        [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(5);
        }];
        
        NSString *point = nil;
        if (card.point <= 10) {
            point = [NSString stringWithFormat:@"%zd", card.point];
        } else {
            switch (card.point) {
                case 11:
                    point = @"J";
                    break;
                    
                case 12:
                    point = @"Q";
                    break;
                    
                case 13:
                    point = @"K";
                    break;
                    
                case 14:
                    point = @"王";
                    break;
                    
                case 15:
                    point = @"王";
                    break;
                    
                default:
                    break;
            }
        }
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.text = point;
        [button addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(typeLabel.mas_centerX);
            make.top.equalTo(typeLabel.mas_bottom).offset(2);
        }];
        
        
        switch (card.cardType) {
            case SLCardTypeSpade:
            {
                typeLabel.textColor = [UIColor blackColor];
                label.textColor = [UIColor blackColor];
            }
                break;
                
            case SLCardTypeHeart:
            {
                typeLabel.textColor = [UIColor redColor];
                label.textColor = [UIColor redColor];
            }
                break;
                
            case SLCardTypeDiamond:
            {
                typeLabel.textColor = [UIColor redColor];
                label.textColor = [UIColor redColor];
            }
                break;
                
            case SLCardTypeClub:
            {
                typeLabel.textColor = [UIColor blackColor];
                label.textColor = [UIColor blackColor];
            }
                break;
                
            case SLCardTypeKing:
            {
                if (card.point == 14) {
                    typeLabel.textColor = [UIColor blackColor];
                    label.textColor = [UIColor blackColor];
                } else {
                    typeLabel.textColor = [UIColor redColor];
                    label.textColor = [UIColor redColor];
                }
            }
                break;
                
            default:
                break;
        }

    }
}

- (void)clickButton:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(clickCardAtIndex:button:)]) {
        [self.delegate clickCardAtIndex:button.tag button:button];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    NSLog(@"%f   %f\n", point.x, point.y);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    NSLog(@"%f   %f\n", point.x, point.y);
}


@end
