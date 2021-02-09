//
//  Time.swift
//  Clock13
//
//  Created by Richard on 9/2/2021.
//

import Foundation
let s = a()
func a() -> String {
    let date = Date()
    var calendar = Calendar.current

    if let timeZone = TimeZone(identifier: "EST") {
       calendar.timeZone = timeZone
    }

    let hour = calendar.component(.hour, from: date)
    let minute = calendar.component(.minute, from: date)
    let second = calendar.component(.second, from: date)

    print("\(hour):\(minute):\(second)")
    return ""
}
