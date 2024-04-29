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
	
	private var customTextField = CustomTextField()
	
	lazy var segmentControl: UISegmentedControl = {
		let segmentControl = UISegmentedControl(items: ["Background", "Light", "Dark"])
		segmentControl.backgroundColor = .systemGray6
		segmentControl.selectedSegmentTintColor = .darkGray
		segmentControl.selectedSegmentIndex = 0
		segmentControl.tintColor = UIColor(named: "otherColor")
		segmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
		segmentControl.translatesAutoresizingMaskIntoConstraints = false
		return segmentControl
	}()
	
	private let downloadView: UIView = {
		let downView = UIView()
		downView.backgroundColor = .systemGray6
		downView.layer.cornerRadius = 10
		downView.layer.borderWidth = 3
		downView.translatesAutoresizingMaskIntoConstraints = false
		return downView
	}()
	
	private let recoilView: UIView = {
		let recoilview = UIView()
		recoilview.layer.cornerRadius = 10
		recoilview.layer.borderWidth = 3
		recoilview.backgroundColor = .systemGray6
		recoilview.translatesAutoresizingMaskIntoConstraints = false
		return recoilview
	}()
	
	// ++++
	private let downloadSpeedLabel: UILabel = {
		let labelDownload = UILabel()
		labelDownload.text = "Download Speed"
		labelDownload.frame = CGRect(x: 30, y: 65, width: 150, height: 20)
		labelDownload.font = Settings.Fonts.helvelticaRegular(with: 15)
		labelDownload.textColor = Settings.Colors.inactive
		return labelDownload
	}()
	
	
	private let textDownloadSpeedLabel: UILabel = {
		let labelDownload = UILabel()
		labelDownload.text = "28.8 Mb/c"
		labelDownload.frame = CGRect(x: 55, y: 20, width: 140, height: 30)
		labelDownload.font = Settings.Fonts.helvelticaRegular(with: 23)
		labelDownload.textColor = Settings.Colors.titleGray
		return labelDownload
	}()
	// ++++
	private let recoilSpeedLabel: UILabel = {
		let speedLabel = UILabel()
		speedLabel.text = "Recoil speed"
		speedLabel.frame = CGRect(x: 45, y: 65, width: 150, height: 20)
		speedLabel.font = Settings.Fonts.helvelticaRegular(with: 15)
		speedLabel.textColor = Settings.Colors.inactive
		return speedLabel
	}()
	
	private let textRecoilSpeedLabel: UILabel = {
		let labelDownload = UILabel()
		labelDownload.text = "12.8 Mb/c"
		labelDownload.frame = CGRect(x: 55, y: 20, width: 140, height: 30)
		labelDownload.font = Settings.Fonts.helvelticaRegular(with: 23)
		labelDownload.textColor = Settings.Colors.titleGray
		return labelDownload
	}()
	
	private let upImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.frame = CGRect(x: 5, y: 20, width: 40, height: 40)
		imageView.tintColor = .red
		imageView.image = UIImage(systemName: "arrowshape.up.fill")
		return imageView
	}()
	
	private let downImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.frame = CGRect(x: 5, y: 20, width: 40, height: 40)
		imageView.tintColor = .blue
		imageView.image = UIImage(systemName: "arrowshape.down.fill")
		return imageView
	}()
	// вверх arrowshape.up.fill
	// вниз arrowshape.down.fill
	@objc private func segmentChanged() {
		MTUserDefaults.shared.theme = Theme(rawValue: segmentControl.selectedSegmentIndex) ?? .background
		view.window?.overrideUserInterfaceStyle = MTUserDefaults.shared.theme.getUserInterfaceStyle()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = Settings.Strings.NavBar.speed
		navigationController?.tabBarItem.title = Settings.Strings.TabBar.title(for: .overview)
		setupView()
		setConstraints()
    }
	
	private func setupView() {
		
		view.backgroundColor = UIColor(named: "backgroundColor")
		view.addSubview(segmentControl)
		view.addSubview(customTextField)
		view.addSubview(downloadView)
		view.addSubview(recoilView)
		downloadView.addSubview(downloadSpeedLabel)
		downloadView.addSubview(textDownloadSpeedLabel)
		downloadView.addSubview(upImageView)
		recoilView.addSubview(recoilSpeedLabel)
		recoilView.addSubview(textRecoilSpeedLabel)
		recoilView.addSubview(downImageView)
		
		segmentControl.selectedSegmentIndex = MTUserDefaults.shared.theme.rawValue
	}
	
	func setConstraints() {
		
		NSLayoutConstraint.activate([
		
			segmentControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			segmentControl.heightAnchor.constraint(equalToConstant: 40),
			
			customTextField.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 20),
			customTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			customTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			customTextField.heightAnchor.constraint(equalToConstant: 40),
			
			
			downloadView.topAnchor.constraint(equalTo: customTextField.bottomAnchor, constant: 30),
			downloadView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			downloadView.heightAnchor.constraint(equalToConstant: 90),
			downloadView.widthAnchor.constraint(equalToConstant: 180),
			
			recoilView.topAnchor.constraint(equalTo: customTextField.bottomAnchor, constant: 30),
			recoilView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			recoilView.heightAnchor.constraint(equalToConstant: 90),
			recoilView.widthAnchor.constraint(equalToConstant: 180)
			
		])
	}
}
