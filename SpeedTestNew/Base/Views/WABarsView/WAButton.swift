//
//  WAButton.swift
//  SpeedTestNew
//
//  Created by Николай Гринько on 14.04.2024.
//

import UIKit

public enum WAButtonType {
	case primary
	case secondary
}

final class WAButton: UIButton {

	private var type: WAButtonType = .primary

	private let lable: UILabel = {
		let lable = UILabel()
		lable.textAlignment = .center
		return lable
	}()

	private let iconView: UIImageView = {
		let view = UIImageView()
		view.image = Settings.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
		return view
	}()

	init(with type: WAButtonType) {
		super.init(frame: .zero)
		self.type = type

		setupViews()
		constaintViews()
		configureAppearance()
	}

	required init?(coder: NSCoder) {
		super.init(frame: .zero)

		setupViews()
		constaintViews()
		configureAppearance()
	}

	func setTitle(_ title: String?) {
		lable.text = title
	}
}

private extension WAButton {

	func setupViews() {
		setupView(lable)
		setupView(iconView)
	}

	func constaintViews() {
		var horisontalOffset: CGFloat {
			switch type {
			case .primary: return 0
			case .secondary: return 10
			}
		}

		NSLayoutConstraint.activate([
			iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
			iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horisontalOffset),
			iconView.heightAnchor.constraint(equalToConstant: 5),
			iconView.widthAnchor.constraint(equalToConstant: 10),

			lable.centerYAnchor.constraint(equalTo: centerYAnchor),
			lable.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
			lable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horisontalOffset * 2)
		])
	}

	func configureAppearance() {
		switch type {
		case .primary:
			lable.textColor = Settings.Colors.inactive
			lable.font = Settings.Fonts.helvelticaRegular(with: 13)
			iconView.tintColor = Settings.Colors.inactive

		case .secondary:
			backgroundColor = Settings.Colors.secondary
			layer.cornerRadius = 14
			lable.textColor = Settings.Colors.active
			lable.font = Settings.Fonts.helvelticaRegular(with: 15)
			iconView.tintColor = Settings.Colors.active
		}

		makeSystem(self)
	}
}
