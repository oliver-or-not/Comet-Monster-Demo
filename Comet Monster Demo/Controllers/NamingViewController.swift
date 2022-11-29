//
//  NamingViewController.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/26.
//

import Foundation
import UIKit

class NamingViewController: UIViewController {
	
	var motionIndex = 0
	
	var timer = Timer()
	
	@IBOutlet weak var monsterImage: UIImageView!
	
	@IBOutlet weak var speciesGraph: UILabel!
	
	@IBOutlet weak var nameInputField: UITextField! {
		didSet {
			nameInputField.delegate = self
		}
	}
	
	@IBOutlet weak var doneButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.hidesBackButton = true
		doneButton.layer.cornerRadius = 5
		
		loadData()
		
		monsterImage.image = UIViewController.monsterImageArray[UIViewController.myMonster.speciesNum][motionIndex]
		
		speciesGraph.text = Monster.speciesList[StatusViewController.myMonster.speciesNum]  + (StatusViewController.myMonster.sex == 1 ? " (♂︎)" : " (♀︎)")
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		loadData()
		namingTimerFunc()
		timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(namingTimerFunc), userInfo: nil, repeats: true)
	}

	@objc func namingTimerFunc() {
		print("namingTimerFunc working...")
		
		if Monster.isEgg[UIViewController.myMonster.speciesNum] {
			motionIndex = (motionIndex + 1) % 4
		} else {
			motionIndex = (motionIndex + 1) % 2
		}
		
		DispatchQueue.main.async {
			self.monsterImage.image = UIViewController.monsterImageArray[UIViewController.myMonster.speciesNum][self.motionIndex]
		}
	}
	
	
	@IBAction func donePressed(_ sender: UIButton) {
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
			
			NamingViewController.myMonster.nickname = safeText
			
			saveData()
		}
		
		
		performSegue(withIdentifier: "returnFromNamingToMain", sender: self)
		
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(true)
		timer.invalidate()
	}

}
