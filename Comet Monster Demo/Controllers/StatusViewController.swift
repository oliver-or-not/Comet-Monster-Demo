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

	@IBOutlet weak var nameGraph: UILabel!
	
	@IBOutlet weak var speciesGraph: UILabel!
	
	@IBOutlet weak var healthGraph: UILabel!
	
	@IBOutlet weak var emotionGraph: UILabel!
	
	@IBOutlet weak var cleannessGraph: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		loadData()
		
		nameGraph.text = StatusViewController.myMonster.nickname + (StatusViewController.myMonster.sex == 1 ? " (♂︎)" : " (♀︎)")
		speciesGraph.text = Monster.speciesList[StatusViewController.myMonster.speciesNum]
		healthGraph.text = healthList[StatusViewController.myMonster.health]
		emotionGraph.text = emotionList[StatusViewController.myMonster.emotion]
		cleannessGraph.text = cleannessList[StatusViewController.myMonster.cleanness]
	}

}

