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
	
	var motionIndex = 2
	
	var timer = Timer()
	
	@IBOutlet weak var downButton: UIButton!
	
	@IBOutlet weak var monsterImage: UIImageView!
	
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
		
		monsterImage.image = UIViewController.monsterImageArray[UIViewController.myMonster.speciesNum][motionIndex]
		
		if Monster.isEgg[StatusViewController.myMonster.speciesNum] {
			
			nameGraph.text = "???"
			speciesGraph.text = "egg"
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
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		loadData()
		statusTimerFunc()
		timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(statusTimerFunc), userInfo: nil, repeats: true)
	}
	
	@objc func statusTimerFunc() {
		
		print("statusTimerFunc working...")
		
		if Monster.isEgg[UIViewController.myMonster.speciesNum] {
			motionIndex = (motionIndex + 1) % 4
		} else {
			motionIndex = (motionIndex + 1) % 2 + 2
		}
		
		DispatchQueue.main.async {
			self.monsterImage.image = UIViewController.monsterImageArray[UIViewController.myMonster.speciesNum][self.motionIndex]
			
			if Monster.isEgg[StatusViewController.myMonster.speciesNum] {
				
				self.nameGraph.text = "???"
				self.speciesGraph.text = "egg"
				self.healthGraph.text = "-"
				self.emotionGraph.text = "-"
				self.cleannessGraph.text = "-"
				
			} else {
				
				self.nameGraph.text = StatusViewController.myMonster.nickname
				self.speciesGraph.text = Monster.speciesList[StatusViewController.myMonster.speciesNum]  + (StatusViewController.myMonster.sex == 1 ? " (♂︎)" : " (♀︎)")
				self.healthGraph.text = self.healthList[StatusViewController.myMonster.health]
				self.emotionGraph.text = self.emotionList[StatusViewController.myMonster.emotion]
				self.cleannessGraph.text = self.cleannessList[StatusViewController.myMonster.cleanness]
			}
		}
	}
		
		@IBAction func downPressed(_ sender: UIButton) {
			dismiss(animated: true)
		}
		
		override func viewWillDisappear(_ animated: Bool) {
			super.viewWillDisappear(true)
			timer.invalidate()
		}
	}
	
