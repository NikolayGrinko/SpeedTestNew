//
//  SessionController.swift
//  SpeedTestNew
//
//  Created by Николай Гринько on 11.04.2024.
//

import UIKit

final class SessionController: WABaseController {
	private let timerView = TimerView()
	private let statsView = StatsView(with: Settings.Strings.Session.workoutStats)
	private let stepsView = StepsView(with: Settings.Strings.Session.stepsCounter)

	private let timerDuration = 40.0

	override func navBarLeftButtonHandler() {
		if timerView.state == .isStopped {
			timerView.startTimer()
		} else {
			timerView.pauseTimer()
		}

		timerView.state = timerView.state == .isRuning ? .isStopped : .isRuning
		addNavBarButton(
			at: .left,
			with: timerView.state == .isRuning
				? Settings.Strings.Session.navBarPause : Settings.Strings.Session.navBarStart
		)
	}

	override func navBarRightButtonHandler() {
		timerView.stopTimer()
		timerView.state = .isStopped

		addNavBarButton(at: .left, with: Settings.Strings.Session.navBarStart)
	}
}

extension SessionController {
	override func setupViews() {
		super.setupViews()

		view.setupView(timerView)
		view.setupView(statsView)
		view.setupView(stepsView)
	}

	override func constraintViews() {
		super.constraintViews()

		NSLayoutConstraint.activate([
			timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
			timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
			timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),

			statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
			statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
			statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),

			stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
			stepsView.topAnchor.constraint(equalTo: statsView.topAnchor),
			stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
			stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor),
		])
	}

	override func configureAppearance() {
		super.configureAppearance()

		title = Settings.Strings.NavBar.session
		navigationController?.tabBarItem.title = Settings.Strings.TabBar.title(for: .session)

		addNavBarButton(at: .left, with: Settings.Strings.Session.navBarStart)
		addNavBarButton(at: .right, with: Settings.Strings.Session.navBarFinish)

		timerView.configure(with: timerDuration, progress: 0)
		timerView.callBack = { [weak self] in
			self?.navBarRightButtonHandler()
		}

		statsView.configure(with: [.heartRate(value: "28.8"),
								   .averagePace(value: "04.3'"),
								   .totalDistance(value: "29.8"),
								   .totalSteps(value: "12.7"),])

		stepsView.configure(with: [.init(value: "28", heightMultiplier: 1, title: "2.04"),
								   .init(value: "25", heightMultiplier: 0.8, title: "3.04"),
								   .init(value: "27", heightMultiplier: 0.9, title: "11/04"),
								   .init(value: "23", heightMultiplier: 0.7, title: "15.04")])
	}
}
