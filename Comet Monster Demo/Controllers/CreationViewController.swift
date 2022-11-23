//
//  CreationViewController.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/21.
//

import UIKit

class CreationViewController: UIViewController {
	
	@IBOutlet weak var nameInputField: UITextField! {
		didSet {
			nameInputField.delegate = self
		}
	}
	
	@IBOutlet weak var createButton: UIButton!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.hidesBackButton = true
		createButton.layer.cornerRadius = 5
	}

	@IBAction func createPressed(_ sender: UIButton) {
		if let safeText = nameInputField.text {
			
			guard safeText.count >= 1 && safeText.count <= 12 && !safeText.contains(" ") else {
				let alert =  UIAlertController(title: "Rename your moster.", message: "", preferredStyle: .alert)
				
				let action = UIAlertAction(title: "OK", style: .default)
				
				alert.addAction(action)
				
				if safeText.count < 1 {
					alert.message = "Empty name is not allowed."
				} else if safeText.count > 12 {
					alert.message = "The name is too long."
				} else if safeText.contains(" ") {
					alert.message = "Space is not allowed."
				} else {
					alert.message = "Undefined case."
				}
				present(alert, animated: true, completion: nil)
				return
			}
			
			CreationViewController.myMonster.nickname = safeText
			
			CreationViewController.myMonster.speciesNum = 1
			
			saveData()
		}
		
		performSegue(withIdentifier: "creationToMain", sender: self)
		
	}

}
