import SwiftUI

final class GameState: ObservableObject {
    @Published var log: [String] = ["Новая игра!"]
    func attack() { log.append("Вы атаковали") }
    func defend() { log.append("Вы защитились") }
    func newGame() { log = ["Новая игра!"] }
}

struct ContentView: View {
    @StateObject var state = GameState()
    var body: some View {
        VStack(spacing: 12) {
            Text("Дурак ИИ").font(.largeTitle).padding(.top)
            ScrollView {
                VStack(alignment: .leading, spacing: 6) {
                    ForEach(Array(state.log.enumerated()), id: \.offset) { _, line in
                        Text(line).frame(maxWidth: .infinity, alignment: .leading)
                    }
                }.padding(.horizontal)
            }.frame(maxHeight: 280).border(.gray)
            HStack {
                Button("Атака") { state.attack() }
                Button("Защита") { state.defend() }
                Button("Новая игра") { state.newGame() }
            }.buttonStyle(.borderedProminent)
            Spacer()
        }.padding()
    }
}
