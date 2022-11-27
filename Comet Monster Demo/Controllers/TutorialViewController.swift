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
		

		explanationLabel.text = explanationArray[0]
		
	}
	
	@IBAction func okPressed(_ sender: UIButton) {
		pageNum += 1
		
		guard pageNum < explanationArray.count else {
			
			TutorialViewController.myMonster = Monster()
			saveData()
			
			performSegue(withIdentifier: "tutorialToMain", sender: self)
			return
		}
		
		if pageNum == explanationArray.count - 1 {
			okButton.setTitle("OK", for: .normal)
		}
		
		DispatchQueue.main.async {
			self.explanationLabel.text = self.explanationArray[self.pageNum]
		}
	}

}
