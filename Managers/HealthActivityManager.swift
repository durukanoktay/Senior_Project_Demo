//
//  HealthActivityManager.swift
//  Demo
//
//  Created by Durukan Oktay on 26.12.2023.
//

import SwiftUI

struct HealthActivityManager: View {
    
    @State private var selectedHealth: Health?
    
    
    var body: some View {
        
           Section(header: Text("Değerleri Değiştir:")) {
               Picker("Aktivite Seç", selection: $selectedHealth) {
                   ForEach(Health.allCases, id: \.self) { health in
                       Text(health.description).tag(health)
                   }
               }.pickerStyle(WheelPickerStyle())
               
               Button("Sağlık bilgisini Değiştir") {

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
    HealthActivityManager()
}
