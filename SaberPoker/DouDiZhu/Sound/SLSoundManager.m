//
//  SLSoundManager.m
//  SaberPoker
//
//  Created by songlong on 2016/9/27.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import "SLSoundManager.h"
#import <AVFoundation/AVFoundation.h>

@interface SLSoundManager()

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation SLSoundManager


- (void)playSoundWithCardsDetail:(SLCardsDetail)detail {
    
    NSString *currentSex = [SLSoundManager currentSex];
    
    if (detail <= 15) {
        NSInteger count = (NSInteger)detail;
        [self playSoundWithName:[NSString stringWithFormat:@"%@_%zd", currentSex, count]];
    }
    
    if (detail >= 101 && detail <= 113) {
        NSInteger count = (NSInteger)detail;
        [self playSoundWithName:[NSString stringWithFormat:@"%@_dui%zd", currentSex, count - 100]];
    }
    
    if (detail >= 201 && detail <= 213) {
        NSInteger count = (NSInteger)detail;
        [self playSoundWithName:[NSString stringWithFormat:@"%@_tuple%zd", currentSex, count - 200]];
    }
    
    if (detail == SLCardsDetail_sandai1) {
        [self playSoundWithName:[NSString stringWithFormat:@"%@_sandaiyi", currentSex]];
    }
    
    if (detail == SLCardsDetail_sandai2) {
        [self playSoundWithName:[NSString stringWithFormat:@"%@_sandaiyidui", currentSex]];
    }
    
    if (detail == SLCardsDetail_liandui) {
        [self playSoundWithName:[NSString stringWithFormat:@"%@_liandui", currentSex]];
    }
    
    if (detail == SLCardsDetail_feiji) {
        [self playSoundWithName:[NSString stringWithFormat:@"%@_feiji", currentSex]];
    }
    
    if (detail == SLCardsDetail_shunzi) {
        [self playSoundWithName:[NSString stringWithFormat:@"%@_shunzi", currentSex]];
    }
    
    if (detail == SLCardsDetail_zhadan) {
        [self playSoundWithName:[NSString stringWithFormat:@"%@_zhadan", currentSex]];
    }
    
    if (detail == SLCardsDetail_wangzha) {
        [self playSoundWithName:[NSString stringWithFormat:@"%@_wangzha", currentSex]];
    }
    
    if (detail == SLCardsDetail_sidai2) {
        [self playSoundWithName:[NSString stringWithFormat:@"%@_sidaier", currentSex]];
    }
    
    if (detail == SLCardsDetail_sidailiangdui) {
        [self playSoundWithName:[NSString stringWithFormat:@"%@_sidailiangdui", currentSex]];
    }
}

- (void)playSoundWithName:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"mp3"];
     self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
    [self.audioPlayer play];
}

+ (NSString *)currentSex {
    return kFemale_Sound;
}


@end
