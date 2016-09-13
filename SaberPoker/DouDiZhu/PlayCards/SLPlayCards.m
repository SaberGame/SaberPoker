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

#pragma mark -------------------- Configure Type --------------------

- (SLPlayCardsType)configureType {
    
    //单张
    if (self.cardsArray.count == 1) {
        return SLPlayCardsTypeSingle;
    }
    
    //对子
    if (self.cardsArray.count == 2) {
        SLCard *card1 = self.cardsArray.firstObject;
        SLCard *card2 = self.cardsArray.lastObject;
        if (card1.point == card2.point && card1.point) {
            return SLPlayCardsTypeDouble;
        }
    }
    
    //三张
    if (self.cardsArray.count == 3) {
        SLCard *card1 = self.cardsArray[0];
        SLCard *card2 = self.cardsArray[1];
        SLCard *card3 = self.cardsArray[2];
        if (card1.point == card2.point && card3.point == card2.point && card1.point == card3.point) {
            return SLPlayCardsTypeTripleWith0;
        }
    }
    
    //三带一
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
    
    //三带二
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
    
    //连对
    SLPlayCardsType ConsecutiveDoubleType = [self configureConsecutiveDoubleWithCardsArray:self.cardsArray];
    if (ConsecutiveDoubleType != SLPlayCardsTypeInvalid) {
        return ConsecutiveDoubleType;
    }
    
    //顺子
    SLPlayCardsType straightType = [self configureStraightWithCardsArray:self.cardsArray];
    if (straightType != SLPlayCardsTypeInvalid) {
        return straightType;
    }
    
    //炸弹
    if (self.cardsArray.count == 4) {
        int a = 0;
        SLCard *firstCard = self.cardsArray.firstObject;
        for (SLCard *card in self.cardsArray) {
            if (card.point == firstCard.point) {
                a++;
            }
        }
        if (a == 4) {
            return SLPlayCardsTypeBomb;
        }
    }
    
    //王炸
    if (self.cardsArray.count == 2) {
        SLCard *card1 = self.cardsArray.firstObject;
        SLCard *card2 = self.cardsArray.lastObject;
        if ((card1.point == 14 && card2.point == 15) || (card1.point == 15 && card2.point == 14)) {
            return SLPlayCardsTypeSuperBomb;
        }
    }
    
    //四带二
    if (self.cardsArray.count == 6) {
        
        SLCard *card1 = self.cardsArray[0];
        SLCard *card2 = self.cardsArray[1];
        SLCard *card3 = self.cardsArray[2];
        int a, b, c = 0;
        for (int i = 0; i < 4; i++) {
            SLCard *card = self.cardsArray[i];
            if (card.point == card1.point) {
                a++;
            }
        }
        
        for (int i = 1; i < 5; i++) {
            SLCard *card = self.cardsArray[i];
            if (card.point == card2.point) {
                b++;
            }
        }
        
        for (int i = 2; i < 6; i++) {
            SLCard *card = self.cardsArray[i];
            if (card.point == card3.point) {
                c++;
            }
        }
        
        if (a == 4 || b == 4 || c == 4  ) {
            return SLPlayCardsTypeFourWith2;
        }
    }
    
    //飞机
    
    
    return SLPlayCardsTypeInvalid;
}

#pragma mark -------------------- Configure Straight --------------------

- (SLPlayCardsType)configureStraightWithCardsArray:(NSArray *)arr {
    
    int a = 0;
    for (int i = 1; i < arr.count; i++) {
        SLCard *card1 = arr[i];
        SLCard *card2 = arr[i - 1];
        if (card1.level - card2.level == 1 && card1.level <= 13) {
            a++;
        } else {
            return SLPlayCardsTypeInvalid;
        }
    }
    
    if (a != arr.count - 1) {
        return SLPlayCardsTypeInvalid;
    } else {
        switch (a + 1) {
            case 5:
                return SLPlayCardsTypeStraightWith5;
                break;
                
            case 6:
                return SLPlayCardsTypeStraightWith6;
                break;
                
            case 7:
                return SLPlayCardsTypeStraightWith7;
                break;
                
            case 8:
                return SLPlayCardsTypeStraightWith8;
                break;
                
            case 9:
                return SLPlayCardsTypeStraightWith9;
                break;
                
            case 10:
                return SLPlayCardsTypeStraightWith10;
                break;
                
            case 11:
                return SLPlayCardsTypeStraightWith11;
                break;
                
            case 12:
                return SLPlayCardsTypeStraightWith12;
                break;
                
            default:
                return SLPlayCardsTypeInvalid;
                break;
        }
    }

}

#pragma mark -------------------- Configure ConsecutiveTriple --------------------

- (SLPlayCardsType)configureConsecutiveTripleWithCardsArray:(NSArray *)arr {
    
    
    
    
    return 0;
}

#pragma mark -------------------- Configure ConsecutiveDouble --------------------

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


#pragma mark -------------------- Compare --------------------

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
