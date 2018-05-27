//
//  CalendarView.swift
//  Any.do
//
//  Created by haruu on 2018. 5. 27..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

struct Colors {
    static var darkGray = UIColor.darkGray
    static var red = UIColor.red
}

struct Style {
    static var bgColor = UIColor.white
    static var monthViewLblColor = UIColor.black
    static var monthViewBtnColor = UIColor.black
    static var activeCellLblColor = UIColor.black
    static var activeCellLblColorHighlighted = UIColor.white
    static var weekdayLblColor = UIColor.black
    
    static func themeDark() {
        bgColor = Colors.darkGray
        monthViewLblColor = UIColor.white
        monthViewBtnColor = UIColor.white
        activeCellLblColor = UIColor.white
        activeCellLblColorHighlighted = UIColor.black
        weekdayLblColor = UIColor.white
    }
    
    static func themeLight() {
        bgColor = UIColor.white
        monthViewLblColor = UIColor.black
        monthViewBtnColor = UIColor.black
        activeCellLblColor = UIColor.black
        activeCellLblColorHighlighted = UIColor.white
        weekdayLblColor = UIColor.black
    }
}

class CalendarView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MonthViewDelegate {
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let v = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        v.showsHorizontalScrollIndicator = false
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.clear
        v.allowsMultipleSelection = false
        
        return v
    }()
    let monthView: MonthView = {
        let v = MonthView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let weekdayView: WeekdayView = {
        let v = WeekdayView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var numOfDaysInMonth = [ 31, 28, 31, 30, 31, 31, 31, 31, 30, 31, 30, 31 ]
    var currentYear = 0
    var currentMonth = 0
    var todayYear = 0
    var todayMonth = 0
    var todayDate = 0
    var firstWeekDayOfMonth = 0 // 1-7 일-월
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        initializeView()
    }
    
    convenience init(theme: Theme) {
        self.init()
        
        if theme == .dark {
            Style.themeDark()
        } else {
            Style.themeLight()
        }
    
        initializeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeTheme() {
        collectionView.reloadData()
        
        monthView.lblYearMonth.textColor = Style.monthViewLblColor
        monthView.btnLeft.setTitleColor(Style.monthViewBtnColor, for: .normal)
        monthView.btnRight.setTitleColor(Style.monthViewBtnColor, for: .normal)
        let weekdaySubviews = weekdayView.stackView.subviews
        for i in 0 ..< 7 {
            (weekdaySubviews[i] as! UILabel).textColor = Style.weekdayLblColor
        }
    }
    
    func initializeView() {
        currentYear = Calendar.current.component(.year, from: Date())
        currentMonth = Calendar.current.component(.month, from: Date())
        todayDate = Calendar.current.component(.day, from: Date())
        firstWeekDayOfMonth = getFirstWeekday()
        
        todayYear = currentYear
        todayMonth = currentMonth
    
        setupViews()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(dateCVCell.self, forCellWithReuseIdentifier: "cell")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfDaysInMonth[currentMonth - 1] + firstWeekDayOfMonth - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! dateCVCell
        cell.backgroundColor = UIColor.clear
        if indexPath.item <= firstWeekDayOfMonth - 2 {
            cell.isHidden = true
        } else {
            let calcDate = indexPath.row - firstWeekDayOfMonth + 2
            cell.isHidden = false
            cell.lbl.text = "\(calcDate)"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = Colors.red
        let lbl = cell?.subviews[1] as! UILabel
        lbl.textColor = UIColor.white
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.clear
        let lbl = cell?.subviews[1] as! UILabel
        lbl.textColor = Style.activeCellLblColor
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 7 - 8
        let height: CGFloat = 40
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func getFirstWeekday() -> Int {
        let day = ("\(currentYear)-\(currentMonth)-01".date?.firstDayOfTheMonth.weekday)!
        return day == 7 ? 1 : day
    }
    
    func didChangeMonth(year: Int, month: Int) {
        currentYear = year
        currentMonth = month
        firstWeekDayOfMonth = getFirstWeekday()
        
        collectionView.reloadData()
    }
    
    func setupViews() {
        addSubview(monthView)
        monthView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        monthView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        monthView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        monthView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        monthView.delegate = self
        
        addSubview(weekdayView)
        weekdayView.topAnchor.constraint(equalTo: monthView.bottomAnchor).isActive = true
        weekdayView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        weekdayView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        weekdayView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: weekdayView.bottomAnchor, constant: 0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
     }
    */
}

class dateCVCell: UICollectionViewCell {
    let lbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "00"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textColor = Colors.darkGray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        layer.cornerRadius = 5
        layer.masksToBounds = true
    
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(lbl)
        lbl.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lbl.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        lbl.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        lbl.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

}

extension Date {
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    var firstDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
    }
}

extension String {
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    var date: Date? {
        return String.dateFormatter.date(from: self)
    }
}
