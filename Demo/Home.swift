//
//  Home.swift
//  Demo
//
//  Created by Durukan Oktay on 16.12.2023.
//
import SwiftUI

struct Home: View {
    
    var activities: [SportActivityData] =
    [
        SportActivityData(activityType: SportActivity.fitness, duration: "30 dk",icon: "dumbbell"),
        SportActivityData(activityType: SportActivity.walking, duration: "1 saat",icon: "figure.walk"),
        SportActivityData(activityType: SportActivity.swimming, duration: "3 gün",icon: "figure.pool.swim")
    ]
    
    
    var body: some View {
        NavigationView {
            List(activities) { activity in
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
            .navigationTitle("Activities")
        }
    }
        
}

#Preview {
    Home()
}
