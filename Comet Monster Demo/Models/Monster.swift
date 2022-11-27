//
//  MonsterStatus.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/21.
//

import Foundation

struct Monster: Codable {
	var nickname: String = "???"
	var sex: Int = Int.random(in: 1...2)
	var speciesNum: Int = 0
	var birthDate = Date()
	var lifeLength: Int {
		Int(Date().timeIntervalSince(MainViewController.myMonster.birthDate))
	}
	
	var hatchOpen = false
	var evolveOpen = false
	
	var health: Int {
		min(max(0, 3 + addedHealth - subtractedHealth), 5)
	}
	var emotion: Int {
		min(max(0, 3 + addedEmotion - subtractedEmotion), 5)
	}
	var cleanness: Int {
		min(max(0, 3 + addedCleanness - subtractedCleanness), 5)
	}
	
	var addedHealth: Int = 0
	var addedEmotion: Int = 0
	var addedCleanness: Int = 0
	
	var subtractedHealth: Int {
		lifeLength / 20
	}
	var subtractedEmotion: Int {
		lifeLength / 40
	}
	var subtractedCleanness: Int {
		lifeLength / 30
	}
	
	static var speciesList = ["???", "Dinodino", "Dinorigo"]
	static var speciesListLower = speciesList.map{$0.lowercased()}
	static var isEgg = [true, false, false]
	static var canEvolve = [true, true, false]
	static var evolutionSpeciesNum = [1, 2, -1]
	static var previousFormIndex = [-1, 0, 1]
	static var evolutionTime = [3, 20, -1]
}

