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

@interface SLMianViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) SLPool *pool;
@property (nonatomic, strong) SLPlayer *playerOne;
@property (nonatomic, strong) SLPlayer *playerTwo;
@property (nonatomic, strong) SLPlayer *playerThree;

@property (nonatomic, strong) UICollectionView *playerCardsView;

@property (nonatomic, strong) NSMutableArray *playCardsArray;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *helpButton;

@property (nonatomic, strong) SLPlayCards *playCards;

@end

@implementation SLMianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
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
    
    //test
    [_playerOne.cardsArray removeAllObjects];
    for (int i = 0; i < 3; i++) {
        SLCard *card1 = [[SLCard alloc] init];
        card1.point = 1;
        [_playerOne.cardsArray addObject:card1];
        
        SLCard *card2 = [[SLCard alloc] init];
        card2.point = 13;
        [_playerOne.cardsArray addObject:card2];
        
        SLCard *card3 = [[SLCard alloc] init];
        card3.point = 12;
        [_playerOne.cardsArray addObject:card3];
        
        SLCard *card4 = [[SLCard alloc] init];
        card4.point = 11;
        [_playerOne.cardsArray addObject:card4];
        
        SLCard *card5 = [[SLCard alloc] init];
        card5.point = 10;
        [_playerOne.cardsArray addObject:card5];
        
        SLCard *card6 = [[SLCard alloc] init];
        card6.point = 9;
        [_playerOne.cardsArray addObject:card6];
        
        SLCard *card7 = [[SLCard alloc] init];
        card7.point = 9;
        [_playerOne.cardsArray addObject:card7];
    }
    
    [_playerOne logAllCardsInHand];
    [_playerTwo logAllCardsInHand];
    [_playerThree logAllCardsInHand];
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 6, [UIScreen mainScreen].bounds.size.width / 3);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = -[UIScreen mainScreen].bounds.size.width / 12;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _playerCardsView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.width * 2.0 / 3, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width / 3.0) collectionViewLayout:layout];
    _playerCardsView.clipsToBounds = NO;
    _playerCardsView.backgroundColor = [UIColor orangeColor];
    _playerCardsView.showsHorizontalScrollIndicator = NO;
    _playerCardsView.delegate = self;
    _playerCardsView.dataSource = self;
    [_playerCardsView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"123"];
    [self.view addSubview:_playerCardsView];
    
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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _playerOne.cardsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"123" forIndexPath:indexPath];
    
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    cell.layer.cornerRadius = 10;
    cell.layer.borderWidth = 2;
    cell.layer.borderColor = [UIColor blackColor].CGColor;
    cell.clipsToBounds = YES;
    
    cell.contentView.backgroundColor = [UIColor greenColor];
    SLCard *card = _playerOne.cardsArray[indexPath.item];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 30, 15)];
    label.textColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"%zd", card.point];
    [cell.contentView addSubview:label];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    SLCard *card = _playerOne.cardsArray[indexPath.item];
    card.isSelected = !card.isSelected;
    if (card.isSelected) {
        [self addCard:card];
        CGRect rect = cell.frame;
        [UIView animateWithDuration:0.1 animations:^{
            cell.frame = CGRectMake(rect.origin.x, rect.origin.y - [UIScreen mainScreen].bounds.size.width / 30, rect.size.width, rect.size.height);
        }];
    } else {
        [self removeCard:card];
        CGRect rect = cell.frame;
        [UIView animateWithDuration:0.1 animations:^{
            cell.frame = CGRectMake(rect.origin.x, rect.origin.y + [UIScreen mainScreen].bounds.size.width / 30, rect.size.width, rect.size.height);
        }];
    }
    
    _playButton.enabled = _playCardsArray.count != 0;
}

- (void)playCard {
    _playCards.cardsArray = _playCardsArray;
    SLPlayCardsType type = [_playCards configureType];
    [self clearCard];
    _playButton.enabled = NO;
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
