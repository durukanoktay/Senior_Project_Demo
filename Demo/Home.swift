//
//  Home.swift
//  Demo
//
//  Created by Durukan Oktay on 16.12.2023.
//
import SwiftUI

struct Home: View {
    @State private var selectedActivity: SportActivity?
    @State private var activities: [SportActivityData] = [
        SportActivityData(activityType: SportActivity.fitness, duration: "30 dk", icon: "dumbbell"),
        SportActivityData(activityType: SportActivity.walking, duration: "1 saat", icon: "figure.walk"),
        SportActivityData(activityType: SportActivity.swimming, duration: "3 gün", icon: "figure.pool.swim")
    ]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Aktiviteler")) {
                    ForEach(activities) { activity in
                        NavigationLink(destination: Text(activity.duration)) {
                            HStack {
                                Image(systemName: activity.icon)
                                    .font(.headline)
                                    .foregroundColor(.red)
                                VStack(alignment: .leading) {
                                    Text(activity.activityType.rawValue)
                                        .font(.headline)
                                    Text(activity.duration)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .padding(8)
                        }
                    }
                }

                Section(header: Text("Aktivite Ekle")) {
                    Picker("Aktivite Seç", selection: $selectedActivity) {
                        ForEach(SportActivity.allCases, id: \.self) { activity in
                            Text(activity.description).tag(activity)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())

                    Button("Aktivite Ekle") {
                        if let selectedActivity = selectedActivity {
                            activities.append(SportActivityData(activityType: selectedActivity, duration: "Yeni Aktivite", icon: "plus"))
                        }
                    }
                }
            }
            .navigationTitle("Activities")
        }
    }
}


#Preview {
    Home()
}
