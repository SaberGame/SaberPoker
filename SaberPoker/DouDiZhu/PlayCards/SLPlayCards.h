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
    SLPlayCardsTypeConsecutiveDouble3 = 10,          //三连对
    SLPlayCardsTypeConsecutiveDouble4,          //四连对
    SLPlayCardsTypeConsecutiveDouble5,          //五连对
    SLPlayCardsTypeConsecutiveDouble6,          //六连对
    SLPlayCardsTypeConsecutiveDouble7,          //七连对
    SLPlayCardsTypeConsecutiveDouble8,          //八连对
    SLPlayCardsTypeConsecutiveDouble9,          //九连对
    SLPlayCardsTypeConsecutiveDouble10,         //十连对
    SLPlayCardsTypeConsecutiveTripleWith0_2 = 100,    //飞机（2连）
    SLPlayCardsTypeConsecutiveTripleWith0_3,    //飞机（3连）
    SLPlayCardsTypeConsecutiveTripleWith0_4,    //飞机（4连）
    SLPlayCardsTypeConsecutiveTripleWith0_5,    //飞机（5连）
    SLPlayCardsTypeConsecutiveTripleWith0_6,    //飞机（6连）
    SLPlayCardsTypeConsecutiveTripleWith1_2,    //三带一飞机（2连）
    SLPlayCardsTypeConsecutiveTripleWith1_3,    //三带一飞机（3连）
    SLPlayCardsTypeConsecutiveTripleWith1_4,    //三带一飞机（4连）
    SLPlayCardsTypeConsecutiveTripleWith1_5,    //三带一飞机（5连）
    SLPlayCardsTypeConsecutiveTripleWith2_2,    //三带对飞机（2连）
    SLPlayCardsTypeConsecutiveTripleWith2_3,    //三带对飞机（3连）
    SLPlayCardsTypeConsecutiveTripleWith2_4,    //三带对飞机（4连）
    SLPlayCardsTypeStraightWith5 = 200,               //顺子（5张）
    SLPlayCardsTypeStraightWith6,               //顺子（6张）
    SLPlayCardsTypeStraightWith7,               //顺子（7张）
    SLPlayCardsTypeStraightWith8,               //顺子（8张）
    SLPlayCardsTypeStraightWith9,               //顺子（9张）
    SLPlayCardsTypeStraightWith10,              //顺子（10张）
    SLPlayCardsTypeStraightWith11,              //顺子（11张）
    SLPlayCardsTypeStraightWith12,              //顺子（12张）
    SLPlayCardsTypeFourWith2 = 300,                   //四带二
    SLPlayCardsTypeFourWith2Double,             //四带两对
    SLPlayCardsTypeBomb,                        //炸弹
    SLPlayCardsTypeSuperBomb,                   //王炸
    SLPlayCardsTypeInvalid                      //无效
};

typedef NS_ENUM(NSInteger, SLCardsDetail) {
    SLCardsDetail_1 = 1,
    SLCardsDetail_2,
    SLCardsDetail_3,
    SLCardsDetail_4,
    SLCardsDetail_5,
    SLCardsDetail_6,
    SLCardsDetail_7,
    SLCardsDetail_8,
    SLCardsDetail_9,
    SLCardsDetail_10,
    SLCardsDetail_11,
    SLCardsDetail_12,
    SLCardsDetail_13,
    SLCardsDetail_14,
    SLCardsDetail_15,
    
    SLCardsDetail_double_1 = 101,
    SLCardsDetail_double_2,
    SLCardsDetail_double_3,
    SLCardsDetail_double_4,
    SLCardsDetail_double_5,
    SLCardsDetail_double_6,
    SLCardsDetail_double_7,
    SLCardsDetail_double_8,
    SLCardsDetail_double_9,
    SLCardsDetail_double_10,
    SLCardsDetail_double_11,
    SLCardsDetail_double_12,
    SLCardsDetail_double_13,
    
    SLCardsDetail_Triple_1 = 201,
    SLCardsDetail_Triple_2,
    SLCardsDetail_Triple_3,
    SLCardsDetail_Triple_4,
    SLCardsDetail_Triple_5,
    SLCardsDetail_Triple_6,
    SLCardsDetail_Triple_7,
    SLCardsDetail_Triple_8,
    SLCardsDetail_Triple_9,
    SLCardsDetail_Triple_10,
    SLCardsDetail_Triple_11,
    SLCardsDetail_Triple_12,
    SLCardsDetail_Triple_13,
    
    SLCardsDetail_feiji,
    SLCardsDetail_shunzi,
    SLCardsDetail_liandui,
    SLCardsDetail_sandai1,
    SLCardsDetail_sandai2,
    SLCardsDetail_zhadan,
    SLCardsDetail_wangzha,
    SLCardsDetail_sidai2,
    SLCardsDetail_sidailiangdui,
    
    
    SLCardsDetail_None
};


@interface SLPlayCards : NSObject

@property (nonatomic, strong) NSArray *cardsArray;

@property (nonatomic, assign) SLPlayCardsType cardsType;

- (SLPlayCardsType)configureType;
- (SLCardsDetail)configureDetil;
- (BOOL)beatTargetPlaysCards:(SLPlayCards *)other;

@end
