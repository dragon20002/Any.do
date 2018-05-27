//
//  MonthView.swift
//  Any.do
//
//  Created by haruu on 2018. 5. 27..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

protocol MonthViewDelegate: class {
    func didChangeMonth(year: Int, month: Int)
}

class MonthView: UIView {
    let lblYearMonth: UILabel = {
        let lbl = UILabel()
        lbl.text = "Year Month"
        lbl.textColor = Style.monthViewLblColor
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let btnLeft: UIButton = {
        let btn = UIButton()
        btn.setTitle("<", for: .normal)
        btn.setTitleColor(Style.monthViewBtnColor, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(changeMonth(sender:)), for: .touchUpInside)
        return btn
    }()
    let btnRight: UIButton = {
        let btn = UIButton()
        btn.setTitle(">", for: .normal)
        btn.setTitleColor(Style.monthViewBtnColor, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(changeMonth(sender:)), for: .touchUpInside)
        return btn
    }()
    
    var currentMonth = 0
    var currentYear = 0
    var delegate: MonthViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        currentMonth = Calendar.current.component(.month, from: Date())
        currentYear = Calendar.current.component(.year, from: Date())
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func changeMonth(sender: UIButton) {
        if sender == btnLeft {
            currentMonth -= 1
            if currentMonth < 1 {
                currentMonth = 12
                currentYear -= 1
            }
        }
        else {
            currentMonth += 1
            if currentMonth > 12 {
                currentMonth = 1
                currentYear += 1
            }
        }
        lblYearMonth.text = "\(currentYear)년 \(currentMonth)월"
        delegate?.didChangeMonth(year: currentYear, month: currentMonth)
    }
    
    func setupViews() {
        self.addSubview(lblYearMonth)
        lblYearMonth.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lblYearMonth.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lblYearMonth.widthAnchor.constraint(equalToConstant: 150).isActive = true
        lblYearMonth.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        lblYearMonth.text = "\(currentYear)년 \(currentMonth)월"
        
        self.addSubview(btnLeft)
        btnLeft.topAnchor.constraint(equalTo: topAnchor).isActive = true
        btnLeft.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        btnLeft.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btnLeft.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    
        self.addSubview(btnRight)
        btnRight.topAnchor.constraint(equalTo: topAnchor).isActive = true
        btnRight.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        btnRight.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btnRight.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
