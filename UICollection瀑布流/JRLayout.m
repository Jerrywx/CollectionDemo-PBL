//
//  JRLayout.m
//  UICollection瀑布流
//
//  Created by wxiao on 15/12/21.
//  Copyright © 2015年 wxiao. All rights reserved.
//

#import "JRLayout.h"

@interface JRLayout ()
@property (nonatomic, assign) CGFloat				itemWidth;		// Item Width (所有 Item 宽度一致)
@property (nonatomic, strong) NSMutableArray			*itemXs;		// Item X (每行的 Item X 一致)
@property (nonatomic, strong) NSMutableArray			*itemYs;		// Item Y (每个 Item Y 都不同)
@property (nonatomic, strong) NSMutableArray			*itemHs;		// Item Height (每个Item H 都不相同)
@property (nonatomic, strong) NSMutableArray			*itemFrames;		// Item Frame
@property (nonatomic, assign) CGFloat				collectionH;		// 高度

@property (nonatomic, strong) NSMutableArray			*lowerH;		//
@end

@implementation JRLayout

#pragma mark - 刷新 collecyionView 时首先调用  Num1.

- (void)prepareLayout {

	NSInteger itemsNum = [self.collectionView numberOfItemsInSection:0];
	
	_itemXs = [[NSMutableArray alloc] initWithCapacity:_lineCount];
	_itemHs = [[NSMutableArray alloc] initWithCapacity:itemsNum];
	_itemYs = [[NSMutableArray alloc] initWithCapacity:itemsNum];
	_itemFrames = [[NSMutableArray alloc] initWithCapacity:itemsNum];
	_lowerH = [[NSMutableArray alloc] initWithCapacity:_lineCount];
	
	if (itemsNum == 0) return;
	_delegate	= (id<JRLayoutDelegate>)self.collectionView.dataSource;
	
	// 1. Item Width
	_itemWidth	= ([self screenWidth] - _sectionInset.left - _sectionInset.right - _horizontalSpacing * (_lineCount - 1)) / _lineCount;
	// 2. Item X
	for (int i = 0; i < _lineCount; ++i) {
		if (i == 0) {
			[_itemXs addObject:[NSNumber numberWithDouble:_sectionInset.left]];
		} else {
			CGFloat x = _sectionInset.left + (_itemWidth + _horizontalSpacing) * (_lineCount - 1);
			[_itemXs addObject:[NSNumber numberWithDouble:x]];
		}
	}
	
	// 3. Item H
	for (int i = 0; i < itemsNum; ++i) {
		
		CGFloat itemH = 0.0;
		if ([self.delegate respondsToSelector:@selector(collectionView:layout:heightForItemAtIndexPath:)]) {
			NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
			itemH = [self.delegate collectionView:self.collectionView layout:self heightForItemAtIndexPath:indexPath];
			[_itemHs addObject:[NSNumber numberWithDouble:itemH]];
		}
		
		if (i < _lineCount) {
			[_itemYs addObject:[NSNumber numberWithDouble:_sectionInset.top]];
			CGRect frame = CGRectMake([_itemXs[i%_lineCount] doubleValue], _sectionInset.top, _itemWidth, itemH);
			[_itemFrames addObject: NSStringFromCGRect(frame)];
			[_lowerH addObject:[NSNumber numberWithDouble:(CGRectGetMaxY(frame))]];
		} else {
			
			NSInteger lineMumb = 0;
			CGFloat lowerY = [_lowerH[lineMumb] doubleValue];
			for (int i = 1; i < _lineCount; ++i) {
				CGFloat y = [_lowerH[i] doubleValue];
				if (y < lowerY) {
					lineMumb = i;
					lowerY = y;
				}
			}
			
			CGRect frame = CGRectMake([_itemXs[lineMumb] doubleValue], lowerY + _verticalSpacing, _itemWidth, itemH);
			_lowerH[lineMumb] = [NSNumber numberWithDouble:lowerY + _verticalSpacing + itemH];
//			--------------------------------------------------------------------------------------
//			NSString *frameString = _itemFrames[i - _lineCount];
//			CGRect frame = CGRectFromString(frameString);
//			CGFloat itemMaxY = CGRectGetMaxY(frame) + _verticalSpacing;
//			frame = CGRectMake([_itemXs[i%_lineCount] doubleValue], itemMaxY, _itemWidth, itemH);
			[_itemFrames addObject: NSStringFromCGRect(frame)];
		}
	}
	
	NSString *frameString = _itemFrames[itemsNum - 1];
	CGRect frame = CGRectFromString(frameString);
	_collectionH = CGRectGetMaxY(frame);
	
	for (int i = 2; i <= _lineCount; ++i) {
		NSString *frameStrong = _itemFrames[itemsNum - i];
		CGRect frame = CGRectFromString(frameStrong);
		CGFloat h = CGRectGetMaxY(frame);
		
		if (h > _collectionH) {
			_collectionH = h;
		}
	}
	_collectionH += _sectionInset.bottom;
}

// 返回 Collection 内容的宽度好高度
- (CGSize)collectionViewContentSize {
	
	CGSize size = CGSizeMake(self.collectionView.frame.size.width, _collectionH);
	return size;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
	
	CGFloat up					= rect.origin.y;
	CGFloat down				= rect.origin.y + rect.size.height;
	NSMutableArray *attributes	= [NSMutableArray array];
	
	for (NSString *frameString in self.itemFrames) {
		CGRect itemFrame = CGRectFromString(frameString);
		if (itemFrame.origin.y <= down && itemFrame.origin.y + itemFrame.size.height >= up) {
			NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.itemFrames indexOfObject:frameString] inSection:0];
			[attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
		}
	}
	return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
	UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
	
	NSString *frameString = _itemFrames[indexPath.row];
	attributes.frame = CGRectFromString(frameString);
	NSLog(@"--------- %@", NSStringFromCGRect(attributes.frame));
	return attributes;
}

#pragma mark - Private Methond
- (CGFloat)screenWidth {
	static CGFloat screenWidth;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		screenWidth = [UIScreen mainScreen].bounds.size.width;
	});
	return screenWidth;
}

- (CGFloat)screenHeight {
	static CGFloat screenHeight;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		screenHeight = [UIScreen mainScreen].bounds.size.height;
	});
	return screenHeight;
}

@end











