# GuitarAPP – Guía de instalación en Xcode

## Requisitos
- Mac con macOS 13+
- Xcode 15 o superior (descarga gratuita en la App Store)
- iPhone o simulador iOS 17+

---

## Pasos para crear el proyecto en Xcode

### 1. Crear nuevo proyecto
1. Abre Xcode → **File → New → Project…**
2. Elige **iOS → App**
3. Configura:
   - **Product Name:** `GuitarAPP`
   - **Team:** tu Apple ID (o "None" para el simulador)
   - **Organization Identifier:** `com.tuNombre.guitarapp`
   - **Interface:** SwiftUI
   - **Language:** Swift
4. Haz clic en **Next** y guarda el proyecto donde prefieras.

---

### 2. Añadir los archivos fuente
Xcode crea un archivo `ContentView.swift` y `GuitarAPPApp.swift` por defecto.
**Bórralos** (Move to Trash) y en su lugar arrastra toda la carpeta `Sources/` de esta carpeta a tu proyecto en Xcode.

Al soltar, asegúrate de que las opciones estén así:
- ✅ Copy items if needed
- ✅ Create groups
- ✅ Add to target: GuitarAPP

---

### 3. Configurar permisos (Info.plist)
La app necesita acceso al micrófono para el afinador.

1. En el panel izquierdo (Project Navigator) haz clic en tu proyecto → target **GuitarAPP** → pestaña **Info**
2. Añade la clave:
   - **Key:** `Privacy - Microphone Usage Description`
   - **Value:** `GuitarAPP usa el micrófono para detectar el tono de tu guitarra y afinarla.`

---

### 4. Compilar y ejecutar
1. Selecciona un simulador (ej. iPhone 15) o conecta tu iPhone.
2. Pulsa ▶️ **Run** (`Cmd + R`).

> **Nota sobre el afinador:** El micrófono solo funciona en un dispositivo real (iPhone/iPad). En el simulador no hay micrófono, así que el afinador mostrará `--`.

---

## Estructura del proyecto

```
Sources/
├── App/
│   ├── GuitarAPPApp.swift       ← Entry point (@main)
│   └── ContentView.swift        ← TabBar principal
│
├── Models/
│   ├── NoteFrequencies.swift    ← Detección de notas y escalas
│   ├── ChordModel.swift         ← Biblioteca de acordes
│   ├── LessonModel.swift        ← Lecciones y pasos
│   └── GameModel.swift          ← Puntuación y modos de juego
│
└── Views/
    ├── Tuner/
    │   ├── TunerView.swift      ← UI del afinador
    │   └── TunerViewModel.swift ← Lógica AVAudioEngine + YIN
    ├── Chords/
    │   ├── ChordsView.swift     ← Lista y detalle de acordes
    │   └── ChordDiagramView.swift ← Diagrama Canvas
    ├── Metronome/
    │   ├── MetronomeView.swift  ← UI del metrónomo
    │   └── MetronomeEngine.swift ← Motor de audio (clicks)
    ├── Lessons/
    │   └── LessonsView.swift   ← Lecciones + LessonDetail
    └── Game/
        ├── GameView.swift      ← Hub de juego + XP
        └── GamePlayView.swift  ← Preguntas interactivas
```

---

## Funcionalidades incluidas

| Módulo | Características |
|--------|----------------|
| 🎸 **Afinador** | Detección de pitch con YIN, medidor de cents, referencia de cuerdas, VU meter |
| 🎵 **Acordes** | 18 acordes con diagramas Canvas dibujados a mano, filtros por tipo, instrucciones dedo a dedo |
| ⏱ **Metrónomo** | Clic sintetizado con AVAudioEngine, 40-240 BPM, compases 2/4 3/4 4/4 6/8, acento en primer tiempo |
| 📚 **Lecciones** | 8 lecciones con pasos, diagramas integrados, visualizador de escalas y mástil |
| 🎮 **Juego** | 3 modos: Notas en el mástil, Challenge de escalas, Quiz de acordes; sistema XP con niveles y racha |

---

## Dependencias externas
**Ninguna.** La app usa únicamente frameworks nativos de Apple:
- `SwiftUI` – UI
- `AVFoundation` – Audio (afinador y metrónomo)
- `Accelerate` – DSP (vDSP para detección de pitch)
- `UserDefaults` – Persistencia de XP

---

## Próximos pasos sugeridos
- Añadir más canciones con tablatura interactiva
- Detección de acordes en tiempo real con el micrófono
- Modo multijugador (desafíos contra otros usuarios)
- Animaciones de rasgueo y picking
- Integrar Core Data para historial de práctica
