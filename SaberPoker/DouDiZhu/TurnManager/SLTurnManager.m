
//
//  SLTurnManager.m
//  SaberPoker
//
//  Created by songlong on 16/9/14.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import "SLTurnManager.h"

@implementation SLTurnManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _isFreeTurn = YES;
        _currentTurn = SLTurnTypePlayerOne;
    }
    return self;
}

- (void)changeTurn {
    switch (_currentTurn) {
        case SLTurnTypePlayerOne:
            _currentTurn = SLTurnTypePlayerTwo;
            break;
            
        case SLTurnTypePlayerTwo:
            _currentTurn = SLTurnTypePlayerThree;
            break;
            
        case SLTurnTypePlayerThree:
            _currentTurn = SLTurnTypePlayerOne;
            break;
            
        default:
            break;
    }
}

@end
