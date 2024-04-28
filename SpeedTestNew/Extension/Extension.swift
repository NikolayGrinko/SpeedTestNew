//
//  Extension.swift
//  SpeedTestNew
//
//  Created by Николай Гринько on 22.04.2024.
//

import Foundation


import UIKit

extension UILabel {
	
	convenience init(text: String, textColor: UIColor, size: CGFloat) {
		self.init()
		self.text = text
		self.textColor = textColor
		self.font = .systemFont(ofSize: size)
		self.translatesAutoresizingMaskIntoConstraints = false
	}
	
}
