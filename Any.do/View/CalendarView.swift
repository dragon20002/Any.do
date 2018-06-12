//
//  CalendarView.swift
//  Any.do
//
//  Created by haruu on 2018. 5. 27..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

class DateCell: UICollectionViewCell {
    // fields
    let btn: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(Style.cellAccentBgImage, for: .normal)
        btn.isUserInteractionEnabled = false
        btn.isHidden = true
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
    
    // init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Style.bgColor
        layer.masksToBounds = true
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError() //storyboard에 바인딩 불가
    }
    
    func setupViews() {
        addSubview(btn)
        btn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        btn.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(lbl)
        lbl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lbl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func changeTheme() {
        btn.setBackgroundImage(Style.cellAccentBgImage, for: .normal)
        lbl.textColor = Style.lblTxtColor
    }
    
    func select() {
        btn.isHidden = false
        lbl.textColor = Style.cellAccentTxtColor
    }
    
    func deselect() {
        btn.isHidden = true
        lbl.textColor = Style.lblTxtColor
    }
    
}

class CalendarView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // fields
    // ...data
    var numOfDaysInMonth = [ 31, 28, 31, 30, 31, 31, 31, 31, 30, 31, 30, 31 ]
    var currentYear = 0
    var currentMonth = 0
    var todayYear = 0
    var todayMonth = 0
    var todayDate = 0
    var firstWeekDayOfMonth = 0 // 1-7 일-월
    var dateCellIndexPaths = [IndexPath]()

    // ...view
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
    
    // init
    // 호출 순서: override init(frame: CGRect >> convenience init(theme: Theme)
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(theme: Theme) {
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
        fatalError() //storyboard에 바인딩 불가
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
        deselectAllDateCell()
        
        backgroundColor = Style.bgColor
        btnYearMonth.backgroundColor = Style.btnBgColor
        btnYearMonth.setTitleColor(Style.btnTxtColor, for: .normal)
        let subviews = weekdayView.subviews
        for i in 0 ..< 7 {
            let lbl = subviews[i] as! UILabel
            lbl.backgroundColor = Style.lblBgColor
            lbl.textColor = Style.lblTxtColor
        }
        dateView.backgroundColor = Style.bgColor
        dateView.visibleCells.forEach { cell in
            let c = cell as! DateCell
            c.changeTheme()
        }
        dateView.reloadData()
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
        deselectAllDateCell()
        reloadCalendar()
    }
    
    func reloadCalendar() {
        btnYearMonth.setTitle("\(currentYear)년 \(currentMonth)월", for: .normal)
        firstWeekDayOfMonth = getFirstWeekday()
        dateCellIndexPaths.removeAll()
        dateView.reloadData()
    }
    
    func getFirstWeekday() -> Int {
        let day = ("\(currentYear)-\(currentMonth)-01".date?.firstDayOfTheMonth.weekday)!
        return day == 7 ? 1 : day
    }
    
    func deselectAllDateCell() {
        if let indexPaths = dateView.indexPathsForSelectedItems {
            indexPaths.forEach { indexPath in
                dateView.deselectItem(at: indexPath, animated: true)
                collectionView(dateView, didDeselectItemAt: indexPath)
            }
        }
    }

    func setDate(date: Date) {
        deselectAllDateCell()

        let year = Calendar.current.component(.year, from: date)
        let month = Calendar.current.component(.month, from: date)
        if currentYear != year || currentMonth != month {
            currentYear = year
            currentMonth = month
            reloadCalendar()
        }
        
        let day = Calendar.current.component(.day, from: date)
        if dateCellIndexPaths.count > day - 1 {
            let dayIndexPath = dateCellIndexPaths[day - 1]
            dateView.selectItem(at: dayIndexPath, animated: true, scrollPosition: .centeredVertically)
            collectionView(dateView, didSelectItemAt: dayIndexPath)
        }
    }
    
    /* CollectionView Delegate */
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? DateCell {
            cell.select()
        }
        
        // TODO scroll event table view
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? DateCell {
            cell.deselect()
        }
    }
    
    /* CollectionView DataSource */
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var day = numOfDaysInMonth[currentMonth - 1] + firstWeekDayOfMonth - 1
        if currentMonth == 2 {
            if (currentYear % 4 == 0 && currentYear % 100 != 0) || (currentYear % 400 == 0) {
                day += 1
            }
        }
        return day
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DateCell
        cell.backgroundColor = Style.lblBgColor
        if indexPath.item <= firstWeekDayOfMonth - 2 {
            cell.isHidden = true
        } else {
            let calcDate = indexPath.row - firstWeekDayOfMonth + 2
            cell.isHidden = false
            cell.lbl.text = "\(calcDate)"
            dateCellIndexPaths.append(indexPath)
        }
        return cell
    }
    
    /* CollectionView Delegate FlowLayout */
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 7 - 8
        let height: CGFloat = 40
        return CGSize(width: width, height: height)
    }

    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }

    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
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
    
    static func dateToString(date: Date) -> String {
        let year = Calendar.current.component(.year, from: date)
        let month = Calendar.current.component(.month, from: date)
        let day = Calendar.current.component(.day, from: date)
        let hour = Calendar.current.component(.hour, from: date)
        let min = Calendar.current.component(.minute, from: date)
        
        return "\(year)년 \(month)월 \(day)일 \(hour)시 \(min)분"
    }
    
    static func datetimeToString(date: Date) -> String {
        let hour = Calendar.current.component(.hour, from: date)
        let min = Calendar.current.component(.minute, from: date)
        
        return "\(hour)시 \(min)분"
    }
}
