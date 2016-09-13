//
//  SLMianViewController.m
//  SaberPoker
//
//  Created by songlong on 16/7/11.
//  Copyright © 2016年 SaberGame. All rights reserved.
//

#import "SLMianViewController.h"
#import "SLPool.h"
#import "SLPlayer.h"
#import "Masonry.h"
#import "UIImage+SLCategory.h"
#import "SLPlayCards.h"
#import "SLPlayView.h"

@interface SLMianViewController ()<SLPlayViewDelegate>

@property (nonatomic, strong) SLPool *pool;
@property (nonatomic, strong) SLPlayer *playerOne;
@property (nonatomic, strong) SLPlayer *playerTwo;
@property (nonatomic, strong) SLPlayer *playerThree;

@property (nonatomic, strong) SLPlayView *playerCardsView;

@property (nonatomic, strong) NSMutableArray *playCardsArray;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *helpButton;

@property (nonatomic, strong) SLPlayCards *playCards;

@end

@implementation SLMianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_normal"]];
    iconView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    [self.view addSubview:iconView];
    
    _playCardsArray = [NSMutableArray array];
    _playCards = [[SLPlayCards alloc] init];
    [self initGame];
}

- (void)initGame {
    _playerOne = [[SLPlayer alloc] init];
    _playerTwo = [[SLPlayer alloc] init];
    _playerThree = [[SLPlayer alloc] init];
    
    _pool = [[SLPool alloc] init];
    [_pool newCardPool];
    while (_pool.cardsArray.count >= 3) {
        [_playerOne drawCard:[_pool drawCard]];
        [_playerTwo drawCard:[_pool drawCard]];
        [_playerThree drawCard:[_pool drawCard]];
    }
    
    if (_pool.cardsArray.count == 2) {
        [_playerOne drawCard:[_pool drawCard]];
        [_playerTwo drawCard:[_pool drawCard]];
    } else if (_pool.cardsArray.count == 1) {
        [_playerOne drawCard:[_pool drawCard]];
    }
    
    [_playerOne logAllCardsInHand];
    [_playerTwo logAllCardsInHand];
    [_playerThree logAllCardsInHand];
    
    _playerCardsView = [[SLPlayView alloc] initWithFrame:CGRectZero];
    _playerCardsView.clipsToBounds = NO;
    _playerCardsView.backgroundColor = [UIColor clearColor];
    _playerCardsView.delegate = self;
    [_playerCardsView loadViewWithCards:_playerOne.cardsArray];
    [self.view addSubview:_playerCardsView];
    [_playerCardsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(0);
        make.height.equalTo(self.view.mas_height).multipliedBy(1 / 3.0);
    }];
    
    _playButton = [[UIButton alloc] initWithFrame:CGRectZero];
    _playButton.enabled = NO;
    [_playButton setTitle:@"Play" forState:UIControlStateNormal];
    [_playButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_playButton setBackgroundImage:[UIImage imageWithColor:[UIColor blueColor]] forState:UIControlStateNormal];
    [_playButton setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    [_playButton setBackgroundImage:[UIImage imageWithColor:[UIColor darkGrayColor]] forState:UIControlStateDisabled];
    [_playButton addTarget:self action:@selector(playCard) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_playButton];
    [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
        make.bottom.equalTo(_playerCardsView.mas_top).offset(-20);
    }];
    
}

- (void)clickCardAtIndex:(NSInteger)index button:(UIButton *)button {
    SLCard *card = _playerOne.cardsArray[index];
    card.isSelected = !card.isSelected;
    if (card.isSelected) {
        [self addCard:card];
        CGRect rect = button.frame;
        [UIView animateWithDuration:0.1 animations:^{
            button.frame = CGRectMake(rect.origin.x, rect.origin.y - [UIScreen mainScreen].bounds.size.width / 30, rect.size.width, rect.size.height);
        }];
    } else {
        [self removeCard:card];
        CGRect rect = button.frame;
        [UIView animateWithDuration:0.1 animations:^{
            button.frame = CGRectMake(rect.origin.x, rect.origin.y + [UIScreen mainScreen].bounds.size.width / 30, rect.size.width, rect.size.height);
        }];
    }
    
    _playButton.enabled = _playCardsArray.count != 0;
}


- (void)playCard {
    _playCards.cardsArray = _playCardsArray;
    SLPlayCardsType type = [_playCards configureType];
    
    if (type == SLPlayCardsTypeInvalid) {
        NSLog(@"不能这样出牌少年");
    } else {
        
        [_playerOne playCards:_playCardsArray];
        [self clearCard];
        [_playerCardsView loadViewWithCards:_playerOne.cardsArray];
        _playButton.enabled = NO;
    }
}

- (void)addCard:(SLCard *)card {
    if (_playCardsArray.count == 0) {
        [_playCardsArray addObject:card];
    } else {
        SLCard *firstCard = _playCardsArray.firstObject;
        SLCard *lastCard = _playCardsArray.lastObject;
        if (card.level <= firstCard.level) {
            [_playCardsArray insertObject:card atIndex:0];
        } else if (card.level >= lastCard.level) {
            [_playCardsArray addObject:card];
        } else {
            for (int i = 0; i < _playCardsArray.count; i++) {
                SLCard *leftCard = _playCardsArray[i];
                SLCard *rightCard = _playCardsArray[i + 1];
                if (card.level >= leftCard.level && card.level <= rightCard.level) {
                    [_playCardsArray insertObject:card atIndex:i+1];
                    return;
                }
            }
        }
    }
}

- (void)removeCard:(SLCard *)card {
    [_playCardsArray removeObject:card];
}

- (void)clearCard {
    [_playCardsArray removeAllObjects];
}


@end
