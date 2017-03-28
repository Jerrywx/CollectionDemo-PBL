//
//  MainViewController.swift
//  Collection_Demo
//
//  Created by wxiao on 2017/3/28.
//  Copyright © 2017年 wxiao. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	let tableView = UITableView()
	let dataSource = ["SimpleViewController",
	                  "CustomViewController",]
	
	override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

// MARK: - UI
extension MainViewController {
	
	func setupUI() {
		title = "UICollectionView"
		view.backgroundColor = UIColor.white
		
		tableView.frame = view.bounds
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		view.addSubview(tableView)
		
	}
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataSource.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
		
		cell?.textLabel?.text = dataSource[indexPath.row]
		
		return cell!
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		switch indexPath.row {
			case 0:
			
				let vc = SimpleViewController()
				navigationController?.pushViewController(vc, animated: true)
				
				break
			
			case 1:
			
				let vc = CustomViewController()
				navigationController?.pushViewController(vc, animated: true)
				
				break
			
			default:
				
				break;
		}
		
	}
}
