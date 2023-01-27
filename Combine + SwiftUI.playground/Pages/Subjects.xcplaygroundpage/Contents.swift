import Foundation
import Combine

/**
    PassthroughSubject
 */

printSection("Passthrough")
let passthroughSubject = PassthroughSubject<String,Error>()

passthroughSubject.sink(
    receiveCompletion: { print($0) },
    receiveValue: { print("Value: \($0)") }
)

print("- Sending events")

passthroughSubject.send("First event")
passthroughSubject.send(completion: .finished)
passthroughSubject.send("Second event")

/**
    CurrentValueSubject
 */

printSection("CurrentValue")
let currentValueSubject = CurrentValueSubject<String, Error>.init("Initial value")

currentValueSubject.sink(
    receiveCompletion: { print($0) },
    receiveValue: { print("Value: \($0)") }
)

print("- Sending events")

currentValueSubject.send("First event")
currentValueSubject.send(completion: .finished)
currentValueSubject.send("Second event")
