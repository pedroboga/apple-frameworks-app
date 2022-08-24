//
//  FrameworkTitleView.swift
//  AppleFrameworksApp
//
//  Created by Pedro Boga on 22/08/22.
//

import SwiftUI

struct FrameworkTitleView: View {
    let framework: Framework
    var gridSize: CGFloat = 90
    var listSize: CGFloat = 70
    var body: some View {
        //VStack
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: listSize, height: listSize)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
                .padding()
        }
        //.padding()
    }
}

struct FrameworkTitleView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkTitleView(framework: MockData.sampleFramework)
    }
}
