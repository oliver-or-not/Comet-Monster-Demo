//
//  CareViewController.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/21.
//

import UIKit

class CareViewController: UIViewController {

	@IBOutlet weak var downButton: UIButton!
	
	@IBOutlet weak var foodButton: UIButton!
	
	@IBOutlet weak var playButton: UIButton!
	
	@IBOutlet weak var washButton: UIButton!

	var careChoice = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
				
		self.navigationItem.hidesBackButton = false
		
		downButton.layer.cornerRadius = 20
		foodButton.layer.cornerRadius = 5
		playButton.layer.cornerRadius = 5
		washButton.layer.cornerRadius = 5
		
		loadData()
		
		if Monster.isEgg[CareViewController.myMonster.speciesNum] {
			foodButton.isHidden = true
			playButton.isHidden = true
			washButton.isHidden = true
		} else {
			foodButton.isHidden = false
			playButton.isHidden = false
			washButton.isHidden = false
		}
	}
	
	
	@IBAction func foodPressed(_ sender: UIButton) {
		careChoice = "Food"
		performSegue(withIdentifier: "careToCareMotion", sender: self)
	}
	
	@IBAction func playPressed(_ sender: UIButton) {
		careChoice = "Play"
		performSegue(withIdentifier: "careToCareMotion", sender: self)
	}
	
	@IBAction func washPressed(_ sender: UIButton) {
		careChoice = "Shower"
		performSegue(withIdentifier: "careToCareMotion", sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "careToCareMotion" {
			let destinationVC = segue.destination as! CareMotionViewController
			destinationVC.careChoice = careChoice
		}
	}
	
	@IBAction func downPressed(_ sender: UIButton) {
		
		dismiss(animated: true)
		
	}
	
	
}
