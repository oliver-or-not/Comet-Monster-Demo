//
//  AppDelegate.swift
//  Comet Monster Demo
//
//  Created by Wonil Lee on 2022/11/21.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		IQKeyboardManager.shared.enable = true
		IQKeyboardManager.shared.enableAutoToolbar = false
		
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}

	// MARK: - Core Data stack

	lazy var persistentContainer: NSPersistentContainer = {
	    /*
	     The persistent container for the application. This implementation
	     creates and returns a container, having loaded the store for the
	     application to it. This property is optional since there are legitimate
	     error conditions that could cause the creation of the store to fail.
	    */
	    let container = NSPersistentContainer(name: "Comet_Monster_Demo")
	    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
	        if let error = error as NSError? {
	            // Replace this implementation with code to handle the error appropriately.
	            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	             
	            /*
	             Typical reasons for an error here include:
	             * The parent directory does not exist, cannot be created, or disallows writing.
	             * The persistent store is not accessible, due to permissions or data protection when the device is locked.
	             * The device is out of space.
	             * The store could not be migrated to the current model version.
	             Check the error message to determine what the actual problem was.
	             */
	            fatalError("Unresolved error \(error), \(error.userInfo)")
	        }
	    })
	    return container
	}()

	// MARK: - Core Data Saving support

	func saveContext () {
	    let context = persistentContainer.viewContext
	    if context.hasChanges {
	        do {
	            try context.save()
	        } catch {
	            // Replace this implementation with code to handle the error appropriately.
	            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	            let nserror = error as NSError
	            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
	        }
	    }
	}

}


//MARK: - Pulling Down Keyboard
extension UIViewController: UITextFieldDelegate {
	open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
	}
	
	public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
}

//MARK: - Saving Monster Data
extension UIViewController {
	static var myMonster = Monster()
	
	static let monsterFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("MonsterFile.plist")
	
	func loadData() {
		do {
			let data = try Data(contentsOf: UIViewController.monsterFilePath!)
			let decoder = PropertyListDecoder()
			UIViewController.myMonster = try decoder.decode(Monster.self, from: data)
		} catch {
			print("Error while decoding, \(error)")
		}
	}
	
	func saveData() {
			let encoder = PropertyListEncoder()

			do {
				let data = try encoder.encode(UIViewController.myMonster)
				try data.write(to: UIViewController.monsterFilePath!)
			} catch {
					print("Error while encoding, \(error)")
			}
	}
	
	
}

//MARK: - Image Array

extension UIViewController {
	static let monsterImageArray = [[#imageLiteral(resourceName: "000 plain egg r1"), #imageLiteral(resourceName: "000 plain egg r2"), #imageLiteral(resourceName: "000 plain egg l1"), #imageLiteral(resourceName: "000 plain egg l2")], [#imageLiteral(resourceName: "001 dinodino r1"), #imageLiteral(resourceName: "001 dinodino r2"), #imageLiteral(resourceName: "001 dinodino l1"), #imageLiteral(resourceName: "001 dinodino l2")], [#imageLiteral(resourceName: "002 dinorigo r1"), #imageLiteral(resourceName: "002 dinorigo r2"), #imageLiteral(resourceName: "002 dinorigo l1"), #imageLiteral(resourceName: "002 dinorigo l2")]]
	static let evolutionEffectArray = [#imageLiteral(resourceName: "effect evolution 1"), #imageLiteral(resourceName: "effect evolution 2"), #imageLiteral(resourceName: "effect evolution 3"), #imageLiteral(resourceName: "effect evolution 4")]
}

//MARK: - Using Hexadecimal Expressions in UIColor
extension UIColor {
	 convenience init(red: Int, green: Int, blue: Int) {
			 assert(red >= 0 && red <= 255, "Invalid red component")
			 assert(green >= 0 && green <= 255, "Invalid green component")
			 assert(blue >= 0 && blue <= 255, "Invalid blue component")

			 self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
	 }

	 convenience init(rgb: Int) {
			 self.init(
					 red: (rgb >> 16) & 0xFF,
					 green: (rgb >> 8) & 0xFF,
					 blue: rgb & 0xFF
			 )
	 }
}


//MARK: - naming -> evolution -> main dismissing

extension UIViewController {
	static var letsGoToMain = false
}
