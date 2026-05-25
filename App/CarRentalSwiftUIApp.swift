//
//  CarRentalSwiftUIApp.swift
//  CarRentalSwiftUI
//
//  Created by Michael Saakyan on 22.05.2026.
//

import SwiftUI

@main
struct CarRentalSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                Auth()
            }
        }
    }
}
