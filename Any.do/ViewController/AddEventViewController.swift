//
//  AddEventViewController.swift
//  Any.do
//
//  Created by haruu on 2018. 6. 12..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

protocol AddEventDelegate {
    func addEventAndUpdateTableView(_ event: Event)
}

class AddEventViewController: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var dateStart: UIDatePicker!
    @IBOutlet weak var dateEnd: UIDatePicker!
    @IBOutlet weak var tfLocation: UITextField!
    @IBOutlet weak var alarmTime: UIDatePicker!
    @IBOutlet weak var tfMemo: UITextField!
    var delegate: AddEventDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backToMain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addEvent(_ sender: UIButton) {
        var name = tfName.text!
        if name == "" {
            name = "제목없는 이벤트"
        }
        let start = dateStart.date
        let end = dateEnd.date
        let location = tfLocation.text!
        let alarm = alarmTime.date
        let memo = tfMemo.text!

        if delegate != nil {
            delegate?.addEventAndUpdateTableView(Event(name: name, start: start, end: end, location: location, alarm: alarm, memo: memo))
            dismiss(animated: true, completion: nil)
        }
    }

}
