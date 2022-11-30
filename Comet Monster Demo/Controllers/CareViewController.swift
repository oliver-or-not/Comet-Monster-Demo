//
//  CareViewController.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/21.
//

import UIKit

class CareViewController: UIViewController {

	var careChoice = ""
	
	var motionIndex = 0
	
	var timer = Timer()
	
	@IBOutlet weak var downButton: UIButton!
	
	@IBOutlet weak var monsterImage: UIImageView!
	
	@IBOutlet weak var foodButton: UIButton!
	
	@IBOutlet weak var playButton: UIButton!
	
	@IBOutlet weak var washButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
				
		self.navigationItem.hidesBackButton = false
		
		downButton.layer.cornerRadius = 20
		foodButton.layer.cornerRadius = 5
		playButton.layer.cornerRadius = 5
		washButton.layer.cornerRadius = 5
		
//		loadData()
		
		monsterImage.image = UIViewController.monsterImageArray[UIViewController.myMonster.speciesNum][motionIndex]
		
		if Monster.isEgg[UIViewController.myMonster.speciesNum] {
			foodButton.isHidden = true
			playButton.isHidden = true
			washButton.isHidden = true
		} else {
			foodButton.isHidden = false
			playButton.isHidden = false
			washButton.isHidden = false
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
//		loadData()
		careTimerFunc()
		timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(careTimerFunc), userInfo: nil, repeats: true)
	}
	
	@objc func careTimerFunc() {
		print("careTimerFunc working...")
		
		if Monster.isEgg[UIViewController.myMonster.speciesNum] {
			motionIndex = (motionIndex + 1) % 4
		} else {
			motionIndex = (motionIndex + 1) % 2
		}
		
		DispatchQueue.main.async {
			self.monsterImage.image = UIViewController.monsterImageArray[UIViewController.myMonster.speciesNum][self.motionIndex]
		}
	}
	
	
	@IBAction func foodPressed(_ sender: UIButton) {
		careChoice = "Food"
		performSegue(withIdentifier: "careToCareMotion", sender: self)
	}
	
	@IBAction func playPressed(_ sender: UIButton) {
		careChoice = "Play"
		performSegue(withIdentifier: "careToCareMotion", sender: self)
	}
	
	@IBAction func washPressed(_ sender: UIButton) {
		careChoice = "Wash"
		performSegue(withIdentifier: "careToCareMotion", sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "careToCareMotion" {
			let destinationVC = segue.destination as! CareMotionViewController
			destinationVC.careChoice = careChoice
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
