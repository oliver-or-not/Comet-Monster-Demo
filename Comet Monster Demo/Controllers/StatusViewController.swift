//
//  StatusViewController.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/21.
//

import UIKit

class StatusViewController: UIViewController {
	
	var healthList = ["💙💙💙💙💙", "❤️💙💙💙💙", "❤️❤️💙💙💙", "❤️❤️❤️💙💙", "❤️❤️❤️❤️💙", "❤️❤️❤️❤️❤️"]
	var emotionList = ["😡😡😡😡😡", "🙂😡😡😡😡", "🙂🙂😡😡😡", "🙂🙂🙂😡😡", "🙂🙂🙂🙂😡", "🙂🙂🙂🙂🙂"]
	var cleannessList = ["🧹🧹🧹🧹🧹", "✨🧹🧹🧹🧹", "✨✨🧹🧹🧹", "✨✨✨🧹🧹", "✨✨✨✨🧹", "✨✨✨✨✨"]

	@IBOutlet weak var downButton: UIButton!
	
	@IBOutlet weak var nameGraph: UILabel!
	
	@IBOutlet weak var speciesGraph: UILabel!
	
	@IBOutlet weak var healthGraph: UILabel!
	
	@IBOutlet weak var emotionGraph: UILabel!
	
	@IBOutlet weak var cleannessGraph: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationItem.hidesBackButton = false
		
		downButton.layer.cornerRadius = 20
		
		loadData()

		if Monster.isEgg[StatusViewController.myMonster.speciesNum] {
			
			nameGraph.text = "???"
			speciesGraph.text = "???"
			healthGraph.text = "-"
			emotionGraph.text = "-"
			cleannessGraph.text = "-"
			
		} else {
			
			nameGraph.text = StatusViewController.myMonster.nickname
			speciesGraph.text = Monster.speciesList[StatusViewController.myMonster.speciesNum]  + (StatusViewController.myMonster.sex == 1 ? " (♂︎)" : " (♀︎)")
			healthGraph.text = healthList[StatusViewController.myMonster.health]
			emotionGraph.text = emotionList[StatusViewController.myMonster.emotion]
			cleannessGraph.text = cleannessList[StatusViewController.myMonster.cleanness]
			
		}
	}

	@IBAction func downPressed(_ sender: UIButton) {
		
		dismiss(animated: true)
		
	}
	
	
	
}

