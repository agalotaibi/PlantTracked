//
//  MainPage.swift
//  PlantTracked
//
//  Created by Amaal on 03/04/1446 AH.
//

import SwiftUI

struct MainPage: View {
    @State private var reminders: [PlantReminder] = []
    @State private var showingSheet = false
    var body: some View {
        
//        if reminders.isEmpty {
//            EmptyState()
//        }
//        else if reminders.count == 0 {
            
        
        
        NavigationStack {
            VStack(alignment: .leading){
                Text("Toady")
                    .font(.title2)
                    .fontWeight(.bold)
                
                List{
                    ForEach(reminders){ reminder in
                        Text(reminder.name)
                    }
                }
            }
            .padding()
            .navigationTitle("My Plants 🌱")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar)  {
                    
                    
                        HStack{
                            Image(systemName: "plus.circle.fill")
                            Text("New Reminder")
                            
                        }.foregroundStyle(.accent).padding().onTapGesture {
                            showingSheet.toggle()
                        }.sheet(isPresented: $showingSheet) {
                            SetReminder()
                        }
                        Spacer()
                        
                    
                }
            }
        }
        
   // }
//        else{
//            FinishIsEmpty()
//        }
}
}

#Preview {
    
    MainPage()
}
