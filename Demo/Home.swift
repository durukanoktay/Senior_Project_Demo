//
//  Home.swift
//  Demo
//
//  Created by Durukan Oktay on 16.12.2023.
//

import SwiftUI

enum PlaceCategory: String {
    case restaurant = "Restoran"
    case cafe = "Cafe"
    case gym = "Spor Salonu"
    case mall = "AVM"
    case park = "Park"
    case library = "Kütüphane"
}

enum SportActivity: String, CaseIterable {
    case walking = "Yürüyüş"
    case running = "Koşu"
    case swimming = "Yüzme"
    case fitness = "Fitness"
    case yoga = "Yoga"
}

struct HealthData: Identifiable {
    var id = UUID()
    var dataType: String
    var value: String
    var symbolName: String
}

struct SportActivityData: Identifiable {
    var id = UUID()
    var activityType: SportActivity
    var duration: String
}

struct Home: View {
    @State private var healthData: [HealthData] = []
    @State private var sportActivities: [SportActivityData] = []
    @State private var height: Double = 170
    @State private var weight: Double = 70
    @State private var isEditingHeight = false
    @State private var isEditingWeight = false
    @State private var newHeightString = ""
    @State private var newWeightString = ""
    @State private var selectedActivity: SportActivity = .walking
    @State private var newActivityDuration = ""

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Sağlık Verileri")) {
                    ForEach(healthData) { data in
                        HStack {
                            Image(systemName: data.symbolName)
                                .foregroundColor(.blue)
                            Text("\(data.dataType): \(data.value)")
                        }
                    }
                    HStack {
                        Image(systemName: "arrow.up.and.down.circle.fill")
                            .foregroundColor(.blue)
                        Text("Boy: \(String(format: "%.0f", height)) cm")
                            .onTapGesture {
                                isEditingHeight.toggle()
                            }
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                            .onSubmit {
                                if let newHeight = Double(newHeightString) {
                                    height = newHeight
                                }
                                isEditingHeight = false
                                newHeightString = ""
                            }
                            .frame(width: 100)
                    }
                    HStack {
                        Image(systemName: "scalemass.fill")
                            .foregroundColor(.blue)
                        Text("Kilo: \(String(format: "%.0f", weight)) kg")
                            .onTapGesture {
                                isEditingWeight.toggle()
                            }
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                            .onSubmit {
                                if let newWeight = Double(newWeightString) {
                                    weight = newWeight
                                }
                                isEditingWeight = false
                                newWeightString = ""
                            }
                            .frame(width: 100)
                    }
                    HStack {
                        Image(systemName: "heart.circle.fill")
                            .foregroundColor(.blue)
                        Text("BMI İndeksi: \(calculateBMI())")
                    }
                }

                Section(header: Text("Son Zamanlarda Yapılan Spor Aktiviteleri")) {
                    ForEach(sportActivities) { activity in
                        HStack {
                            Image(systemName: "flame.fill")
                                .foregroundColor(.orange)
                            VStack(alignment: .leading) {
                                Text(activity.activityType.rawValue)
                                Text("Süre: \(activity.duration)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                        Picker("Aktivite", selection: $selectedActivity) {
                            ForEach(SportActivity.allCases, id: \.self) { activity in
                                Text(activity.rawValue)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(width: 150)
                        TextField("Süre", text: $newActivityDuration)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                        Button("Aktivite Ekle") {
                            if !newActivityDuration.isEmpty {
                                sportActivities.append(SportActivityData(activityType: selectedActivity, duration: newActivityDuration))
                                newActivityDuration = ""
                            }
                        }
                    }
                }
            }
            .onAppear {
                healthData = fetchHealthData()
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Ana Sayfa")
        }
    }

    private func fetchHealthData() -> [HealthData] {
        return [
            HealthData(dataType: "Kalp Atış Hızı", value: "75", symbolName: "heart.fill"),
            HealthData(dataType: "Adım Sayısı", value: "5000", symbolName: "figure.walk.circle"),
        ]
    }

    private func calculateBMI() -> String {
        let heightInMeters = height / 100
        let bmi = weight / (heightInMeters * heightInMeters)
        return String(format: "%.2f", bmi)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


#Preview {
    Home()
}
