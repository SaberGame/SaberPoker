//
//  SLScoreSelectView.h
//  SaberPoker
//
//  Created by songlong on 16/9/14.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLScoreSelectView : UIView

@property (nonatomic, copy) void(^scoreSelectBlock)(NSInteger);

@end
