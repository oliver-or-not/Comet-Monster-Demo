//
//  CreationViewController.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/21.
//

import UIKit

class TutorialViewController: UIViewController {
	
	@IBOutlet weak var explanationLabel: UILabel!
	
	@IBOutlet weak var okButton: UIButton!
	
	var explanationArray = [
		"One day, It started to fall special comets everywhere on earth.",
		"People found some eggs in those comets.",
		"Some monsters came out from those eggs...",
		"and people started to call them 'comet monsters.'",
		"... Do you want an egg? Will you try to breed a comet monster?"]
	
	var pageNum = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		okButton.layer.cornerRadius = 5
		
		okButton.setTitle("...", for: .normal)
		okButton.isEnabled = false
		okButton.backgroundColor = UIColor(rgb: 0xC0C0C0)
		
		
		explanationLabel.text = explanationArray[0]
		
		Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tutorialTimeFunc), userInfo: nil, repeats: false)
		
	}
	
	@IBAction func okPressed(_ sender: UIButton) {
		
		DispatchQueue.main.async {
			self.okButton.isEnabled = false
			self.okButton.backgroundColor = UIColor(rgb: 0xC0C0C0)
		}
		
		pageNum += 1
		
		guard pageNum < explanationArray.count else {
			
			TutorialViewController.myMonster = Monster()
			saveData()
			
			performSegue(withIdentifier: "tutorialToMain", sender: self)
			return
		}
		
		DispatchQueue.main.async {
			self.explanationLabel.text = self.explanationArray[self.pageNum]
			Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.tutorialTimeFunc), userInfo: nil, repeats: false)
		}
	}

	@objc func tutorialTimeFunc() {
		okButton.isEnabled = true
		okButton.backgroundColor = UIColor(rgb: 0x8EA5EB)
		if pageNum == explanationArray.count - 1 {
			okButton.setTitle("OK", for: .normal)
		}
	}
	
}
