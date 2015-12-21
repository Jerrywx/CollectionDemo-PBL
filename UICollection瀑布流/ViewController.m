//
//  ViewController.m
//  UICollection瀑布流
//
//  Created by wxiao on 15/12/20.
//  Copyright © 2015年 wxiao. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "WJY_WaterFallLayout.h"
#import "JRLayout.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, JRLayoutDelegate>
@property (nonatomic, strong) UICollectionView		*collectionView;
@property (nonatomic, strong) JRLayout				*layout;
@property (nonatomic, strong) WJY_WaterFallLayout	*layout2;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self setUpView];
}

- (void)setUpView {
	self.view.backgroundColor = [UIColor whiteColor];
	
	// layout
	_layout = [[JRLayout alloc] init];
	_layout.lineCount = 2;
	_layout.horizontalSpacing = 10;
	_layout.verticalSpacing = 10;
	_layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
	
	_layout2						= [[WJY_WaterFallLayout alloc]init];
	_layout2.lineCount				= 2;
	_layout2.verticalSpacing		= 10;
	_layout2.horizontalSpacing		= 10;
	_layout2.sectionInset			= UIEdgeInsetsMake(30, 10, 10, 10);
	
	// collection
	_collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
										 collectionViewLayout:_layout];
	_collectionView.dataSource = self;
	_collectionView.delegate = self;
	_collectionView.backgroundColor = [UIColor whiteColor];
	[_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
	[self.view addSubview:_collectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 22;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
	
	cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0)
										   green:((float)arc4random_uniform(256) / 255.0)
											blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
	return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"==================== %zd", indexPath.row);
}

#pragma mark - 
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	return arc4random()%200 + 150;
}

// 随机返回高度
-(CGSize)collectionView:(UICollectionView *)collectionView
				 layout:(UICollectionViewLayout *)collectionViewLayout
 sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	return CGSizeMake((375 - 30) / 2, arc4random()%200 + 150);
}


@end










