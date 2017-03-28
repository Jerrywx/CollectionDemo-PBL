//
//  CustomViewController.swift
//  Collection_Demo
//
//  Created by wxiao on 2017/3/28.
//  Copyright © 2017年 wxiao. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {

	var collection: UICollectionView?
	var layout : CustomViewLayout?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupUI()
	}
}

// MARK: - UI
extension CustomViewController {
	
	func setupUI() {
		title = "Custom"
		view.backgroundColor = UIColor.white
		
		setupLayout()
		setupCollection()
	}
	
	///
	func setupCollection() {
		
		collection = UICollectionView(frame: view.bounds, collectionViewLayout: layout!)
		collection?.delegate	= self
		collection?.dataSource	= self
		collection?.backgroundColor = UIColor.white
		view.addSubview(collection!)
		collection?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "item")
	}
	
	func setupLayout() {
		
		layout = CustomViewLayout()
		layout?.horizontalMargin = 10
		layout?.verticalMargin = 10
		layout?.horizontalNumber = 2
		layout?.itemHeight = 200
		layout?.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
	}
}


// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension CustomViewController: UICollectionViewDataSource, UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collection?.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath)
		
		cell?.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
		
		return cell!
	}
	
}
