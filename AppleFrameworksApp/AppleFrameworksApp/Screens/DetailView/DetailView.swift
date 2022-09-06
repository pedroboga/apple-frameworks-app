//
//  DetailView.swift
//  AppleFrameworksApp
//
//  Created by Pedro Boga on 22/08/22.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    @Binding var isGrid: Bool
    var body: some View {
        VStack {
            if isGrid {
                XDismissButton(isShowingDetailView: $viewModel.isShowingDetailView.wrappedValue)
            }
            Spacer()
            FrameworkTitleView(framework: viewModel.framework, isGrid: $isGrid)
            Text(viewModel.framework.description)
                .font(.body)
                .padding()
            Spacer()
            Link(destination: URL(string: viewModel.framework.urlString) ?? URL(string: "")!) {
                DetailButton(title: "Learn More")
            }
//            Button {
//                withAnimation {
//                    isShowingSafariView = true
//                }
//            } label: {
//                DetailButton(title: "Learn More")
//            }
        }
        //.fullScreenCover(isPresented: $isShowingSafariView) {
//            SafariView(url: URL(string: viewModel.framework.urlString) ?? URL(string: "")!)
        //}
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(framework: MockData.sampleFramework, isShowingDetailView: .constant(false)), isGrid: .constant(true))
    }
}
