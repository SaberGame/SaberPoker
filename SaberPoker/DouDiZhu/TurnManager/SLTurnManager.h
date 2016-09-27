//
//  SLTurnManager.h
//  SaberPoker
//
//  Created by songlong on 16/9/14.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SLTurnType) {
    SLTurnTypePlayerOne,
    SLTurnTypePlayerTwo,
    SLTurnTypePlayerThree,
};

@interface SLTurnManager : NSObject

- (void)changeTurn;

@property (nonatomic, assign) SLTurnType currentTurn;
@property (nonatomic, assign) BOOL isFreeTurn;

@end
