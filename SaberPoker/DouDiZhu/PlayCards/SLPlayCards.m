//
//  SLPlayCards.m
//  SaberPoker
//
//  Created by songlong on 16/9/12.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import "SLPlayCards.h"
#import "SLCard.h"

@implementation SLPlayCards

- (SLPlayCardsType)configureType {
    
    if (self.cardsArray.count == 1) {
        return SLPlayCardsTypeSingle;
    }
    
    if (self.cardsArray.count == 2) {
        SLCard *card1 = self.cardsArray.firstObject;
        SLCard *card2 = self.cardsArray.lastObject;
        if (card1.point == card2.point && card1.point) {
            return SLPlayCardsTypeDouble;
        }
    }
    
    if (self.cardsArray.count == 3) {
        SLCard *card1 = self.cardsArray[0];
        SLCard *card2 = self.cardsArray[1];
        SLCard *card3 = self.cardsArray[2];
        if (card1.point == card2.point && card3.point == card2.point && card1.point == card3.point) {
            return SLPlayCardsTypeTripleWith0;
        }
    }
    
    if (self.cardsArray.count == 4) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        for (SLCard *card in self.cardsArray) {
            if ([dic objectForKey:[NSString stringWithFormat:@"%zd", card.point]]) {
                NSNumber *num = [dic objectForKey:[NSString stringWithFormat:@"%zd", card.point]];
                [dic setObject:@(num.integerValue + 1) forKey:[NSString stringWithFormat:@"%zd", card.point]];
            } else {
                [dic setObject:@1 forKey:[NSString stringWithFormat:@"%zd", card.point]];
            }
        }
        
        if ([dic allKeys].count == 2) {
            NSNumber *num = [dic objectForKey:[dic allKeys].firstObject];
            if (num.integerValue == 1 || num.integerValue == 3) {
                return SLPlayCardsTypeTripleWith1;
            }
        }
    }
    
    if (self.cardsArray.count == 5) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        for (SLCard *card in self.cardsArray) {
            if ([dic objectForKey:[NSString stringWithFormat:@"%zd", card.point]]) {
                NSNumber *num = [dic objectForKey:[NSString stringWithFormat:@"%zd", card.point]];
                [dic setObject:@(num.integerValue + 1) forKey:[NSString stringWithFormat:@"%zd", card.point]];
            } else {
                [dic setObject:@1 forKey:[NSString stringWithFormat:@"%zd", card.point]];
            }
        }
        
        if ([dic allKeys].count == 2) {
            NSNumber *num = [dic objectForKey:[dic allKeys].firstObject];
            if (num.integerValue == 2 || num.integerValue == 3) {
                return SLPlayCardsTypeTripleWith2;
            }
        }
    }
    
    SLPlayCardsType ConsecutiveDoubleType = [self configureConsecutiveDoubleWithCardsArray:self.cardsArray];
    if (ConsecutiveDoubleType != SLPlayCardsTypeInvalid) {
        return ConsecutiveDoubleType;
    }
    
    return SLPlayCardsTypeInvalid;
}

- (SLPlayCardsType)configureConsecutiveDoubleWithCardsArray:(NSArray *)arr {
    if (self.cardsArray.count == 6) {
        NSArray *abArr = [self abResultWithArray:arr];
        NSNumber *a = abArr[0];
        NSNumber *b = abArr[1];
        if (a.integerValue == 3 && b.integerValue == 2) {
            return SLPlayCardsTypeConsecutiveDouble3;
        }
    }
    
    if (self.cardsArray.count == 8) {
        NSArray *abArr = [self abResultWithArray:arr];
        NSNumber *a = abArr[0];
        NSNumber *b = abArr[1];
        if (a.integerValue == 4 && b.integerValue == 3) {
            return SLPlayCardsTypeConsecutiveDouble4;
        }
    }
    
    if (self.cardsArray.count == 10) {
        NSArray *abArr = [self abResultWithArray:arr];
        NSNumber *a = abArr[0];
        NSNumber *b = abArr[1];
        if (a.integerValue == 5 && b.integerValue == 4) {
            return SLPlayCardsTypeConsecutiveDouble5;
        }
    }
    
    if (self.cardsArray.count == 12) {
        NSArray *abArr = [self abResultWithArray:arr];
        NSNumber *a = abArr[0];
        NSNumber *b = abArr[1];
        if (a.integerValue == 6 && b.integerValue == 5) {
            return SLPlayCardsTypeConsecutiveDouble6;
        }
    }
    
    if (self.cardsArray.count == 14) {
        NSArray *abArr = [self abResultWithArray:arr];
        NSNumber *a = abArr[0];
        NSNumber *b = abArr[1];
        if (a.integerValue == 7 && b.integerValue == 6) {
            return SLPlayCardsTypeConsecutiveDouble7;
        }
    }
    
    if (self.cardsArray.count == 16) {
        NSArray *abArr = [self abResultWithArray:arr];
        NSNumber *a = abArr[0];
        NSNumber *b = abArr[1];
        if (a.integerValue == 8 && b.integerValue == 7) {
            return SLPlayCardsTypeConsecutiveDouble8;
        }
    }
    
    if (self.cardsArray.count == 18) {
        NSArray *abArr = [self abResultWithArray:arr];
        NSNumber *a = abArr[0];
        NSNumber *b = abArr[1];
        if (a.integerValue == 9 && b.integerValue == 8) {
            return SLPlayCardsTypeConsecutiveDouble9;
        }
    }
    
    if (self.cardsArray.count == 20) {
        NSArray *abArr = [self abResultWithArray:arr];
        NSNumber *a = abArr[0];
        NSNumber *b = abArr[1];
        if (a.integerValue == 10 && b.integerValue == 9) {
            return SLPlayCardsTypeConsecutiveDouble10;
        }
    }
    
    return SLPlayCardsTypeInvalid;
}

- (NSArray *)abResultWithArray:(NSArray *)arr {
    
    int a, b = 0;
    for (int i = 0; i < arr.count; i+=2) {
        SLCard *card1 = arr[i];
        SLCard *card2 = arr[i + 1];
        if (card1.level == card2.level && card2.level <= 12) {
            a++;
        }
    }
    
    if (a == arr.count / 2) {
        for (int i = 2; i < arr.count; i+=2) {
            SLCard *card1 = arr[i];
            SLCard *card2 = arr[i - 1];
            if (card1.level - card2.level == 1) {
                b++;
            }
        }
    }
    
    return @[@(a), @(b)];
}




- (BOOL)beatTargetPlaysCards:(SLPlayCards *)other {
    if ([self configureType] != [other configureType]) {
        return NO;
    } else {
        if ([self configureType] == SLPlayCardsTypeSingle) {
            
        }
    }
    return YES;
}

@end
