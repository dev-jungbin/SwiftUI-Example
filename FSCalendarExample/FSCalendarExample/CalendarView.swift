//
//  CalendarView.swift
//  FSCalendarExample
//
//  Created by 1v1 on 2021/02/24.
//

import SwiftUI
import FSCalendar

class Calendar: UIViewController, FSCalendarDelegate{
    var calendar = FSCalendar()

    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.appearance.titleDefaultColor = .black
        calendar.appearance.titleWeekendColor = .black
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.weekdayTextColor = .black
        calendar.appearance.caseOptions = FSCalendarCaseOptions.weekdayUsesSingleUpperCase
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.backgroundColor = UIColor.white.withAlphaComponent(0)
//        calendar.appearance.eventDefaultColor = .gray
//        calendar.appearance.eventSelectionColor = .gray
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calendar.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: view.frame.size.width)
        view.addSubview(calendar)
    }
}

extension Calendar {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        calendar.scope = .week
    }
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        calendar.scope = .month
    }
}
//    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//        return UIImage(contentsOfFile: "Daily_calendarHeader")
//    }
//
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
//        if self.datesWithEvent.contains(date) {
//            calendar.reloadData()
//            return [UIColor.magenta, appearance.eventDefaultColor, UIColor.black]
//        }
//        calendar.reloadData()
//
//        return [appearance.eventDefaultColor]
//    }
//    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        // 아래 그날의 글들 보여주기
//        noDataLabel.alpha = 0
//        self.getContentsListForDaily(date: date)
//
//
//    }
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        if events.contains(date){
//            return 1
//        }
//        else {
//            return 0
//        }
//
//
//    }
//
////MARK: loadDateForCalendar()
//    func loadDateForCalendar() {
//
//        let calendar = Calendar.current
//        currentContentData.musicTitle = ""
//        DispatchQueue.global().sync {
//            self.db.collection("Diary").document("\(daily_currentDiaryID)").collection("Contents").whereField("authorID", isEqualTo: "\(currentotherUserID)").getDocuments() { (querySnapshot, err) in
//                        if let err = err {
//                            print("Error getting documents: \(err)")
//                        } else {
//                            DispatchQueue.global().sync {
//                                events = []
//                                for document in querySnapshot!.documents {
//                                    let getContent = document.data()
//                                    events.append(calendar.startOfDay(for: Date(timeIntervalSince1970: TimeInterval((getContent["date"] as! Timestamp).seconds))))
//                                }
//                                self.calendar.reloadData()
//
//                            }
//
//                        }
//
//                    }
//        }
//
//    }

struct CalendarView: View {
    var body: some View {
        VStack{
            
            CalendarController()
            Button(action: {
                
            }, label: {
                Text("close")
            })
            
        }
        
        
    }
}

struct CalendarController: UIViewControllerRepresentable {

    func makeUIViewController(context: UIViewControllerRepresentableContext<CalendarController>) -> Calendar {
        return Calendar()
    }

    func updateUIViewController(_ uiViewController: Calendar, context: UIViewControllerRepresentableContext<CalendarController>) {
    }

}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
