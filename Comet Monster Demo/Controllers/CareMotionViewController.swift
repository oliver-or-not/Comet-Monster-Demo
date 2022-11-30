//
//  CareMotionViewController.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/21.
//

import UIKit

class CareMotionViewController: UIViewController {
	
	var healthList = ["💙💙💙💙💙", "❤️💙💙💙💙", "❤️❤️💙💙💙", "❤️❤️❤️💙💙", "❤️❤️❤️❤️💙", "❤️❤️❤️❤️❤️"]
	var emotionList = ["😡😡😡😡😡", "🙂😡😡😡😡", "🙂🙂😡😡😡", "🙂🙂🙂😡😡", "🙂🙂🙂🙂😡", "🙂🙂🙂🙂🙂"]
	var cleannessList = ["🧹🧹🧹🧹🧹", "✨🧹🧹🧹🧹", "✨✨🧹🧹🧹", "✨✨✨🧹🧹", "✨✨✨✨🧹", "✨✨✨✨✨"]
	
	var careChoice = ""
	
	var motionIndex = 0
	var effectIndex = 0
	
	var prevValue = 0
	var nextValue = 0
	
	var timer = Timer()
	
	@IBOutlet weak var monsterImage: UIImageView!
	
	@IBOutlet weak var toolImage1: UIImageView!
	
	@IBOutlet weak var toolImage2: UIImageView!
	
	@IBOutlet weak var changeGraph: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		loadData()
		
		monsterImage.image = UIViewController.monsterImageArray[UIViewController.myMonster.speciesNum][motionIndex]
		
		toolImage1.alpha = 0.0
		toolImage2.alpha = 0.0
		
		if careChoice == "Food" {
			toolImage1.image = UIViewController.toolArray[0]
			toolImage2.image = UIViewController.toolArray[0]
			
			prevValue = UIViewController.myMonster.health
			changeGraph.text = healthList[prevValue]
			
			if UIViewController.myMonster.addedHealth - UIViewController.myMonster.subtractedHealth < -3 {
				UIViewController.myMonster.addedHealth = UIViewController.myMonster.subtractedHealth - 3
			}
			UIViewController.myMonster.addedHealth += 2
			if UIViewController.myMonster.addedHealth - UIViewController.myMonster.subtractedHealth > 2 {
				UIViewController.myMonster.addedHealth = UIViewController.myMonster.subtractedHealth + 2
			}
			saveData()
			
			nextValue = UIViewController.myMonster.health
			
		} else if careChoice == "Play" {
			toolImage1.image = UIViewController.toolArray[1]
			toolImage2.image = UIViewController.toolArray[1]
			
			prevValue = UIViewController.myMonster.emotion
			changeGraph.text = emotionList[prevValue]
			
			if UIViewController.myMonster.addedEmotion - UIViewController.myMonster.subtractedEmotion < -3 {
				UIViewController.myMonster.addedEmotion = UIViewController.myMonster.subtractedEmotion - 3
			}
			UIViewController.myMonster.addedEmotion += 2
			if UIViewController.myMonster.addedEmotion - UIViewController.myMonster.subtractedEmotion > 2 {
				UIViewController.myMonster.addedEmotion = UIViewController.myMonster.subtractedEmotion + 2
			}
			saveData()
			
			nextValue = UIViewController.myMonster.emotion
			
		} else if careChoice == "Wash" {
			toolImage1.image = UIViewController.toolArray[2]
			toolImage2.image = UIViewController.toolArray[2]
			
			prevValue = UIViewController.myMonster.cleanness
			changeGraph.text = cleannessList[prevValue]
			
			if UIViewController.myMonster.addedCleanness - UIViewController.myMonster.subtractedCleanness < -3 {
				UIViewController.myMonster.addedCleanness = UIViewController.myMonster.subtractedCleanness - 3
			}
			UIViewController.myMonster.addedCleanness += 2
			if UIViewController.myMonster.addedCleanness - UIViewController.myMonster.subtractedCleanness > 2 {
				UIViewController.myMonster.addedCleanness = UIViewController.myMonster.subtractedCleanness + 2
			}
			saveData()
			
			nextValue = UIViewController.myMonster.cleanness
		
		} else {
			dismiss(animated: true)
		}	
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
//		loadData()
		careMotionTimerFunc()
		timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(careMotionTimerFunc), userInfo: nil, repeats: true)
	}
	
	@objc func careMotionTimerFunc() {
		print("careMotionTimerFunc working...")
		
		if Monster.isEgg[UIViewController.myMonster.speciesNum] {
			motionIndex = (motionIndex + 1) % 4
		} else {
			motionIndex = (motionIndex + 1) % 2
		}
		
		DispatchQueue.main.async {
			self.monsterImage.image = UIViewController.monsterImageArray[UIViewController.myMonster.speciesNum][self.motionIndex]
		}
		
		if effectIndex.isMultiple(of: 2) {
			toolImage1.alpha = 1.0
			toolImage2.alpha = 0.0
		} else {
			toolImage1.alpha = 0.0
			toolImage2.alpha = 1.0
		}
		
		if careChoice == "Food" {
			if effectIndex < 3 {
				DispatchQueue.main.async {
					self.changeGraph.text = self.healthList[self.prevValue]
				}
			} else {
				DispatchQueue.main.async {
					self.changeGraph.text = self.healthList[self.nextValue]
				}
			}
		} else if careChoice == "Play" {
			if effectIndex < 3 {
				DispatchQueue.main.async {
					self.changeGraph.text = self.emotionList[self.prevValue]
				}
			} else {
				DispatchQueue.main.async {
					self.changeGraph.text = self.emotionList[self.nextValue]
				}
			}
		} else if careChoice == "Wash" {
			if effectIndex < 3 {
				DispatchQueue.main.async {
					self.changeGraph.text = self.cleannessList[self.prevValue]
				}
			} else {
				DispatchQueue.main.async {
					self.changeGraph.text = self.cleannessList[self.nextValue]
				}
			}
		} else {
			dismiss(animated: true)
		}
		
		if effectIndex >= 6 {
			dismiss(animated: true)
		}
		
		effectIndex += 1
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(true)
		timer.invalidate()
	}
}
