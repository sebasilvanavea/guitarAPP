import SwiftUI

struct ContentView: View {

    @EnvironmentObject var gameScore: GameScore
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {

            TunerView()
                .tabItem {
                    Label("Afinador", systemImage: "tuningfork")
                }
                .tag(0)

            ChordsView()
                .tabItem {
                    Label("Acordes", systemImage: "music.note.list")
                }
                .tag(1)

            MetronomeView()
                .tabItem {
                    Label("Metrónomo", systemImage: "metronome")
                }
                .tag(2)

            LessonsView()
                .tabItem {
                    Label("Lecciones", systemImage: "book.fill")
                }
                .tag(3)

            GameView()
                .tabItem {
                    Label("Juego", systemImage: "gamecontroller.fill")
                }
                .tag(4)
        }
        .accentColor(.orange)
    }
}
