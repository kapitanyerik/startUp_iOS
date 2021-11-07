//
//  RemoveItemButton.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 11. 07..
//

import SwiftUI

struct RemoveItemButton: View {
    @Environment(\.editMode) var editMode
    
    let onDelete: (IndexSet) -> Void
    let index: Int
    
    var body: some View {
        Button {
            onDelete(IndexSet(integer: index))
        } label: {
            if (self.editMode?.wrappedValue == .active) {
                Image(systemName: "trash")
                    .foregroundColor(.white)
            }
        }
    }
}
