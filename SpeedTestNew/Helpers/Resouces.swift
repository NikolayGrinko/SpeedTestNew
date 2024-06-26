//
//  Resouces.swift
//  SpeedTestNew
//
//  Created by Николай Гринько on 14.04.2024.
//

import UIKit

enum Settings {
	enum Colors {
		static let active = UIColor(hexString: "#437BFE")
		static let inactive = UIColor(hexString: "#929DA5")

		static let background = UIColor(hexString: "#F8F9F9")
		static let separator = UIColor(hexString: "#E8ECEF")
		static let secondary = UIColor(hexString: "#F0F3FF")

		static let titleGray = UIColor(hexString: "#545C77")
	}

	enum Strings {
		enum TabBar {
			static func title(for tab: Tabs) -> String {
				switch tab {
				case .overview: return "Test"
				case .session: return "Session"
				}
			}
		}

		enum NavBar {
			static let speed = "Two Speed Test"
			static let session = "Internet Speed Test"
			static let settings = "Settings"
		}

		enum Overview {
			static let allWorcoutsButton = "All Workouts"
		}

		enum Session {
			static let navBarStart = "Start"
			static let navBarPause = "Pause"
			static let navBarFinish = "Finish"

			static let elapsedTime = "Speed Test"
			static let remainingTime = "Remaining Time"
			static let completed = "Completed"
			static let remaining = "Remaining"

			static let workoutStats = "Stats speed"  //  top left
			static let averageSpeed = "Average speed" // 1 <
			static let averagePace = "Average time" // 2
			
			static let totalDistance = "Max speed" // 3   макс
			static let totalSteps = "Min speed"  // 4  мин
			static let stepsCounter = "Steps Counter" // top right
		}
	}

	enum Images {
		enum TabBar {
			static func icon(for tab: Tabs) -> UIImage? {
				switch tab {
				case .overview: return UIImage(named: "overview_tab")
				case .session: return UIImage(named: "session_tab")
				
				}
			}
		}

		enum Common {
			static let downArrow = UIImage(named: "down_arrow")
			static let add = UIImage(named: "add_button")
		}

		enum Session {
			enum Stats {
				static let heartRate = UIImage(named: "stats_averagePace")
				static let averagePace = UIImage(named: "clock")
				static let totalDistance = UIImage(named: "max")
				static let totalSteps = UIImage(named: "min")
				
			}
		}
	}

	enum Fonts {
		static func helvelticaRegular(with size: CGFloat) -> UIFont {
			UIFont(name: "Helvetica", size: size) ?? UIFont()
		}
	}
}
