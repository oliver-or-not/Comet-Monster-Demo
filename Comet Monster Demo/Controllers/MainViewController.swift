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
		
		if !UIViewController.myMonster.hatchOpen && !UIViewController.myMonster.evolveOpen {
			hatchButton.setTitle("", for: .normal)
			hatchButton.isEnabled = false
			hatchButton.alpha = 0.0
		} else if UIViewController.myMonster.hatchOpen {
			hatchButton.setTitle("Hatch", for: .normal)
			hatchButton.isEnabled = true
			hatchButton.alpha = 1.0
			hatchButton.backgroundColor = UIColor(rgb: 0xFF8F78)
		} else if UIViewController.myMonster.evolveOpen {
			hatchButton.setTitle("Evolve", for: .normal)
			hatchButton.isEnabled = true
			hatchButton.alpha = 1.0
			hatchButton.backgroundColor = UIColor(rgb: 0xFF8F78)
		} else {
			hatchButton.setTitle("", for: .normal)
			hatchButton.isEnabled = false
			hatchButton.alpha = 0.0
		}
	}
	
	@IBAction func hatchPressed(_ sender: UIButton) {
		performSegue(withIdentifier: "mainToEvolution", sender: self)
	}
}
