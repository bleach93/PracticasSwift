//
//  ContentView.swift
//  To Do App
//
//  Created by Jesus Eduardo Soto Tirado on 10/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var tarea = ""
    @State private var lista: [String] = []
    
    var body: some View {
        ZStack {
            
            // Fondo negro
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("Lista To Do")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                HStack {
                    TextField("Nueva tarea", text: $tarea)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Agregar") {
                        agregarTarea()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(tarea.isEmpty)
                }
                .padding(.horizontal)
                
                // LISTA SIN List (esto elimina el gris)
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(lista, id: \.self) { item in
                            Text(item)
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.gray.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .onDelete(perform: borrarTareaCustom)
                    }
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    // Agregar tarea
    func agregarTarea() {
        lista.append(tarea)
        tarea = ""
    }

    // Borrar (reemplazo porque ScrollView no tiene onDelete)
    func borrarTareaCustom(at offsets: IndexSet) {
        lista.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

