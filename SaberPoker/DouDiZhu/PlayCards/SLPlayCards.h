//
//  SLPlayCards.h
//  SaberPoker
//
//  Created by songlong on 16/9/12.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SLPlayCardsType) {
    SLPlayCardsTypeSingle,                      //单张
    SLPlayCardsTypeDouble,                      //对子
    SLPlayCardsTypeTripleWith0,                 //三张
    SLPlayCardsTypeTripleWith1,                 //三带一
    SLPlayCardsTypeTripleWith2,                 //三带对
    SLPlayCardsTypeConsecutiveDouble3,          //三连对
    SLPlayCardsTypeConsecutiveDouble4,          //四连对
    SLPlayCardsTypeConsecutiveDouble5,          //五连对
    SLPlayCardsTypeConsecutiveDouble6,          //六连对
    SLPlayCardsTypeConsecutiveDouble7,          //七连对
    SLPlayCardsTypeConsecutiveDouble8,          //八连对
    SLPlayCardsTypeConsecutiveDouble9,          //九连对
    SLPlayCardsTypeConsecutiveDouble10,         //十连对
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
    SLPlayCardsTypeStraightWith5,               //顺子（5张）
    SLPlayCardsTypeStraightWith6,               //顺子（6张）
    SLPlayCardsTypeStraightWith7,               //顺子（7张）
    SLPlayCardsTypeStraightWith8,               //顺子（8张）
    SLPlayCardsTypeStraightWith9,               //顺子（9张）
    SLPlayCardsTypeStraightWith10,              //顺子（10张）
    SLPlayCardsTypeStraightWith11,              //顺子（11张）
    SLPlayCardsTypeStraightWith12,              //顺子（12张）
    SLPlayCardsTypeFourWith2,                   //四带二
    SLPlayCardsTypeBomb,                        //炸弹
    SLPlayCardsTypeSuperBomb,                   //王炸
    SLPlayCardsTypeInvalid                      //无效
};

@interface SLPlayCards : NSObject

@property (nonatomic, strong) NSArray *cardsArray;
- (SLPlayCardsType)configureType;
- (BOOL)beatTargetPlaysCards:(SLPlayCards *)other;

@end
