//
//  PlantReminderModel.swift
//  PlantTracked
//
//  Created by Amaal on 11/04/1446 AH.
//

import Foundation
import SwiftUI

struct PlantReminder: Identifiable {
    let id = UUID() // Each reminder needs a unique ID for SwiftUI lists
    var name: String
    var room: String
    var wateringDays: String
    var water: String
    var light: String
    var isChecked: Bool



}

