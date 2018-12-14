//
//  ViewController.swift
//  PartageMoi
//
//  Created by Luc Derosne on 14/12/2018.
//  Copyright © 2018 Luc Derosne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shareTextView: UITextView!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func SendButton(_ sender: Any) {
        let TextToSend:String = shareTextView.text
        if TextToSend.count > 0 {
            let ShareViewController = UIActivityViewController(activityItems: [TextToSend], applicationActivities: nil)
            present(ShareViewController,animated: true, completion: nil)
            errorLabel.text = ""
        } else {
           errorLabel.text = " saisir un peu de texte "
        }
        
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
