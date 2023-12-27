//
//  SliderTest.swift
//  Demo
//
//  Created by Durukan Oktay on 27.12.2023.
//

import SwiftUI


struct SliderTest: View {
    @State private var userAgreement = false
    @State private var healthAgreement = false

    var body: some View {
        VStack {
            Toggle(isOn: $userAgreement) {
                Text("User Agreement")
                    .padding()
                    .onTapGesture {
                        userAgreement.toggle()
                    }
            }
            .padding()

            Toggle(isOn: $healthAgreement) {
                Text("Health Agreement")
                    .padding()
                    .onTapGesture {
                        healthAgreement.toggle()
                    }
            }
            .padding()

            Text("User Agreement Status: \(userAgreement.description)")
            Text("Health Agreement Status: \(healthAgreement.description)")
        }
        .padding()
    }
}

#Preview {
    SliderTest()
}
