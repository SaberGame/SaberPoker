//
//  SLPool.h
//  SaberPoker
//
//  Created by songlong on 16/9/9.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SLCard;

@interface SLPool : NSObject

@property (nonatomic, strong) NSMutableArray *cardsArray;

- (NSArray *)newCardPool;

- (SLCard *)drawCard;

@end
