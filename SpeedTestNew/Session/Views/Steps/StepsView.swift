//
//  StepsView.swift
//  SpeedTestNew
//
//  Created by Николай Гринько on 14.04.2024.
//

import UIKit

final class StepsView: WABaseInfoView {

	private let barsView = WABarsView()

	func configure(with itmes: [WABarView.Data]) {
		barsView.configure(with: itmes)
	}
}

extension StepsView {
	override func setupViews() {
		super.setupViews()

		setupView(barsView)
	}

	override func constaintViews() {
		super.constaintViews()

		NSLayoutConstraint.activate([
			barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
			barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
		])
	}

	override func configureAppearance() {
		super.configureAppearance()
	}
}
