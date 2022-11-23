//
//  ViewController.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/21.
//

import UIKit

class MainViewController: UIViewController {
	
	@IBOutlet weak var statusButton: UIButton!
	
	@IBOutlet weak var careButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationItem.hidesBackButton = true
		statusButton.layer.cornerRadius = 5
		careButton.layer.cornerRadius = 5
		loadData()
	}

	@IBAction func statusPressed(_ sender: UIButton) {
		
		performSegue(withIdentifier: "mainToStatus", sender: self)
		
	}
	
	@IBAction func carePressed(_ sender: UIButton) {
		
		performSegue(withIdentifier: "mainToCare", sender: self)
		
	}
	
}

