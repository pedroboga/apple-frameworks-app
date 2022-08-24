//
//  FrameworkTitleView.swift
//  AppleFrameworksApp
//
//  Created by Pedro Boga on 22/08/22.
//

import SwiftUI

struct FrameworkTitleView: View {
    @ObservedObject var viewModel = FrameworkGridViewModel()
    let framework: Framework
    @Binding var isGrid: Bool
    var gridSize: CGFloat = 90
    var listSize: CGFloat = 70
    var body: some View {
        if isGrid {
            VStack {
                Image(framework.imageName)
                    .resizable()
                    .frame(width: gridSize, height: gridSize)
                Text(framework.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
            }
            .transition(.slide)
            .padding()
        } else {
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
            .transition(.move(edge: .bottom))
        }
    }
}

struct FrameworkTitleView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkTitleView(framework: MockData.sampleFramework, isGrid: .constant(true))
    }
}
