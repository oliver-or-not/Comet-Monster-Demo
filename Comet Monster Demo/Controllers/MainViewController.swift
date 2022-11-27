//
//  ViewController.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/21.
//

import UIKit

class MainViewController: UIViewController {
	
	@IBOutlet weak var hatchButton: UIButton!
	
	@IBOutlet weak var statusButton: UIButton!
	
	@IBOutlet weak var careButton: UIButton!
	
	@IBOutlet weak var monsterImage: UIImageView!
	
	var moveIndex = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationItem.hidesBackButton = true
		hatchButton.layer.cornerRadius = 5
		statusButton.layer.cornerRadius = 5
		careButton.layer.cornerRadius = 5
		loadData()
	
		hatchButton.setTitle("", for: .normal)
		hatchButton.isEnabled = false
		hatchButton.alpha = 0.0
		
		monsterImage.image = UIViewController.monsterImageArray[UIViewController.myMonster.speciesNum][0]
		
		Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(mainTimerFunc), userInfo: nil, repeats: true)
	}
	
	@IBAction func statusPressed(_ sender: UIButton) {
		
		performSegue(withIdentifier: "mainToStatus", sender: self)
		
	}
	
	@IBAction func carePressed(_ sender: UIButton) {
		
		performSegue(withIdentifier: "mainToCare", sender: self)
		
	}
	
	@objc func mainTimerFunc() {
		
		if Monster.canEvolve[UIViewController.myMonster.speciesNum] && UIViewController.myMonster.lifeLength > Monster.evolutionTime[UIViewController.myMonster.speciesNum] {
			if Monster.isEgg[UIViewController.myMonster.speciesNum] {
				UIViewController.myMonster.hatchOpen = true
			} else {
				UIViewController.myMonster.evolveOpen = true
			}
		}
		
		saveData()
		
		if UIViewController.myMonster.health == 0 {
			UIViewController.myMonster = Monster()
		} else if UIViewController.myMonster.emotion == 0 {
			UIViewController.myMonster = Monster()
		} else if UIViewController.myMonster.cleanness == 0 {
			UIViewController.myMonster = Monster()
		}
		
		saveData()
		
		if Monster.isEgg[UIViewController.myMonster.speciesNum] {
			moveIndex = (moveIndex + 1) % 4
		} else {
			moveIndex = (moveIndex + 1) % 2
		}
		
		DispatchQueue.main.async {
			self.monsterImage.image = UIViewController.monsterImageArray[UIViewController.myMonster.speciesNum][self.moveIndex]
			
			if !UIViewController.myMonster.hatchOpen && !UIViewController.myMonster.evolveOpen {
				self.hatchButton.setTitle("", for: .normal)
				self.hatchButton.isEnabled = false
				self.hatchButton.alpha = 0.0
			} else if UIViewController.myMonster.hatchOpen {
				self.hatchButton.setTitle("Hatch", for: .normal)
				self.hatchButton.isEnabled = true
				self.hatchButton.alpha = 1.0
				self.hatchButton.backgroundColor = UIColor(rgb: 0xFF8F78)
			} else if UIViewController.myMonster.evolveOpen {
				self.hatchButton.setTitle("Evolve", for: .normal)
				self.hatchButton.isEnabled = true
				self.hatchButton.alpha = 1.0
				self.hatchButton.backgroundColor = UIColor(rgb: 0xFF8F78)
			} else {
				self.hatchButton.setTitle("", for: .normal)
				self.hatchButton.isEnabled = false
				self.hatchButton.alpha = 0.0
			}
		}
	}
	
	@IBAction func hatchPressed(_ sender: UIButton) {
		performSegue(withIdentifier: "mainToEvolution", sender: self)
	}
}
