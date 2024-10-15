//
//  SetReminderVM.swift
//  PlantTracked
//
//  Created by Amaal on 11/04/1446 AH.
//

import SwiftUI

class SetReminderViewModel: ObservableObject {
    // Published properties for binding
    @Published var plantName: String = ""
    @Published var roomIndex: Int = 0
    @Published var wateringDayIndex: Int = 0
    @Published var waterIndex: Int = 0
    @Published var lightIndex: Int = 0

    // Predefined data
    let rooms = ["Bedroom", "Kitchen", "Living Room", "Dining Room", "Office", "Balcony", "Bathroom"]
    let wateringDays = ["Every day", "Every 3 days", "Every 10 days", "Once a week", "Twice a week", "Once a month"]
    let waterAmounts = ["20-50 ml", "50-100 ml", "100-200 ml", "200-500 ml"]
    let lightLevels = ["Full sun", "Partial sun", "Partial shade", "Full shade"]

    // Function to create a PlantReminder
    func saveReminder() -> PlantReminder {
        return PlantReminder(
            name: plantName,
            room: rooms[roomIndex],
            wateringDays: wateringDays[wateringDayIndex],
            water: waterAmounts[waterIndex],
            light: lightLevels[lightIndex]
        )
    }
}
