//
//  SLAIPlay.h
//  SaberPoker
//
//  Created by songlong on 16/9/14.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLAIPlay : NSObject

+ (NSArray *)aiPlayWithCurrentCards:(NSArray *)currentCards cardsInHand:(NSArray *)handCards playerOnePlayedCards:(NSArray *)playerOnePlayedCards playerTwoPlayedCards:(NSArray *)playerTwoPlayedCards selfPlayedCards:(NSArray *)selfPlayedCards isLord:(BOOL)isLord isNextPlayerLord:(BOOL)isNextPlayerLord;

@end
