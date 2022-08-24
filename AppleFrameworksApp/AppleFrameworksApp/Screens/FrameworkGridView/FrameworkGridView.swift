//
//  FrameworkGridView.swift
//  AppleFrameworksApp
//
//  Created by Pedro Boga on 22/08/22.
//

import SwiftUI

struct FrameworkGridView: View {
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView {
            //            ScrollView {
            //                LazyVGrid(columns: columns) {
            //                    ForEach(MockData.frameworks) { framework in
            //                        FrameworkTitleView(framework: framework)
            //                            .onTapGesture {
            //                                viewModel.selectedFramework = framework
            //                            }
            //                    }
            //                }
            //            }
            List {
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(destination: DetailView(framework: framework, isShowingDetailView: $viewModel.isShowingDetailView)) {       FrameworkTitleView(framework: framework)
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Apple Frameworks")
//            .sheet(isPresented: $viewModel.isShowingDetailView) {
//                DetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView)
//            }
        }
        .accentColor(Color(.label))
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}
