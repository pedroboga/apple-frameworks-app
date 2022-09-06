//
//  FrameworkGridView.swift
//  AppleFrameworksApp
//
//  Created by Pedro Boga on 22/08/22.
//

import SwiftUI

struct FrameworkGridView: View {
    @StateObject var viewModel = FrameworkGridViewModel()
    @Binding var isGrid: Bool
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isGrid {
                    ScrollView {
                        LazyVGrid(columns: viewModel.columns) {
                            ForEach(MockData.frameworks) { framework in
                                FrameworkTitleView(framework: framework, isGrid: $viewModel.isGrid)
                                    .onTapGesture {
                                        viewModel.selectedFramework = framework
                                    }
                            }
                        }
                    }
                    .sheet(isPresented: $viewModel.isShowingDetailView) {
                        DetailView(viewModel: DetailViewModel(framework: viewModel.selectedFramework!, isShowingDetailView: $viewModel.isShowingDetailView), isGrid: $viewModel.isGrid)
                    }
                } else {
                    List {
                        ForEach(MockData.frameworks) { framework in
                            NavigationLink(destination: DetailView(viewModel: DetailViewModel(framework: viewModel.selectedFramework!, isShowingDetailView: $viewModel.isShowingDetailView), isGrid: $viewModel.isGrid)) {
                                FrameworkTitleView(framework: framework, isGrid: $viewModel.isGrid)
                            }
                        }
                    }
                    .listStyle(.grouped)
                }
            }
            .navigationTitle("Apple Frameworks")
            .toolbar {
                Button {
                    viewModel.isGrid.toggle()
                } label: {
                    Image(systemName: viewModel.isGrid ? "list.dash" : "square.grid.2x2")
                }
                
            }
            .accentColor(Color(.label))
        }
        
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView(isGrid: .constant(true))
    }
}
