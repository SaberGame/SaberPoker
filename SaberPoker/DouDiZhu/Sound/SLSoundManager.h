//
//  SLSoundManager.h
//  SaberPoker
//
//  Created by songlong on 2016/9/27.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLPlayCards.h"

#define kMale_Sound @"Man"
#define kFemale_Sound @"Woman"

@interface SLSoundManager : NSObject

- (void)playSoundWithCardsDetail:(SLCardsDetail)detail;

@end
