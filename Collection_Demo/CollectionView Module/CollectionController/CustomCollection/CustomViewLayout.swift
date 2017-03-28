//
//  CustomViewLayout.swift
//  Collection_Demo
//
//  Created by wxiao on 2017/3/28.
//  Copyright © 2017年 wxiao. All rights reserved.
//

import UIKit

class CustomViewLayout: UICollectionViewLayout {
	
	/// 水平间距
	var horizontalMargin:CGFloat = 0.0
	
	/// 垂直间距
	var verticalMargin:CGFloat = 0
	
	/// 水平item数量
	var horizontalNumber = 2
	
	/// 垂直item数量
//	var verticalNumber = 0
	
	/// item Width
	var itemWidth:CGFloat = 0.0
	
	/// item Height
	var itemHeight:CGFloat = 0.0
	
	/// Item Size
	var itemSize = CGSize(width: 0, height: 0)
	
	/// 组数
//	var sectionNumb = 0
	
	/// 项目数
	var itemNumb = 0
	
	/// 内容编剧
	var contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
	
	/// <#Description#>
	var contentWidth:CGFloat = 0.0
	
	/// <#Description#>
	var contentHeight = 0
	
	/// 布局数组
	var layoutArray: [UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()

	/// 布局前准备
	override func prepare() {
		
		///
		itemNumb = collectionView?.numberOfItems(inSection: 0) ??  0
		
		///
		contentWidth = (collectionView?.bounds.size.width)! - contentEdgeInsets.left - contentEdgeInsets.right
		contentHeight = Int((collectionView?.bounds.size.height)! - contentEdgeInsets.top - contentEdgeInsets.bottom)
		
		itemWidth = (contentWidth - CGFloat(horizontalNumber - 1) * horizontalMargin) / CGFloat(horizontalNumber)
		
		for i in 0..<itemNumb {
			
			let l:Int = i / horizontalNumber
			let v:Int = i % horizontalNumber
			
			let x:CGFloat = CGFloat(contentEdgeInsets.left + CGFloat(v) * (horizontalMargin + itemWidth))
			let y:CGFloat = CGFloat(contentEdgeInsets.top + CGFloat(l) * (verticalMargin + itemHeight))
			
			let layout = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: i, section: 0))
			layout.frame = CGRect(x: x, y: y, width: CGFloat(itemWidth), height: CGFloat(itemHeight))
			
			layoutArray.append(layout)
		}
	}
	
	override var collectionViewContentSize: CGSize {
		
		let lay = layoutArray.last
		let h = (lay?.frame.maxY ?? 0) + contentEdgeInsets.bottom
		return CGSize(width: (collectionView?.frame.size.width)! , height: h)
	}
	
	override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
		
		return layoutArray[indexPath.row]
	}
	
	override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
		return layoutArray
	}
	
}
