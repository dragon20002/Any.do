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
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnSuccess: UIButton!
    
    @IBOutlet weak var lblForName: UILabel!
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var lblForDate: UILabel!
    @IBOutlet weak var dateStart: UIDatePicker!
    @IBOutlet weak var dateEnd: UIDatePicker!
    
    @IBOutlet weak var lblForLocation: UILabel!
    @IBOutlet weak var tfLocation: UITextField!

    @IBOutlet weak var lblForAlarm: UILabel!
    @IBOutlet weak var alarmTime: UIDatePicker!

    @IBOutlet weak var lblForMemo: UILabel!
    @IBOutlet weak var tfMemo: UITextField!
    
    var delegate: AddEventDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateEnd.setDate(dateEnd.date.addingTimeInterval(1800), animated: true)
        
        changeTheme()
    }
    
    func changeTheme() {
        view.backgroundColor = Style.bgColor
        btnBack.setImage(Style.backImage, for: .normal)
        btnSuccess.setImage(Style.successImage, for: .normal)
        btnBack.setImage(Style.backImage, for: .normal)
        btnSuccess.setImage(Style.successImage, for: .normal)
        lblForName.backgroundColor = Style.lblBgColor
        lblForName.textColor = Style.lblTxtColor
        lblForDate.backgroundColor = Style.lblBgColor
        lblForDate.textColor = Style.lblTxtColor
        lblForLocation.backgroundColor = Style.lblBgColor
        lblForLocation.textColor = Style.lblTxtColor
        lblForAlarm.backgroundColor = Style.lblBgColor
        lblForAlarm.textColor = Style.lblTxtColor
        lblForMemo.backgroundColor = Style.lblBgColor
        lblForMemo.textColor = Style.lblTxtColor
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

    @IBAction func changeEndDate(_ sender: UIDatePicker) {
        let start = sender.date
        let end = dateEnd.date
        
        if end.timeIntervalSince(start) < 1800 {
            let date = start.addingTimeInterval(1800)
            dateEnd.setDate(date, animated: true)
        }
    }
    
}
