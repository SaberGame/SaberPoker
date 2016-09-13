//
//  SLPlayer.m
//  SaberPoker
//
//  Created by songlong on 16/9/9.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import "SLPlayer.h"
@class SLCard;

@implementation SLPlayer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.cardsArray = [NSMutableArray array];
    }
    return self;
}

- (void)drawCard:(SLCard *)card {
    
    if (self.cardsArray.count == 0) {
        [self.cardsArray addObject:card];
    } else {
        SLCard *firstCard = self.cardsArray.firstObject;
        SLCard *lastCard = self.cardsArray.lastObject;
        if (card.level >= firstCard.level) {
            [self.cardsArray insertObject:card atIndex:0];
        } else if (card.level <= lastCard.level) {
            [self.cardsArray addObject:card];
        } else {
            for (int i = 0; i < self.cardsArray.count; i++) {
                SLCard *leftCard = self.cardsArray[i];
                SLCard *rightCard = self.cardsArray[i + 1];
                if (card.level <= leftCard.level && card.level >= rightCard.level) {
                    [self.cardsArray insertObject:card atIndex:i+1];
                    return;
                }
            }
        }
    }

}

- (NSArray *)playCards {
    
    return nil;
}

- (void)logAllCardsInHand {
    for (SLCard *card in _cardsArray) {
        [card logCardInfo];
    }
    NSLog(@"共%zd张牌", _cardsArray.count);
}


@end
