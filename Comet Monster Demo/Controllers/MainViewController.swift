//
//  ViewController.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/21.
//

import UIKit

class MainViewController: UIViewController {
	
	var myMonster = Monster()
	
	let monsterFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("MonsterFile.plist")
	
	@IBOutlet weak var statusButton: UIButton!
	
	@IBOutlet weak var careButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		statusButton.layer.cornerRadius = 5
		careButton.layer.cornerRadius = 5
		loadData()
	}

	@IBAction func statusPressed(_ sender: UIButton) {
		
		performSegue(withIdentifier: "mainToStatus", sender: self)
		
	}
	
	@IBAction func carePressed(_ sender: UIButton) {
		
		performSegue(withIdentifier: "mainToCare", sender: self)
		
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
	
	
	
//	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//		if segue.identifier == "mainToStatus" {
//			let destinationVC = segue.destination as! StatusViewController
//			destinationVC.myMonster = myMonster
//		} else if segue.identifier == "mainToCare" {
//			let destinationVC = segue.destination as! CareViewController
//			destinationVC.myMonster = myMonster
//		}
//	}
	
}

