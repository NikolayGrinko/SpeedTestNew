//
//  WABaseController.swift
//  WorkoutApp
//
//  Created by Николай Гринько on 14.04.2024.
//


import UIKit

enum NavBarPosition {
	case left
	case right
}

class WABaseController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		setupViews()
		constraintViews()
		configureAppearance()
	}
}

@objc extension WABaseController {

	func setupViews() {}
	func constraintViews() {}

	func configureAppearance() {
		view.backgroundColor = UIColor(named: "backgroundColor")
	}

	func navBarLeftButtonHandler() {
		print("NavBar left button tapped")
	}

	func navBarRightButtonHandler() {
		print("NavBar right button tapped")
	}
}

extension WABaseController {
	func addNavBarButton(at position: NavBarPosition, with title: String) {
		let button = UIButton(type: .system)
		button.setTitle(title, for: .normal)
		button.setTitleColor(Settings.Colors.active, for: .normal)
		button.setTitleColor(Settings.Colors.inactive, for: .disabled)
		button.titleLabel?.font = Settings.Fonts.helvelticaRegular(with: 17)

		switch position {
		case .left:
			button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
			navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
		case .right:
			button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
			navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
		}
	}
}
