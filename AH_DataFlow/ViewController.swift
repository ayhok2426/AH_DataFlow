//  ViewController.swift
//  AH_DataFlow
//
//  Created by tjoa ay hok on 16/05/19.
//  Copyright © 2019 ayhok2426. All rights reserved.

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var nameTxt: UITextField!
	@IBOutlet weak var phoneTxt: UITextField!
	@IBAction func registerBtn(_ sender: UIButton) {
		if nameTxt.text == "" || phoneTxt.text == "" {
			let alert = UIAlertController(title: "Error", message: "All TextField must be filled!", preferredStyle: .alert)
			let action = UIAlertAction(title: "Go Back", style: .default) { (alertAction) in
				alert.dismiss(animated: true, completion: nil)
			}
			alert.addAction(action)
			present(alert, animated: true, completion: nil)
		} else {
			performSegue(withIdentifier: "toConfirmPage", sender: self)
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		nameTxt.delegate = self
		phoneTxt.delegate = self
	}
}

extension ViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if textField == nameTxt {
			phoneTxt.becomeFirstResponder()
		} else if textField == phoneTxt {
			textField.resignFirstResponder()
		}
		return true
	}
}

