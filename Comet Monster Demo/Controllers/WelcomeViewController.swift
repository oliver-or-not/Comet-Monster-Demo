//
//  WelcomeViewController.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/21.
//

import UIKit

class WelcomeViewController: UIViewController {

	@IBOutlet weak var newStartButton: UIButton!
	
	@IBOutlet weak var continueButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		newStartButton.layer.cornerRadius = 5
		continueButton.layer.cornerRadius = 5
		loadData()
		if UIViewController.myMonster.nickname == "" {
			continueButton.backgroundColor = .darkGray
		}
	}
	
	@IBAction func newStartPressed(_ sender: UIButton) {
		if UIViewController.myMonster.nickname == "" {
			performSegue(withIdentifier: "welcomeToCreation", sender: self)
		} else {
			let alert = UIAlertController(title: "Alert", message: "Will you erase your previous data?", preferredStyle: .alert)
			
			let action1 = UIAlertAction(title: "Yes", style: .default) { action in
				
				let alert = UIAlertController(title: "Alert", message: "Delete process will be actuated.", preferredStyle: .alert)
				
				let action1 = UIAlertAction(title: "Yes", style: .default) { action in
					
					self.performSegue(withIdentifier: "welcomeToCreation", sender: self)
				}
				
				let action2 = UIAlertAction(title: "No", style: .default)
				
				alert.addAction(action1)
				alert.addAction(action2)
				
				self.present(alert, animated: true, completion: nil)
				
			}
			
			let action2 = UIAlertAction(title: "No", style: .default)
			
			alert.addAction(action1)
			alert.addAction(action2)
			
			present(alert, animated: true, completion: nil)
			
			
		}
	}
	
	@IBAction func continuePressed(_ sender: UIButton) {
		if UIViewController.myMonster.nickname == "" {
			let alert = UIAlertController(title: "No Previous Data", message: "Press 'New Start' button instead.", preferredStyle: .alert)
			
			let action = UIAlertAction(title: "OK", style: .default)
			
			alert.addAction(action)
			
			self.present(alert, animated: true, completion: nil)
			
		} else {
			performSegue(withIdentifier: "welcomeToMain", sender: self)
		}
	}
	

	
	
}
