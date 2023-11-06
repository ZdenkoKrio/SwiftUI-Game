//
//  RealView.swift
//  Slot Machine
//
//  Created by Zdenko Čepan on 06.11.2023.
//

import SwiftUI

struct RealView: View {
    var body: some View {
        Image("gfx-reel")
            .resizable()
            .modifier(ImageModifier())
    }
}

#Preview {
    RealView()
}
