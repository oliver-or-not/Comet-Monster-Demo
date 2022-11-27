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
	
	@IBOutlet weak var monsterImage: UIImageView!
	
	@IBOutlet weak var effectImage: UIImageView!
	
	var prevSpeciesNum = 0
	var nextSpeciesNum = 0
	
	var startOrOk = 0
	
	var moveIndex = 0
	var effectIndex = 0
	let effectOrder = [0, 1, 0, 1,    2, 1, 2, 1, 2,     3, 3, 3, 3]
	let monsterAlphaOrder = [1.0, 1.0, 1.0, 1.0,    1.0, 1.0, 1.0, 1.0, 1.0,     0, 0.33, 0.66, 1.0]
	let effectAlphaOrder = [1.0, 1.0, 1.0, 1.0,     1.0, 1.0, 1.0, 1.0, 1.0,     1.0, 0.66, 0.33, 0.0]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		okButton.layer.cornerRadius = 5
		
		
		expLabel.text = "Something's happening!"
		okButton.setTitle("Start", for: .normal)
		effectImage.alpha = 0.0
		
		loadData()
		
		prevSpeciesNum = EvolutionViewController.myMonster.speciesNum
		nextSpeciesNum = Monster.evolutionSpeciesNum[EvolutionViewController.myMonster.speciesNum]
	}
	
	@objc func evolutionTimerFunc() {
		
		moveIndex = (moveIndex + 1) % 4
		
		DispatchQueue.main.async {
			if self.effectIndex < 9 {
				if Monster.isEgg[self.prevSpeciesNum] {
					self.monsterImage.image = UIViewController.monsterImageArray[self.prevSpeciesNum][self.moveIndex]
				} else {
					self.monsterImage.image = UIViewController.monsterImageArray[self.prevSpeciesNum][self.moveIndex % 2]
				}
			} else {
				self.monsterImage.image = UIViewController.monsterImageArray[self.nextSpeciesNum][self.moveIndex % 2]
			}
			
			if self.effectIndex < 13 {
				self.effectImage.image = UIViewController.evolutionEffectArray[self.effectOrder[self.effectIndex]]
				self.effectImage.alpha = self.effectAlphaOrder[self.effectIndex]
				self.monsterImage.alpha = self.monsterAlphaOrder[self.effectIndex]
			} else {
				self.effectImage.alpha = 0.0
			}
			
			self.effectIndex += 1
		}
		
		
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
			
			Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(motionTimerFunc), userInfo: nil, repeats: false)
			Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(evolutionTimerFunc), userInfo: nil, repeats: true)
			
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

