//
//  SecondViewController.swift
//  Any.do
//
//  Created by haruu on 2018. 5. 27..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,
        AddEventDelegate, DetailEventDelegate {
    
    // fields
    let calendarView: CalendarView = {
        let v = CalendarView(theme: Theme.Blue)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    @IBOutlet weak var calendarViewFrame: UIView!
    @IBOutlet weak var eventTableView: EventTableView!
    @IBOutlet weak var btnAdd: UIButton!

    // init
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarViewFrame.addSubview(calendarView)
        calendarView.topAnchor.constraint(equalTo: calendarViewFrame.topAnchor, constant: 0).isActive = true
        calendarView.leftAnchor.constraint(equalTo: calendarViewFrame.leftAnchor, constant: 0).isActive = true
        calendarView.rightAnchor.constraint(equalTo: calendarViewFrame.rightAnchor, constant: 0).isActive = true
        calendarView.bottomAnchor.constraint(equalTo: calendarViewFrame.bottomAnchor, constant: 0).isActive = true
        
        eventTableView.delegate = self
        eventTableView.dataSource = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calendarView.dateView.collectionViewLayout.invalidateLayout()
    }
    
    func changeTheme() {
        view.backgroundColor = AppTheme.bgColor
        calendarView.changeTheme()
        eventTableView.changeTheme()
        btnAdd.setImage(AppTheme.btnAddImage, for: .normal)
    }
    
    /* UITableViewDelegate */
    @available(iOS 2.0, *)
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let indexPath = eventTableView.indexPathsForVisibleRows?.first {
            let event = eventTableView.eventList[indexPath.row]
            calendarView.setDate(date: event.start)
        }
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailEvent", sender: self)
    }
    
    /* UITableViewDataSource */
    // must have
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventTableView.eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventCell = eventTableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventCell
        eventCell.event = eventTableView.eventList[indexPath.row]
        eventCell.changeTheme()
        return eventCell
    }

    /* 현재화면 >> 추가/상세 화면 */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let id = segue.identifier

        if id == "addEvent" {
            let addEventViewController = segue.destination as! AddEventViewController
            addEventViewController.delegate = self
        } else if id == "detailEvent" {
            let detailEventViewController = segue.destination as! DetailEventViewController
            let cell = eventTableView.cellForRow(at: eventTableView.indexPathForSelectedRow!) as! EventCell
            detailEventViewController.event = cell.event
            detailEventViewController.delegate = self
        }
    }
    
    /* 현재화면 << 추가/상세 화면 */
    func addEventAndUpdateTableView(_ event: Event) {
        eventTableView.eventList.append(event)
        eventTableView.saveEventList()
        eventTableView.reloadData()
    }
    
    func deleteEvent(id: Int) {
        _ = eventTableView.deleteEvent(id: id)
    }

}
