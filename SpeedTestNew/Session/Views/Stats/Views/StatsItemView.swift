//
//  StatsItemView.swift
//  SpeedTestNew
//
//  Created by Николай Гринько on 14.04.2024.
//

import UIKit

enum StatsItem {
	case heartRate(value: String)
	case averagePace(value: String)
	case totalDistance(value: String)
	case totalSteps(value: String)

	var data: StatsItemView.ItemData {
		switch self {
			case .heartRate(let value):
				return .init(image: Settings.Images.Session.Stats.heartRate,
							 value: value + " Мb/c",
							 title: Settings.Strings.Session.averageSpeed)
		case .averagePace(let value):
			return .init(image: Settings.Images.Session.Stats.averagePace,
						 value: value + " / сек",
						 title: Settings.Strings.Session.averagePace)
		case .totalDistance(let value):
			return .init(image: Settings.Images.Session.Stats.totalDistance,
						 value: value + " Мb/c",
						 title: Settings.Strings.Session.totalDistance)
		case .totalSteps(let value):
			return .init(image: Settings.Images.Session.Stats.totalSteps,
						 value: value + " Мb/c",
						 title: Settings.Strings.Session.totalSteps)
		}
	}
}

final class StatsItemView: WABaseView {
	struct ItemData {
		let image: UIImage?
		let value: String
		let title: String
	}

	private let imageView = UIImageView()

	private let valueLabel: UILabel = {
		let label = UILabel()
		label.font = Settings.Fonts.helvelticaRegular(with: 17)
		label.textColor = Settings.Colors.titleGray
		return label
	}()

	private let titleLabel: UILabel = {
		let label = UILabel()
		label.font = Settings.Fonts.helvelticaRegular(with: 10)
		label.textColor = Settings.Colors.inactive
		return label
	}()

	private let stackView: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		return view
	}()

	func configure(with item: StatsItem) {
		imageView.image = item.data.image
		valueLabel.text = item.data.value
		titleLabel.text = item.data.title.uppercased()
	}
}

extension StatsItemView {
	override func setupViews() {
		super.setupViews()

		setupView(imageView)
		setupView(stackView)
		stackView.addArrangedSubview(valueLabel)
		stackView.addArrangedSubview(titleLabel)
	}

	override func constaintViews() {
		super.constaintViews()

		NSLayoutConstraint.activate([
			imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
			imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			imageView.widthAnchor.constraint(equalToConstant: 23),

			stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
	}

	override func configureAppearance() {
		super.configureAppearance()
	}
}
