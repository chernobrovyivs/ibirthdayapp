//
//  Created by Valeriy Chernobrovyi on 28/07/2019.
//  Copyright © 2019 Valeriy Chernobrovyi. All rights reserved.
//

import UIKit
import CoreData

class AddBirthdayViewController: UIViewController {
    
    // Это свойства для сопоставления текстовых полей со значениями
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var birthdatePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        birthdatePicker.maximumDate = Date()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem){
        print("Нажата кнопка сохранения!")
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let birthdate = birthdatePicker.date
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newBirthday = Birthday(context: context)
        newBirthday.firstName = firstName
        newBirthday.lastName = lastName
        newBirthday.birthdate = birthdate as Date?
        newBirthday.birthdayId = UUID().uuidString
        
        if let uniqueId = newBirthday.birthdayId {
            print("birthdayId: \(uniqueId)")
        }
        
        do {
            try context.save()
        } catch let error {
            print("Не удалось сохранить из-за ошибки \(error).")
        }
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem){
        dismiss(animated: true, completion: nil)
        print("Окно представления закрыто!")
    }

}
