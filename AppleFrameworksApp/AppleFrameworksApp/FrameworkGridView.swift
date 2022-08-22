//
//  FrameworkGridView.swift
//  AppleFrameworksApp
//
//  Created by Pedro Boga on 22/08/22.
//

import SwiftUI

struct FrameworkGridView: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            FrameworkTitleView(image: "app-clip", text: "App Clips")
        }
        
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}


struct FrameworkTitleView: View {
    var image: String
    var text: String
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 90, height: 90)
            Text(text)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
    }
}


