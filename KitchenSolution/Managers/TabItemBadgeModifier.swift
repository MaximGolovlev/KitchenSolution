//
//  TabItemBadgeModifier.swift
//  KitchenSolution
//
//  Created by Maxim Golovlev on 01.09.2025.
//

import SwiftUI

extension View {
    func tabItemWithBadge(_ count: Int, color: Color = .red) -> some View {
        modifier(TabItemBadgeModifier(count: count, color: color))
    }
}

struct TabItemBadgeModifier: ViewModifier {
    let count: Int
    let color: Color
    
    func body(content: Content) -> some View {
        ZStack(alignment: .topTrailing) {
            content
            
            if count > 0 {
                Text("\(count)")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.white)
                    .padding(4)
                    .background(color)
                    .clipShape(Circle())
                  //  .offset(x: 8, y: -8)
            }
        }
    }
}
