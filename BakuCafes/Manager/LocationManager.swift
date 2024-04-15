//
//  LocationManager.swift
//  BakuCafes
//
//  Created by Shahid on 08.04.24.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    @Published var location: CLLocation?
    private var timer: Timer?

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func startTracking() {
        timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { [weak self] _ in
            self?.locationManager.startUpdatingLocation()
        }
    }

    func stopTracking() {
        timer?.invalidate()
        timer = nil
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.location = location
            print("User's current location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        }
    }
}
