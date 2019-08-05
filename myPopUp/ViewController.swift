//
//  ViewController.swift
//  myPopUp
//
//  Created by Egor Devyatov on 05.08.2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func showPopUPButtonTap(_ sender: UIButton) {
//       1.  Мы получаем ссылку на PopUpViewController, причем получаем ссылку мы при помощи метода, который обращается к StoryBoard и находит контроллер, у которого идентификатор popUpVCid.
//       2. Добавляем полученный контроллер PopUpViewController в качестве дочернего к ViewController.
//       3. Размеры View нового контроллера мы устанавливаем равными размера View текущего контроллера.
//       4. Непосредственно выводим на экран то,  как отображается PopUpViewController. Т.е. добавляем View PopUpViewController в стек той кучи View, которые уже есть.
//       5. Вызываем метод делегата, чтобы сообщить всем делегатам, о том, что контроллер мы отобразили.
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpVCid") as! PopUpViewController // 1
        
        self.addChild(popUpVC) // 2
        popUpVC.view.frame = self.view.frame  // 3
        self.view.addSubview(popUpVC.view) // 4
        
        popUpVC.didMove(toParent: self) // 5
        popUpVC.alertActivate(popUpVC.loremIpsum, UIColor.black)
    }
    
}

