//
//  AppleFrameworksAppApp.swift
//  AppleFrameworksApp
//
//  Created by Pedro Boga on 22/08/22.
//

import SwiftUI

@main
struct AppleFrameworksAppApp: App {
    var body: some Scene {
        WindowGroup {
            FrameworkGridView(isGrid: .constant(true))
        }
    }
}
