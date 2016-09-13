//
//  SLCard.m
//  SaberPoker
//
//  Created by songlong on 16/7/11.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import "SLCard.h"

@implementation SLCard

+ (NSArray *)newCardDeck {
    NSMutableArray *cardArray = [NSMutableArray array];
    for (int i = 0; i < 13; i++) {
        for (int j = 0; j < 4; j++) {
            SLCard *card = [[SLCard alloc] init];
            card.cardType = i;
            card.point = i + 1;
            [cardArray addObject:card];
        }
    }
    
    SLCard *blackJoker = [[SLCard alloc] init];
    blackJoker.point = 14;
    blackJoker.cardType = 4;
    [cardArray addObject:blackJoker];
    
    SLCard *redJoker = [[SLCard alloc] init];
    redJoker.point = 15;
    redJoker.cardType = 4;
    [cardArray addObject:redJoker];
    
    return nil;
}

- (void)setPoint:(NSInteger)point {
    _point = point;
    if (point >= 3 && point <= 13) {
        _level = point - 2;
    } else if (point == 1) {
        _level = 12;
    } else  if (point == 2) {
        _level = 13;
    } else {
        _level = point;
    }
}

- (id)copyWithZone:(NSZone *)zone {
    
    SLCard *card = [[SLCard alloc] init];
    card.point = self.point;
    card.cardType = self.cardType;
    return card;
}

- (void)logCardInfo {
    if (self.cardType < 4) {
        NSString *cardType;
        switch (self.cardType ) {
            case 0:
                cardType = @"♠️";
                break;
                
            case 1:
                cardType = @"♥️";
                break;
                
            case 2:
                cardType = @"♦️";
                break;
                
            case 3:
                cardType = @"♣️";
                break;
                
            default:
                break;
        }
        
        if (self.point <= 10) {
            NSLog(@"该牌是： %@  %zd", cardType, self.point);
        } else {
            NSString *name;
            switch (self.point) {
                case 11:
                    name = @"J";
                    break;
                    
                case 12:
                    name = @"Q";
                    break;
                    
                case 13:
                    name = @"K";
                    break;
                    
                default:
                    break;
            }
            NSLog(@"该牌是： %@  %@", cardType, name);
        }
    } else {
        NSString *name;
        switch (self.point) {
            case 14:
                name = @"小王";
                break;
                
            case 15:
                name = @"大王";
                break;
        
                
            default:
                break;
        }
        NSLog(@"该牌是： %@", name);
    }
}

@end
