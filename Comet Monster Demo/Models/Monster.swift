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
	var health: Int = 3
	var emotion: Int = 3
	var cleanness: Int = 3
	
	static var speciesList = ["???", "Dinodino", "Dinorigo"]
	static var speciesListLower = speciesList.map{$0.lowercased()}
	static var isEgg = [true, false, false]
	static var canEvolve = [true, true, false]
	static var isNewbie = [false, true, false]
	static var evolutionIndex = [1, 2, -1]
	static var evolutionTimes = [10, 60, -1]
}

