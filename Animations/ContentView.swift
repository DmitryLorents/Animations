//
//  ContentView.swift
//  Animations
//
//  Created by lorenc_D_K on 04.02.2025.
//

import SwiftUI

struct CornerRotateModofoer: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModofoer(amount: -90, anchor: .topLeading),
                  identity: CornerRotateModofoer(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
   
    @State private var isShowingRed = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
