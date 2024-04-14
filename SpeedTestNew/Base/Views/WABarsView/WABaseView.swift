//
//  WABaseView.swift
//  SpeedTestNew
//
//  Created by Николай Гринько on 14.04.2024.
//

import UIKit

class WABaseView: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)

		setupViews()
		constaintViews()
		configureAppearance()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		
		setupViews()
		constaintViews()
		configureAppearance()
	}
}

@objc extension WABaseView {
	func setupViews() {}
	func constaintViews() {}
	
	func configureAppearance() {
		backgroundColor = .white
	}
}
