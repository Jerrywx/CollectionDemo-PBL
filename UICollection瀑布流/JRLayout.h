//
//  JRLayout.h
//  UICollection瀑布流
//
//  Created by wxiao on 15/12/21.
//  Copyright © 2015年 wxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JRLayoutDelegate <NSObject>
@required
- (CGFloat)collectionView:(UICollectionView *)collectionView
				  layout:(UICollectionViewLayout *)collectionViewLayout
  heightForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface JRLayout : UICollectionViewLayout

/**
 *  每行有几个(列数)
 */
@property (nonatomic, assign) NSInteger lineCount;

/**
 *  水平间距
 */
@property (nonatomic, assign) CGFloat horizontalSpacing;

/**
 *  垂直间距
 */
@property (nonatomic, assign) CGFloat verticalSpacing;

/**
 *  边距
 */
@property (nonatomic, assign) UIEdgeInsets sectionInset;

/**
 *  代理对象
 */
@property (nonatomic, weak) id<JRLayoutDelegate> delegate;

@end
