//
//  EvolutionViewController.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/27.
//

import Foundation
import UIKit

class EvolutionViewController: UIViewController {
	
	@IBOutlet weak var expLabel: UILabel!
	
	@IBOutlet weak var okButton: UIButton!
	
	var prevSpeciesNum = 0
	var nextSpeciesNum = 0
	
	var startOrOk = 0
	
	var motionTimer = Timer()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		okButton.layer.cornerRadius = 5
		
		
		expLabel.text = "Something's happening!"
		okButton.setTitle("Start", for: .normal)
		
		loadData()
		
		prevSpeciesNum = EvolutionViewController.myMonster.speciesNum
		nextSpeciesNum = Monster.evolutionSpeciesNum[EvolutionViewController.myMonster.speciesNum]
		
	}
	

	
	
	
	@IBAction func okPressed(_ sender: UIButton) {
		if startOrOk == 0 {//start pressed
			startOrOk = 1
			
			if UIViewController.myMonster.hatchOpen == true {
				UIViewController.myMonster.hatchOpen = false
			} else if UIViewController.myMonster.evolveOpen == true {
				UIViewController.myMonster.evolveOpen = false
			}
			
			UIViewController.myMonster.speciesNum = nextSpeciesNum
			UIViewController.myMonster.birthDate = Date()
			
			saveData()
			
			motionTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(motionTimerFunc), userInfo: nil, repeats: false)
			
			DispatchQueue.main.async {
				self.okButton.isEnabled = false
				self.okButton.setTitle("...", for: .normal)
				self.okButton.backgroundColor = UIColor(rgb: 0xC0C0C0)
			}
			
		} else {
			
			
			//ok pressed
			if Monster.isEgg[prevSpeciesNum] {
				performSegue(withIdentifier: "evolutionToNaming", sender: self)
			} else {
				dismiss(animated: true)
			}
		}
	}
	
	@objc func motionTimerFunc() {
		
		if Monster.isEgg[prevSpeciesNum] {
			DispatchQueue.main.async {
				self.expLabel.text = "A new \(Monster.speciesListLower[self.nextSpeciesNum]) has been born!"
			}
		} else {
			DispatchQueue.main.async {
				self.expLabel.text = "Your \(Monster.speciesListLower[self.prevSpeciesNum]) has evolved to \(Monster.speciesListLower[self.nextSpeciesNum])!"
			}
		}
		
		okButton.isEnabled = true
		okButton.setTitle("OK", for: .normal)
		okButton.backgroundColor = UIColor(rgb: 0x8FA6EB)
	}
	
	
}
