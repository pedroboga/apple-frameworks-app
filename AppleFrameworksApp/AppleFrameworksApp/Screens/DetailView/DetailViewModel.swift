//
//  DetailViewModel.swift
//  AppleFrameworksApp
//
//  Created by Pedro Boga on 05/09/22.
//

import SwiftUI

final class DetailViewModel: ObservableObject {
    let framework: Framework
    var isShowingDetailView: Binding<Bool>
    
    init(framework: Framework, isShowingDetailView: Binding<Bool>) {
        self.framework = framework
        self.isShowingDetailView = isShowingDetailView
    }
}
