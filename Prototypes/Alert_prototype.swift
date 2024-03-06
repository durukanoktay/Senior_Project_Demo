//
//  Alert_prototype.swift
//  Demo
//
//  Created by Durukan Oktay on 28.02.2024.
//
import SwiftUI

struct Alert_prototype: View {
    @State private var inputText: String = ""
    @State private var showAlert: Bool = false

    var body: some View {
        VStack {
            TextField("Metin girin", text: $inputText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                self.checkText()
            }) {
                Text("Kontrol Et")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding()

        .alert(isPresented: $showAlert) {
            Alert(title: Text("Password Issue"), message: Text("Password need to consist of upper case and"), dismissButton: .default(Text("Tamam")))
        }
    }

    func checkText() {
        let uppercaseLetters = CharacterSet.uppercaseLetters
        let specialCharacters = CharacterSet.symbols.union(CharacterSet.punctuationCharacters)

        if inputText.rangeOfCharacter(from: uppercaseLetters) != nil || inputText.rangeOfCharacter(from: specialCharacters) != nil {
            showAlert = true
        }
    }
}

#Preview {
    Alert_prototype()
}
