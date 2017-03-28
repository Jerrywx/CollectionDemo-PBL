//
//  SimpleViewController.swift
//  Collection_Demo
//
//  Created by wxiao on 2017/3/28.
//  Copyright © 2017年 wxiao. All rights reserved.
//

import UIKit

class SimpleViewController: UIViewController {

	var collection: UICollectionView?
	var layout : UICollectionViewFlowLayout?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupUI()
	}
}

// MARK: - UI
extension SimpleViewController {
	
	func setupUI() {
		title = "Simple"
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
		let width = UIScreen.main.bounds.size.width
		let w = (width - 30) / 2
		
		layout = UICollectionViewFlowLayout()
		layout?.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
		layout?.itemSize = CGSize(width: w, height: w)
		layout?.minimumLineSpacing = 10
		layout?.minimumInteritemSpacing = 10
	}
}


// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension SimpleViewController: UICollectionViewDataSource, UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collection?.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath)
		
		cell?.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
		
		return cell!
	}
	
}
