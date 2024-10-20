//
//  PlantTrackedApp.swift
//  PlantTracked
//
//  Created by Amaal on 03/04/1446 AH.
//

import SwiftUI

@main
struct PlantTrackedApp: App {
    @StateObject var vm = SetReminderViewModel()

    var body: some Scene {
        WindowGroup {
            MainPage()
                .environmentObject(vm)
        }
    }
}
