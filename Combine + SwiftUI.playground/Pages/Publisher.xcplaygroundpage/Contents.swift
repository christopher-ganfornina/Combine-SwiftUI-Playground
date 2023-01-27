
import Foundation
import Combine
import UIKit


/**
    Example of basic publisher and subscription
 */

printSection("String publisher")

let stringPublisher = "Hello Combine".publisher

_ = stringPublisher.sink(receiveCompletion: { completion in
    switch completion {
    case .finished: print("Finished")
    case .failure: print("Failed")
    }
}, receiveValue: { value in
    print("Value: \(value)")
})

/**
    Example of basic publisher subscriptions
 */

printSection("Publisher examples")

let arrayPublisher = [0, 1, 2, 3].publisher
let dictPublisher = ["key01": 11.11, "key02": 22.22].publisher

arrayPublisher.sink(
    receiveCompletion: { print($0) },
    receiveValue: { print("Value: \($0)") }
)

/**
    Just publisher & assign
 */

printSection("Just publisher")

let just = Just("Robert")

_ = just.sink(
    receiveCompletion: { print($0) },
    receiveValue: { print("Value: \($0)") }
)
