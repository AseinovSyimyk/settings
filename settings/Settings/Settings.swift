//
//  Settings.swift
//  settings
//
//  Created by User on 11/12/23.
//

// Settings.swift
import Foundation

enum SettingType {
    case none
    case configure
}

struct Settings {
    var title: String
    var type: SettingType
}
