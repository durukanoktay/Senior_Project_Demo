//
//  UserSettings.swift
//  Demo
//
//  Created by Durukan Oktay on 26.12.2023.
//

import SwiftUI

struct UserSettings {
    var height: Float
    var weight: Int
    var profileImage: Image
    var description: String
    var age: Int
}

struct UserSettingsView: View {
    @State private var userSettings = UserSettings(
        height: 0.0,
        weight: 0,
        profileImage: Image(systemName: "person"),
        description: "",
        age: 0
    )
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profil Ayarları")) {
                    HStack {
                        Text("Boy:")
                        Spacer()
                        TextField("Boy", value: $userSettings.height, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                            .frame(width: 100)
                    }

                    HStack {
                        Text("Kilo:")
                        Spacer()
                        TextField("Kilo", value: $userSettings.weight, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .frame(width: 100)
                    }
                    
                    HStack {
                        Text("Yaş:")
                        Spacer()
                        TextField("Yaş", value: $userSettings.age, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .frame(width: 100)
                    }
                }

                Section(header: Text("Profil Bilgileri")) {
                    HStack {
                        Text("Profil Fotoğrafı:")
                        Spacer()
                      /* ImagePicker(image: $userSettings.profileImage)
                        .frame(width: 100, height: 100) */
                    }

                    HStack {
                        Text("Açıklama:")
                        Spacer()
                        TextField("Açıklama", text: $userSettings.description)
                            .multilineTextAlignment(.trailing)
                    }
                }

                Section {
                    Button(action: {
                        // Çıkış yapma işlemleri burada gerçekleştirilebilir
                    }) {
                        Text("Çıkış Yap")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitle("Kullanıcı Ayarları", displayMode: .inline)
        }
    }
}
struct ImagePicker: View {
    @Binding var image: Image?
    @State private var isImagePickerPresented: Bool = false

    var body: some View {
        VStack {
            if let selectedImage = image {
                selectedImage
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        isImagePickerPresented.toggle()
                    }
            } else {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        isImagePickerPresented.toggle()
                    }
            }
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePickerView(image: $image)
        }
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var image: Image?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var image: Image?

        init(image: Binding<Image?>) {
            _image = image
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                image = Image(uiImage: uiImage)
            }

            picker.dismiss(animated: true, completion: nil)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        // Do nothing
    }
}

#Preview {
    UserSettingsView()
}
