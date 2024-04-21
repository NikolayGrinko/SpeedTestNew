//
//  MTUserDefaults.swift
//  SpeedTestNew
//
//  Created by Николай Гринько on 21.04.2024.
//

import Foundation

struct MTUserDefaults {
	
	static var shared = MTUserDefaults()
	
	var theme: Theme {
		get {
			Theme(rawValue: UserDefaults.standard.integer(forKey: "selectedTheme")) ?? .background
		}
		set {
			UserDefaults.standard.set(newValue.rawValue, forKey: "selectedTheme")
		}
	}
	
}
