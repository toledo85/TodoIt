//
//  ConfigurationView.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/18/23.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack {
            BackgroundView()
           
            Text("© Jorge Luis Toledo")
                .font(.largeTitle.weight(.light))
        }
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
