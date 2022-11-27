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
	
	@IBOutlet weak var changeGraph: UILabel!
	
	var careChoice = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if careChoice == "Food" {
			if CareMotionViewController.myMonster.addedHealth - CareMotionViewController.myMonster.subtractedHealth < -3 {
				CareMotionViewController.myMonster.addedHealth = CareMotionViewController.myMonster.subtractedHealth - 3
			}
			CareMotionViewController.myMonster.addedHealth += 2
			if CareMotionViewController.myMonster.addedHealth - CareMotionViewController.myMonster.subtractedHealth > 2 {
				CareMotionViewController.myMonster.addedHealth = CareMotionViewController.myMonster.subtractedHealth + 2
			}
			saveData()
			DispatchQueue.main.async {
				self.changeGraph.text = self.healthList[CareMotionViewController.myMonster.health]
			}
		} else if careChoice == "Play" {
			if CareMotionViewController.myMonster.addedEmotion - CareMotionViewController.myMonster.subtractedEmotion < -3 {
				CareMotionViewController.myMonster.addedEmotion = CareMotionViewController.myMonster.subtractedEmotion - 3
			}
			CareMotionViewController.myMonster.addedEmotion += 2
			if CareMotionViewController.myMonster.addedEmotion - CareMotionViewController.myMonster.subtractedEmotion > 2 {
				CareMotionViewController.myMonster.addedEmotion = CareMotionViewController.myMonster.subtractedEmotion + 2
			}
			saveData()
			DispatchQueue.main.async {
				self.changeGraph.text = self.emotionList[CareMotionViewController.myMonster.emotion]
			}
		} else if careChoice == "Shower" {
			if CareMotionViewController.myMonster.addedCleanness - CareMotionViewController.myMonster.subtractedCleanness < -3 {
				CareMotionViewController.myMonster.addedCleanness = CareMotionViewController.myMonster.subtractedCleanness - 3
			}
			CareMotionViewController.myMonster.addedCleanness += 2
			if CareMotionViewController.myMonster.addedCleanness - CareMotionViewController.myMonster.subtractedCleanness > 2 {
				CareMotionViewController.myMonster.addedCleanness = CareMotionViewController.myMonster.subtractedCleanness + 2
			}
			saveData()
			DispatchQueue.main.async {
				self.changeGraph.text = self.cleannessList[CareMotionViewController.myMonster.cleanness]
			}
		} else {
			dismiss(animated: true)
		}
		
		
		Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
		
	}
	
	@objc func timerFunc() {
		dismiss(animated: true)
	}

}
