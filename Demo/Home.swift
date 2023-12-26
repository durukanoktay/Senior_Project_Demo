//
//  Home.swift
//  Demo
//
//  Created by Durukan Oktay on 16.12.2023.
//
import SwiftUI

struct Home: View {
 
    
    @State private var healthinfos: [HealthData] = [
        HealthData(value: "32 dk", icon: "exclamationmark.arrow.circlepath", healthtype: Health.screen),
        HealthData(value: "4221", icon: "figure.step.training", healthtype: Health.steps),
        HealthData(value: "64", icon: "bolt.heart.fill", healthtype: Health.nabiz)
                                                    ]
    
    @State private var activities: [SportActivityData] = [
        SportActivityData(activityType: SportActivity.fitness, duration: "30 dk", icon: "dumbbell"),
        SportActivityData(activityType: SportActivity.walking, duration: "1 saat", icon: "figure.walk"),
        SportActivityData(activityType: SportActivity.swimming, duration: "3 gün", icon: "figure.pool.swim")
                                                        ]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Sağlık bilgileri")) {
                    ForEach(healthinfos) { health in
                        NavigationLink(destination: HealthActivityManager()) {
                            HStack {
                                Image(systemName: health.icon)
                                    .font(.headline)
                                    .foregroundColor(.red)
                                VStack(alignment: .leading) {
                                    Text(health.healthtype.rawValue)
                                        .font(.headline)
                                    Text(health.value)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .padding(8)
                        }
                    }
                }
                
                Section(header: Text("Aktiviteler")) {
                    ForEach(activities) { activity in
                        NavigationLink(destination: SportActivityManager()) {
                            HStack {
                                Image(systemName: activity.icon)
                                    .font(.headline)
                                    .foregroundColor(.blue)
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


            }
            .navigationTitle("Home")
        }
    }
}


#Preview {
    Home()
}
