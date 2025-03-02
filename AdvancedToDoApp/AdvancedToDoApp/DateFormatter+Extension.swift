//
//  DateFormatter+Extension.swift
//  AdvancedToDoApp
//
//  Created by Tej Patel on 2025-02-14.
//


import Foundation

extension DateFormatter {
    static var taskDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
}
