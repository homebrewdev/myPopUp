//
//  PopUpViewController.swift
//  myPopUp
//
//  Created by Egor Devyatov on 05.08.2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var messageView: UIView!
    
    @IBOutlet weak var alertTextView: UITextView!
    
    let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageView.layer.cornerRadius = 24 // зададим радиус скругления
        self.view.backgroundColor = UIColor.gray.withAlphaComponent(0.75) // затеняем главый вью контроллера
        // анимашка появления/открытия алерта
        moveIn()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // по нажатию на кнопку закрыть
    @IBAction func closePopUPButtonTap(_ sender: UIButton) {
        //self.view.removeFromSuperview()
        // выкидываем наш попап контрол с контроллера с анимацией
        moveOut()
    }
    
    // функция передачи тела сообщения в наш алерт
    func alertActivate(_ message: String, _ color: UIColor) {
        alertTextView.text = message
        alertTextView.textColor = color
    }
    
    // анимашка для открытия алерта
    func moveIn() {
        self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
        self.view.alpha = 0.0
        
        UIView.animate(withDuration: 0.24) {
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.view.alpha = 1.0
        }
    }
    // анимашка для закрытия алерта
    func moveOut() {
        UIView.animate(withDuration: 0.24, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
            self.view.alpha = 0.0
        }) { _ in
            // выкидываем наш попап контрол с контроллера
            self.view.removeFromSuperview()
        }
    }
}
