//
//  profile .swift
//  Demo
//
//  Created by Durukan Oktay on 16.12.2023.
//
import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("") // Burada kendi resminizi eklemeyi unutmayın
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 150.0)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.purple, lineWidth: 5)
                    )
                Text("Name")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.black)
                Text("Personal info")
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                VStack {
                    RoundedRectangle(cornerRadius: 10.0)
                        .padding(.all, 10.0)
                        .frame(height: 60.0)
                        .foregroundColor(.cyan)
                        .overlay(Text("Weight:"))
                    RoundedRectangle(cornerRadius: 10.0)
                        .padding(.all, 10.0)
                        .frame(height: 60.0)
                        .foregroundColor(.cyan)
                        .overlay(Text("Height:"))
                    RoundedRectangle(cornerRadius: 10.0)
                        .padding(.all, 10.0)
                        .frame(height: 60.0)
                        .foregroundColor(.cyan)
                        .overlay(Text("BMI:"))
                    
                    NavigationLink(destination: UserSettingsView()) {
                        Image(systemName: "gearshape")
                    }.padding()
                }
            }
        }
    }
}

// Image(systemName: "gearshape")
#Preview {
    Profile()
}
