//
//  CalendarView.swift
//  Any.do
//
//  Created by haruu on 2018. 5. 27..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

class DateCell: UICollectionViewCell {
    let btn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = Style.bgColor
        btn.isUserInteractionEnabled = false
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let lbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "00"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textColor = Style.lblTxtColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Style.bgColor
        layer.masksToBounds = true
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError() //never use nib
    }
    
    func setupViews() {
        addSubview(btn)
        btn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        btn.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(lbl)
        lbl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lbl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}

class CalendarView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var numOfDaysInMonth = [ 31, 28, 31, 30, 31, 31, 31, 31, 30, 31, 30, 31 ]
    var currentYear = 0
    var currentMonth = 0
    var todayYear = 0
    var todayMonth = 0
    var todayDate = 0
    var firstWeekDayOfMonth = 0 // 1-7 일-월
    
    let btnYearMonth: UIButton = {
        let btn = UIButton()
        btn.setTitle("Year Month", for: .normal)
        btn.backgroundColor = Style.btnBgColor
        btn.setTitleColor(Style.btnTxtColor, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let weekdayView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = Style.bgColor
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        var days = [ "일", "월", "화", "수", "목", "금", "토" ]
        for i in 0 ..< 7 {
            let lbl = UILabel()
            lbl.text = days[i]
            lbl.backgroundColor = Style.lblBgColor
            lbl.textColor = Style.lblTxtColor
            lbl.textAlignment = .center
            stackView.addArrangedSubview(lbl)
        }
        return stackView
    }()
    
    let dateView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let v = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        v.showsHorizontalScrollIndicator = false
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = Style.bgColor
        v.allowsMultipleSelection = false
        return v
    }()
    
    // override init(frame: CGRect >> convenience init(theme: Theme) 순서로 호출
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(theme: Theme) {
        switch theme {
        case .Black:
            Style.themeBlack()
            break
        case .Blue:
            Style.themeBlue()
            break
        case .Green:
            Style.themeGreen()
            break
        case .Pink:
            Style.themePink()
            break
        case .Yellow:
            Style.themeYellow()
            break
        }

        // load variables, btnYearMonth, weekdayView, collectionView
        self.init()

        // init variables
        currentYear = Calendar.current.component(.year, from: Date())
        todayYear = currentYear
        currentMonth = Calendar.current.component(.month, from: Date())
        todayMonth = currentMonth
        todayDate = Calendar.current.component(.day, from: Date())
        firstWeekDayOfMonth = getFirstWeekday()
        
        // bound views on CalendarView
        setupViews()
        
        // setting views (delegate, gestures ...)
        dateView.delegate = self
        dateView.dataSource = self
        dateView.register(DateCell.self, forCellWithReuseIdentifier: "cell")
        
        let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(changeMonth))
        leftSwipeRecognizer.direction = .left
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(changeMonth))
        rightSwipeRecognizer.direction = .right
        dateView.gestureRecognizers = [ leftSwipeRecognizer, rightSwipeRecognizer ]
        dateView.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError() //do not call from nib
    }

    func setupViews() {
        addSubview(btnYearMonth)
        btnYearMonth.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        btnYearMonth.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        btnYearMonth.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        btnYearMonth.heightAnchor.constraint(equalToConstant: 35).isActive = true
        btnYearMonth.setTitle("\(currentYear)년 \(currentMonth)월", for: .normal)
        
        addSubview(weekdayView)
        weekdayView.topAnchor.constraint(equalTo: btnYearMonth.bottomAnchor).isActive = true
        weekdayView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        weekdayView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        weekdayView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(dateView)
        dateView.topAnchor.constraint(equalTo: weekdayView.bottomAnchor, constant: 0).isActive = true
        dateView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        dateView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        dateView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func changeTheme() {
        dateView.reloadData()
        
        btnYearMonth.backgroundColor = Style.btnBgColor
        btnYearMonth.setTitleColor(Style.btnTxtColor, for: .normal)
        let subviews = weekdayView.subviews
        for i in 0 ..< 7 {
            (subviews[i] as! UILabel).textColor = Style.lblTxtColor
        }
    }
    
    @objc func changeMonth(recognizer: UISwipeGestureRecognizer) {
        if recognizer.direction == .right {
            currentMonth -= 1
            if currentMonth < 1 {
                currentMonth = 12
                currentYear -= 1
            }
        } else {
            currentMonth += 1
            if currentMonth > 12 {
                currentMonth = 1
                currentYear += 1
            }
        }
        btnYearMonth.setTitle("\(currentYear)년 \(currentMonth)월", for: .normal)
        firstWeekDayOfMonth = getFirstWeekday()
        if let indexPaths = dateView.indexPathsForSelectedItems {
            if indexPaths.count > 0 {
                collectionView(dateView, didDeselectItemAt: indexPaths[0])
            }
        }
        dateView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var day = numOfDaysInMonth[currentMonth - 1] + firstWeekDayOfMonth - 1
        if currentMonth == 2 {
            if (currentYear % 4 == 0 && currentYear % 100 != 0) || (currentYear % 400 == 0) {
                day += 1
            }
        }
        return day
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DateCell
        cell.backgroundColor = Style.lblBgColor
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
        let btn = cell?.subviews[1] as! UIButton
        btn.setBackgroundImage(Style.cellAccentBgImage, for: .normal)
        let lbl = cell?.subviews[2] as! UILabel
        lbl.textColor = Style.cellAccentTxtColor
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let btn = cell?.subviews[1] as! UIButton
        btn.setBackgroundImage(nil, for: .normal)
        let lbl = cell?.subviews[2] as! UILabel
        lbl.textColor = Style.lblTxtColor
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
