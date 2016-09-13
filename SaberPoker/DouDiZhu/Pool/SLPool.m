//
//  SLPool.m
//  SaberPoker
//
//  Created by songlong on 16/9/9.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import "SLPool.h"
#import "SLCard.h"

@implementation SLPool

- (SLCard *)drawCard {
    
    if (_cardsArray.count == 0) {
        NSLog(@"抓完喽~~");
        return nil;
    }
    
    NSInteger count = arc4random() % _cardsArray.count;
    SLCard *card = _cardsArray[count];
    [card logCardInfo];
    SLCard *drawCard = card.copy;
    [_cardsArray removeObject:card];
    NSLog(@"还剩%zd张牌", _cardsArray.count);
    return drawCard;
}

- (NSArray *)newCardPool {
    NSMutableArray *cardArray = [NSMutableArray array];
    for (int i = 0; i < 13; i++) {
        for (int j = 0; j < 4; j++) {
            SLCard *card = [[SLCard alloc] init];
            card.cardType = j;
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
    
    self.cardsArray = cardArray;
    
    return nil;
}

@end
