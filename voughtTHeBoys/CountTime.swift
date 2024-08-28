//
//  CountTime.swift
//  voughtTHeBoys
//
//  Created by Aditya Rai on 27/08/24.
//

import Foundation
import Combine

class CountTime: ObservableObject {
    @Published var progress: Double
    private var interval: TimeInterval
    private var max: Int
    private let publisher: Timer.TimerPublisher
    private var cancellable: Cancellable?
    
    init(items: Int, interval: TimeInterval) {
        self.max = items
        self.progress = 0
        self.interval = interval
        self.publisher = Timer.publish(every: 0.1, on: .main, in: .default)
    }
    
    func start() {
        // Cancel any existing timer subscription before starting a new one
        self.cancellable?.cancel()
        
        self.cancellable = self.publisher.autoconnect().sink { _ in
            var newProgress = self.progress + (0.1 / self.interval)
            if Int(newProgress) >= self.max { newProgress = 0 }
            self.progress = newProgress
        }
    }
    
    func advancePage(by number: Int) {
        let newProgress = Swift.max((Int(self.progress) + number) % self.max, 0)
        self.progress = Double(newProgress)
    }
    

}

