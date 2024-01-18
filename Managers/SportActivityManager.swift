//
//  SportActivityManager.swift
//  Demo
//
//  Created by Durukan Oktay on 26.12.2023.
//

import SwiftUI

struct SportActivityManager: View {
    @State private var selectedActivity: SportActivity?
    @State private var enteredDuration: String = "" // geçici olarak süreyi tutmak için
    var body: some View {
        
        
        
           Section(header: Text("Aktivite Ekle:")) {
               Picker("Aktivite Seç", selection: $selectedActivity) {
                   ForEach(SportActivity.allCases, id: \.self) { activity in
                       Text(activity.description).tag(activity)
                   }
               }
               .pickerStyle(WheelPickerStyle())

/*
               Button("Aktivite Ekle") {
                   if let selectedActivity = selectedActivity {
                       activities.append(SportActivityData(activityType: selectedActivity, duration: "Yeni Aktivite", icon: "plus"))
                   }
               }
 
*/
               
               TextField("dakika", text: $enteredDuration)
                   .padding()

               Button("Aktivite Ekle") {

               }.font(.headline)
                   .foregroundColor(.white)
                   .padding()
                   .frame(maxWidth: .infinity)
                   .background(Color.blue)
                   .cornerRadius(10)
               
           }.padding(20)
        
        
    }
}

#Preview {
    SportActivityManager()
}
