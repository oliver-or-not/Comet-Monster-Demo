//
//  CareViewController.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/21.
//

import UIKit

class CareViewController: UIViewController {

	var myMonster = Monster()
	
	let monsterFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("MonsterFile.plist")
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		loadData()
	}

	func loadData() {
		do {
			let data = try Data(contentsOf: monsterFilePath!)
			let decoder = PropertyListDecoder()
			myMonster = try decoder.decode(Monster.self, from: data)
		} catch {
			print("Error while decoding, \(error)")
		}
	}
	
}
