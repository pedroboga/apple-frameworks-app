//
//  DetailView.swift
//  AppleFrameworksApp
//
//  Created by Pedro Boga on 22/08/22.
//

import SwiftUI

struct DetailView: View {
    let framework: Framework
    @Binding var isShowingDetailView: Bool
    @Binding var isGrid: Bool
    @State private var isShowingSafariView = false
    var body: some View {
        VStack {
            if isGrid {
                XDismissButton(isShowingDetailView: $isShowingDetailView)
            }
            Spacer()
            FrameworkTitleView(framework: framework, isGrid: $isGrid)
            Text(framework.description)
                .font(.body)
                .padding()
            Spacer()
            Button {
                withAnimation {
                    isShowingSafariView = true
                }
            } label: {
                DetailButton(title: "Learn More")
            }
        }
        .fullScreenCover(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "")!)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false), isGrid: .constant(true))
    }
}
