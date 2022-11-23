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
			CareMotionViewController.myMonster.health = min(5, CareMotionViewController.myMonster.health + 2)
			saveData()
			DispatchQueue.main.async {
				self.changeGraph.text = self.healthList[CareMotionViewController.myMonster.health]
			}
		} else if careChoice == "Play" {
			CareMotionViewController.myMonster.emotion = min(5, CareMotionViewController.myMonster.emotion + 2)
			saveData()
			DispatchQueue.main.async {
				self.changeGraph.text = self.emotionList[CareMotionViewController.myMonster.emotion]
			}
		} else if careChoice == "Shower" {
			CareMotionViewController.myMonster.cleanness = min(5, CareMotionViewController.myMonster.cleanness + 2)
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
