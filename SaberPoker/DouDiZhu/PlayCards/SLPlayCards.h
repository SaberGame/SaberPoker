//
//  SLPlayCards.h
//  SaberPoker
//
//  Created by songlong on 16/9/12.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SLPlayCardsType) {
    SLPlayCardsTypeSingle,
    SLPlayCardsTypeDouble,
    SLPlayCardsTypeTripleWith0,
    SLPlayCardsTypeTripleWith1,
    SLPlayCardsTypeTripleWith2,
    SLPlayCardsTypeConsecutiveDouble3,
    SLPlayCardsTypeConsecutiveDouble4,
    SLPlayCardsTypeConsecutiveDouble5,
    SLPlayCardsTypeConsecutiveDouble6,
    SLPlayCardsTypeConsecutiveDouble7,
    SLPlayCardsTypeConsecutiveDouble8,
    SLPlayCardsTypeConsecutiveDouble9,
    SLPlayCardsTypeConsecutiveDouble10,
    SLPlayCardsTypeConsecutiveTripleWith0_2,
    SLPlayCardsTypeConsecutiveTripleWith0_3,
    SLPlayCardsTypeConsecutiveTripleWith0_4,
    SLPlayCardsTypeConsecutiveTripleWith0_5,
    SLPlayCardsTypeConsecutiveTripleWith0_6,
    SLPlayCardsTypeConsecutiveTripleWith1_2,
    SLPlayCardsTypeConsecutiveTripleWith1_3,
    SLPlayCardsTypeConsecutiveTripleWith1_4,
    SLPlayCardsTypeConsecutiveTripleWith1_5,
    SLPlayCardsTypeConsecutiveTripleWith2_2,
    SLPlayCardsTypeConsecutiveTripleWith2_3,
    SLPlayCardsTypeConsecutiveTripleWith2_4,
    SLPlayCardsTypeStraightWith5,
    SLPlayCardsTypeStraightWith6,
    SLPlayCardsTypeStraightWith7,
    SLPlayCardsTypeStraightWith8,
    SLPlayCardsTypeStraightWith9,
    SLPlayCardsTypeStraightWith10,
    SLPlayCardsTypeStraightWith11,
    SLPlayCardsTypeStraightWith12,
    SLPlayCardsTypeFourWithTwoSingle,
    SLPlayCardsTypeFourWithDouble,
    SLPlayCardsTypeBomb,
    SLPlayCardsTypeSuperBomb,
    SLPlayCardsTypeInvalid
};

@interface SLPlayCards : NSObject

@property (nonatomic, strong) NSArray *cardsArray;
- (SLPlayCardsType)configureType;
- (BOOL)beatTargetPlaysCards:(SLPlayCards *)other;

@end
