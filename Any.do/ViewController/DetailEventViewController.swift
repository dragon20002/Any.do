//
//  DetailEventViewController.swift
//  Any.do
//
//  Created by haruu on 2018. 6. 12..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

protocol DetailEventDelegate {
    func deleteEvent(id: Int)
}

class DetailEventViewController: UIViewController {
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblStart: UILabel!
    @IBOutlet weak var lblEnd: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblAlarm: UILabel!
    @IBOutlet weak var lblMemo: UILabel!
    var event: Event?
    var delegate: DetailEventDelegate?
    
    // init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeTheme()
        
        lblName.text = event?.name
        lblStart.text = String.dateToString(date: (event?.start)!)
        lblEnd.text = String.dateToString(date: (event?.end)!)
        lblLocation.text = event?.location
        lblAlarm.text = String.dateToString(date: (event?.alarm)!)
        lblMemo.text = event?.memo
    }
    
    func changeTheme() {
        view.backgroundColor = Style.bgColor
        btnBack.setImage(Style.backImage, for: .normal)
        lblName.backgroundColor = Style.lblBgColor
        lblName.textColor = Style.lblTxtColor
        lblStart.backgroundColor = Style.lblBgColor
        lblStart.textColor = Style.lblTxtColor
        lblEnd.backgroundColor = Style.lblBgColor
        lblEnd.textColor = Style.lblTxtColor
        lblLocation.backgroundColor = Style.lblBgColor
        lblLocation.textColor = Style.lblTxtColor
        lblAlarm.backgroundColor = Style.lblBgColor
        lblAlarm.textColor = Style.lblTxtColor
        lblMemo.backgroundColor = Style.lblBgColor
        lblMemo.textColor = Style.lblTxtColor
    }
    
    @IBAction func backToMain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func deleteEvent(_ sender: UIButton) {
        delegate?.deleteEvent(id: (event?.id)!)
        dismiss(animated: true, completion: nil)
    }

}
