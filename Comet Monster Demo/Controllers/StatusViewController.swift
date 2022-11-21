//
//  StatusViewController.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/21.
//

import UIKit

class StatusViewController: UIViewController {
	
	var myMonster = Monster()
	
	let monsterFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("MonsterFile.plist")
	
	var healthList = ["💙💙💙💙💙", "❤️💙💙💙💙", "❤️❤️💙💙💙", "❤️❤️❤️💙💙", "❤️❤️❤️❤️💙", "❤️❤️❤️❤️❤️"]
	var emotionList = ["😡😡😡😡😡", "🙂😡😡😡😡", "🙂🙂😡😡😡", "🙂🙂🙂😡😡", "🙂🙂🙂🙂😡", "🙂🙂🙂🙂🙂"]
	var cleannessList = ["🧹🧹🧹🧹🧹", "✨🧹🧹🧹🧹", "✨✨🧹🧹🧹", "✨✨✨🧹🧹", "✨✨✨✨🧹", "✨✨✨✨✨"]

	@IBOutlet weak var nameGraph: UILabel!
	
	@IBOutlet weak var speciesGraph: UILabel!
	
	@IBOutlet weak var healthGraph: UILabel!
	
	@IBOutlet weak var emotionGraph: UILabel!
	
	@IBOutlet weak var cleannessGraph: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		loadData()
		
		nameGraph.text = myMonster.nickname + (myMonster.sex == 1 ? " (♂︎)" : " (♀︎)")
		speciesGraph.text = Monster.speciesList[myMonster.speciesNum]
		healthGraph.text = healthList[myMonster.health]
		emotionGraph.text = emotionList[myMonster.emotion]
		cleannessGraph.text = cleannessList[myMonster.cleanness]
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

