//
//  PercentView.swift
//  SpeedTestNew
//
//  Created by Николай Гринько on 14.04.2024.
//

import UIKit

extension TimerView {
	final class PercentView: WABaseView {

		private let stackView: UIStackView = {
			let view = UIStackView()
			view.axis = .vertical
			view.distribution = .fillProportionally
			view.spacing = 5
			return view
		}()

		private let percentLabel: UILabel = {
			let label = UILabel()
			label.font = Settings.Fonts.helvelticaRegular(with: 23)
			label.textColor = Settings.Colors.titleGray
			label.textAlignment = .center
			return label
		}()

		private let subtitleLabel: UILabel = {
			let label = UILabel()
			label.font = Settings.Fonts.helvelticaRegular(with: 10)
			label.textColor = Settings.Colors.inactive
			label.textAlignment = .center
			return label
		}()

		override func setupViews() {
			super.setupViews()

			setupView(stackView)
			stackView.addArrangedSubview(percentLabel)
			stackView.addArrangedSubview(subtitleLabel)
		}

		override func constaintViews() {
			super.constaintViews()

			NSLayoutConstraint.activate([
				stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
				stackView.topAnchor.constraint(equalTo: topAnchor),
				stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
				stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
			])
		}

		func configure(with title: String, andValue value: Int) {
			subtitleLabel.text = title
			percentLabel.text = "\(value)%"
		}
	}
}
