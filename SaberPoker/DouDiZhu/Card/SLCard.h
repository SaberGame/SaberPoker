//
//  SLCard.h
//  SaberPoker
//
//  Created by songlong on 16/7/11.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SLCardType) {
    SLCardTypeSpade   = 0,     //黑桃
    SLCardTypeHeart   = 1,     //红桃
    SLCardTypeDiamond = 2,     //方片
    SLCardTypeClub    = 3,     //梅花
    SLCardTypeKing    = 4,     //王
    
};

@interface SLCard : NSObject

@property (nonatomic, assign) NSInteger point;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) SLCardType cardType;
@property (nonatomic, assign) BOOL isSelected;

+ (NSArray *)newCardDeck;
- (void)logCardInfo;

@end
