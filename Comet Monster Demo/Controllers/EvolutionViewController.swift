//
//  EvolutionViewController.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/26.
//

import Foundation
import UIKit

class EvolutionViewController: UIViewController {
	
	@IBOutlet weak var explanationLabel: UILabel!
	
	@IBOutlet weak var okButton: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		okButton.layer.cornerRadius = 5
		
		explanationLabel.isHidden = true
		okButton.isHidden = true
		
		loadData()
	
		Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: false)
		
	}
	
	
	
	
	@objc func timerFunc() {
		
		EvolutionViewController.myMonster.speciesNum = Monster.evolutionIndex[EvolutionViewController.myMonster.speciesNum]
		
		saveData()
		
		switch EvolutionViewController.myMonster.speciesNum {
		case 0:
			DispatchQueue.main.async {
				self.explanationLabel.text = "A new monster has been born!"
			}
		case 1:
			DispatchQueue.main.async {
				self.explanationLabel.text = "Your monster has evolved!"
			}
		default:
			DispatchQueue.main.async {
				self.explanationLabel.text = "???"
			}
		}
		
		explanationLabel.isHidden = false
		okButton.isHidden = false
	}
	
	@IBAction func okPressed(_ sender: UIButton) {
		if Monster.isNewbie[EvolutionViewController.myMonster.speciesNum] {
			performSegue(withIdentifier: "evolutionToNaming", sender: self)
		} else {
			dismiss(animated: true)
		}
	}
	
	
	
}
