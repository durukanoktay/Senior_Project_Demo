//
//  coreLocationTest.swift
//  Demo
//
//  Created by Durukan Oktay on 6.03.2024.
//
/*
import SwiftUI
import CoreLocation

struct CoreLocationTest: View {
    @State private var locationManager = CLLocationManager()
    @State private var userLocation: CLLocation?
    
    var body: some View {
        VStack {
            if let location = userLocation {
                Text("Latitude: \(location.coordinate.latitude), Longitude: \(location.coordinate.longitude)")
            } else {
                Text("Konum bilgisi alınamadı.")
            }
        }
        .onAppear {
            self.requestLocation()
        }
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
}

extension CoreLocationTest: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.userLocation = location
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}

#Preview {
    coreLocationTest()
}
*/
