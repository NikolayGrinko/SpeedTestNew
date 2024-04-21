//
//  SecondViewController.swift
//  SpeedTestNew
//
//  Created by Николай Гринько on 11.04.2024.
//

import UIKit

enum Theme: Int {
	case background
	case light
	case dark
	
	func getUserInterfaceStyle() -> UIUserInterfaceStyle {
		
		switch self {
			case .background:
				return .unspecified
			case .light:
				return .light
			case .dark:
				return .dark
		}
	}
}

class SecondViewController: UIViewController {
	
	lazy var segmentControl: UISegmentedControl = {
		let segmentControl = UISegmentedControl(items: ["Background", "Light", "Dark"])
		segmentControl.backgroundColor = .systemGray6
		segmentControl.selectedSegmentTintColor = .darkGray
		segmentControl.frame = CGRect(x: 0, y: 120, width: view.frame.size.width, height: 40)
		segmentControl.selectedSegmentIndex = 0
		segmentControl.tintColor = UIColor(named: "otherColor")
		segmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
		//segmentControl.translatesAutoresizingMaskIntoConstraints = false
		return segmentControl
	}()
	
	@objc private func segmentChanged() {
		MTUserDefaults.shared.theme = Theme(rawValue: segmentControl.selectedSegmentIndex) ?? .background
		view.window?.overrideUserInterfaceStyle = MTUserDefaults.shared.theme.getUserInterfaceStyle()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = Settings.Strings.NavBar.speed
		navigationController?.tabBarItem.title = Settings.Strings.TabBar.title(for: .overview)
		setupView()
	   
    }
	private func setupView() {
		view.backgroundColor = UIColor(named: "backgroundColor")
		view.addSubview(segmentControl)
		
		segmentControl.selectedSegmentIndex = MTUserDefaults.shared.theme.rawValue
	}
}
