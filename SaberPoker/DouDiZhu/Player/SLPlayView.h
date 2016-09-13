//
//  SLPlayView.h
//  SaberPoker
//
//  Created by songlong on 16/9/13.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SLPlayViewDelegate <NSObject>

- (void)clickCardAtIndex:(NSInteger)index button:(UIButton *)button;

@end

@interface SLPlayView : UIView

@property (nonatomic, weak) id<SLPlayViewDelegate> delegate;

- (void)loadViewWithCards:(NSArray *)arr;


@end
