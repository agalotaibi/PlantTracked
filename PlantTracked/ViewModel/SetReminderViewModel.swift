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
    @Published var isChecked: Bool = false
    @Published var plantReminder: [PlantReminder] = [] // Initialize array
    
    // Predefined data
    let rooms = ["Bedroom", "Kitchen", "Living Room", "Dining Room", "Office", "Balcony", "Bathroom"]
    let wateringDays = ["Every day", "Every 3 days", "Every 10 days", "Once a week", "Twice a week", "Once a month"]
    let waterAmounts = ["20-50 ml", "50-100 ml", "100-200 ml", "200-500 ml"]
    let lightLevels = ["Full sun", "Partial sun", "Partial shade", "Full shade"]

    // Function to create and save a PlantReminder
    func saveReminder() {
   
        let newReminder = PlantReminder(
            name: plantName,
            room: rooms[roomIndex],
            wateringDays: wateringDays[wateringDayIndex],
            water: waterAmounts[waterIndex],
            light: lightLevels[lightIndex],
            isChecked: isChecked
            
        )
        plantReminder.append(newReminder) // Save reminder to array
        

        
    }
    
    func toggleCheckmark(at index: Int) {
           plantReminder[index].isChecked.toggle() // Toggle the isChecked property
        
        if plantReminder[index].isChecked {
                   let checkedItem = plantReminder.remove(at: index) // Remove from current position
                   plantReminder.append(checkedItem) // Add it to the end of the list
               }
       }
    
    func lightImage(for lightLevel: String) -> String {
        switch lightLevel {
        case "Full sun":
            return "sun.max" // Use your desired system or custom image here
        case "Partial sun":
            return "sun.min"
        case "Partial shade":
            return "cloud.sun"
        case "Full shade":
            return "cloud"
        default:
            return "sun.haze"
        }
    }
}
