//
//  CustomTabBar.swift
//  SpeedTestNew
//
//  Created by Николай Гринько on 11.04.2024.
//

import UIKit


final class CustomTabBar: UITabBar {
	
	private let plusButton = PlusButton(type: .system)
	private let plusVC = SecondViewController()
	override func draw(_ rect: CGRect) {
		configureShape()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupTabBar()
		setupPlusButton()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupTabBar() {
		
		tintColor = .blue
		unselectedItemTintColor = .black
	}
	private func setupPlusButton() {
		addSubview(plusButton)
		plusButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
			plusButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			plusButton.centerYAnchor.constraint(equalTo: topAnchor),
			plusButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
			plusButton.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
			
		])
	}
	
	@objc func tapButton() {
		print("Tap Button PLUS")
		
	}
	
	
	
	//MARK: Hit test
	override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
		plusButton.frame.contains(point) ? plusButton : super.hitTest(point, with: event)
	}
	
}
//MARK: Draw Shape
extension CustomTabBar {
	
	private func configureShape() {
		
		let path = getTabBarPath()
		let shape = CAShapeLayer()
		shape.path = path.cgPath
		shape.lineWidth = 3
		shape.strokeColor = UIColor.white.cgColor
		shape.fillColor = UIColor.white.cgColor
		layer.insertSublayer(shape, at: 0)
	}
	
	//MARK: прорисовка линий окружности
	private func getTabBarPath() -> UIBezierPath {
		
		let path = UIBezierPath()
		// line left
		path.move(to: CGPoint(x: 0, y: 0))
		path.addLine(to: CGPoint(x: 100, y: 0))
		
		// line circle
		path.addArc(withCenter: CGPoint(x: frame.width / 2, y: 0),
					radius: 30,
					startAngle: .pi,
					endAngle: .pi * 2,
					clockwise: false)
		// line right
		path.addLine(to: CGPoint(x: frame.width, y: 0))
		
		// line bottom
		path.addLine(to: CGPoint(x: frame.width, y: frame.height))
		path.addLine(to: CGPoint(x: 0, y: frame.height))
		
		// отрисовка кривой линии
		//path.addCurve(to: <#T##CGPoint#>, controlPoint1: <#T##CGPoint#>, controlPoint2: <#T##CGPoint#>)
		
		return path
	}
	
}

