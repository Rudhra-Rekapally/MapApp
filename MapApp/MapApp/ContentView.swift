//
//  ContentView.swift
//  MapApp
//
//  Created by ATLAS Checkout Laptop on 10/13/23.
//

import SwiftUI
import MapKit
import UserNotifications

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: CoffeeShopMapView()) {
                    Text("Show Nearby Coffee Shops")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                }
                Button("Enable Notifications"){
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound] ){ success, error in
                        if success{
                            print("Good to Go!")
                        }
                        else if let error = error{
                            print(error.localizedDescription)
                        }
                    }
                }
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                
                Button("Remind me to drink coffee in 5s") {
                    Notification(title: "Coffee Time", body: "Go Grab some coffee", timeinterval: 5)
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                Button("Remind me to drink coffee in 10s") {
                    Notification(title: "Coffee Time", body: "Go Grab some coffee", timeinterval: 10)
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
            }
        }
    }
    
    func Notification(title: String, body: String, timeinterval: TimeInterval) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeinterval, repeats: false)
        
        let request = UNNotificationRequest(identifier: "coffeeNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}
