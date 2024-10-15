//
//  EmptyState.swift
//  PlantTracked
//
//  Created by Amaal on 03/04/1446 AH.
//

import SwiftUI

struct EmptyState: View {
    @State private var showingSheet = false

    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing:40){
                Image("emptyState")
                Text("Start your plant journey!")
                    .font(.title)
                Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                    .font(.footnote).frame(width: 300).foregroundStyle(.gray)
                
                Button ("set reminder"){
                    showingSheet.toggle()
                }.frame(width: 300, height: 50).foregroundColor(.black).background(Color("greenish")).cornerRadius(10).sheet(isPresented: $showingSheet) {
                    SetReminder()
                }
                
             
            }.padding().navigationTitle("My Plants 🌱")
        }
    }
}

#Preview {
    EmptyState()
}
