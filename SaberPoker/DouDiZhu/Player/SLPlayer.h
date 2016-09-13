//
//  SLPlayer.h
//  SaberPoker
//
//  Created by songlong on 16/9/9.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLCard.h"

@interface SLPlayer : NSObject

@property (nonatomic, strong) NSMutableArray *cardsArray;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) BOOL isLord;

- (void)drawCard:(SLCard *)card;
- (void)playCards:(NSArray *)arr;
- (void)logAllCardsInHand;

@end
