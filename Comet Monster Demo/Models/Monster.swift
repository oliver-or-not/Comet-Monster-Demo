//
//  MonsterStatus.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/21.
//

import Foundation

struct Monster: Codable {
	var nickname: String = ""
	var sex: Int = 1
	var speciesNum: Int = 0
	var health: Int = 3
	var emotion: Int = 3
	var cleanness: Int = 3
	
	static var speciesList = ["???", "Dinodino", "Dinorigo"]
}

