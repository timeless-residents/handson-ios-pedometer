import CoreMotion
import SwiftUI

class PedometerManager: ObservableObject {
    private let pedometer = CMPedometer()
    @Published var steps: Int = 0
    @Published var distance: Double = 0
    
    func checkAuthorization() {
        if CMPedometer.isStepCountingAvailable() {
            startCounting()
        }
    }
    
    private func startCounting() {
        pedometer.startUpdates(from: Date().startOfDay) { [weak self] data, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                self?.steps = data.numberOfSteps.intValue
                if let distance = data.distance {
                    self?.distance = distance.doubleValue
                }
            }
        }
    }
}

extension Date {
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}

struct ContentView: View {
    @StateObject private var pedometerManager = PedometerManager()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("今日の歩数")
                .font(.title)
            
            Text("\(pedometerManager.steps)")
                .font(.system(size: 50, weight: .bold))
            
            Text(String(format: "距離: %.2f km", pedometerManager.distance / 1000))
                .font(.headline)
        }
        .onAppear {
            pedometerManager.checkAuthorization()
        }
    }
}
