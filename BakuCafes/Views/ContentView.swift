import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    
    @StateObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.4093, longitude: 49.8674),
        span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.0009)
    )
    @State private var userLocation: CLLocation? = nil
    var cafes: [Cafe]

    var body: some View {
        NavigationView {
            VStack {
                Map(coordinateRegion: $region, annotationItems: cafes) { cafe in
                    MapAnnotation(coordinate: cafe.location) {
                        VStack(spacing: 10) {
                            Text(cafe.name)
                                .padding(10)
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(.white)
                                .background(Color.red)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            if let cafeURL = cafe.website {
                                NavigationLink(
                                    destination: WebView(url: cafeURL)
                                ) {
                                    Text("Website")
                                        .padding(8)
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundColor(.white)
                                        .background(Color.black)
                                        .cornerRadius(8)
                                        .shadow(radius: 5)
                                }
                            }
                            if let userLocation = userLocation {
                                Text("Distance: \(distanceToCafe(cafe.location, from: userLocation)) meters")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                            }
                        }
                        .frame(width: 120, height: 100)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(12)
                        .shadow(radius: 10)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    if let firstCafe = cafes.first {
                        region.center = firstCafe.location
                    }
                }
                List(cafes) { cafe in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(cafe.name)
                                .font(.headline)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "mappin.circle.fill")
                                .foregroundColor(.red)
                            Text(cafe.address)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        // Conditional NavigationLink based on cafe's website
                        if let websiteURL = cafe.website {
                            NavigationLink(
                                destination: WebView(url: websiteURL)
                            ) {
                                HStack {
                                    Text("Show On the Map")
                                    Image(systemName: "globe")
                                }
                                .onTapGesture {
                                    region.center = cafe.location
                                }
                                .padding(8)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            }
                        }
                        else {
                            HStack {
                                Text("Show On the Map")
                                Image(systemName: "globe")
                            }
                            .onTapGesture {
                                region.center = cafe.location
                            }
                            .padding(8)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)

                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                }
            
                    
                }
            }
        
        .onReceive(locationManager.$location, perform: { newLocation in
            guard let location = newLocation else { return }
         // for showing location of user  region.center = location.coordinate
            userLocation = location
        })
    }

    func distanceToCafe(_ cafeLocation: CLLocationCoordinate2D, from userLocation: CLLocation) -> CLLocationDistance {
        let cafeCLLocation = CLLocation(latitude: cafeLocation.latitude, longitude: cafeLocation.longitude)
        return userLocation.distance(from: cafeCLLocation)
    }
}



struct ContentView: View {
    var body: some View {
        MapView(cafes: cafes)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
