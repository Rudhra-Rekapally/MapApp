import SwiftUI
import MapKit

// Define some coffee shop coordinates
extension CLLocationCoordinate2D {
    static let starbucks = CLLocationCoordinate2D(latitude: 51.5072, longitude: -0.1276)
    static let costa = CLLocationCoordinate2D(latitude: 51.5094, longitude: -0.1294)
    static let blueBottle = CLLocationCoordinate2D(latitude: 51.5110, longitude: -0.1332)
    static let dunkinDonuts = CLLocationCoordinate2D(latitude: 51.5142, longitude: -0.1370)
    static let peets = CLLocationCoordinate2D(latitude: 51.5160, longitude: -0.1401)
}

struct CoffeeShopMapView: View {
    // Define the initial camera position
    @State private var position: MapCameraPosition = .region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.5116, longitude: -0.1352),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    ))

    var body: some View {
        // Create the map view
        Map(position: $position) {
            // Add markers for each coffee shop
            Marker("Starbucks", coordinate: .starbucks)
                .tint(.green)
            Marker("Costa", coordinate: .costa)
                .tint(.red)
            Marker("Blue Bottle", coordinate: .blueBottle)
                .tint(.blue)
            Marker("Dunkin' Donuts", coordinate: .dunkinDonuts)
                .tint(.orange)
            Marker("Peet's", coordinate: .peets)
                .tint(.brown)
        }
        // Add a toolbar button to reset the map position
        .toolbar {
            ToolbarItem {
                Button("Reset") {
                    position = .region(MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 51.5116, longitude: -0.1352),
                        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                    ))
                }
            }
        }
    }
}

struct CoffeeShopMapView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopMapView()
    }
}
