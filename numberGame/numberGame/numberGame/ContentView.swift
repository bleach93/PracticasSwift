import SwiftUI

struct ContentView: View {
    @State private var numeroSecreto = Int.random(in: 1...10)
    @State private var intento = ""
    @State private var mensaje = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Adivina el número (1 - 10)")
                .font(.headline)
            
            TextField("Tu número", text: $intento)
                .textFieldStyle(.roundedBorder)
                .frame(width: 200)
                .onChange(of: intento) { newValue in
                    intento = newValue.filter { $0.isNumber }
                }
            
            Button("Probar") {
                verificarNumero()
            }
            .buttonStyle(.borderedProminent)
            
            Text(mensaje)
                .font(.title2)
                .foregroundColor(.blue)
            
            Button("Reiniciar Juego") {
                reiniciarJuego()
            }
            .buttonStyle(.bordered)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
    
    func verificarNumero() {
        guard let numeroUsuario = Int(intento) else {
            mensaje = "Escribe un número válido"
            return
        }
        
        if numeroUsuario == numeroSecreto {
            mensaje = "¡Correcto!"
        } else if numeroUsuario < numeroSecreto {
            mensaje = "Muy bajo"
        } else {
            mensaje = "Muy alto"
        }
    }
    
    func reiniciarJuego() {
        numeroSecreto = Int.random(in: 1...10)
        intento = ""
        mensaje = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
