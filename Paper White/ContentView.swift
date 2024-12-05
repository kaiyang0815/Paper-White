//
//  ContentView.swift
//  Paper White
//
//  Created by kaiyang on 2024/12/5.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    @State private var toolPickerShows = false
    @State private var drawing = PKDrawing()

    var body: some View {
        NavigationStack {
            CanvasView(drawing: $drawing, toolPickerShows: $toolPickerShows)
                .navigationTitle("Paper white")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
                            Button(
                                "\(toolPickerShows ? "Hide" : "Show") tool picker",
                                systemImage: "pencil.tip.crop.circle"
                            ) {
                                withAnimation {
                                    toolPickerShows.toggle()
                                }
                            }
                            
                            Button(role: .destructive) {
                                withAnimation {
                                    withAnimation {
                                        drawing = PKDrawing()
                                    }
                                }
                            } label: {
                                Label("Erase", systemImage: "eraser")
                            }
                        } label: {
                            Label("More", systemImage: "ellipsis")
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
