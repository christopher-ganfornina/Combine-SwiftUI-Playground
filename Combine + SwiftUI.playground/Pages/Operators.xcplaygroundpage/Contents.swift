import Foundation
import Combine

/**
    Define publishers
 */

printSection("Initial publisher & subjects")

let publisher = "H3LL8 w0rld".publisher

let subject = CurrentValueSubject<Int, Error>.init(9)

print("- Publisher")
publisher.sink(
    receiveCompletion: { print($0) },
    receiveValue: { print("Value: \($0)") }
)

print("- Subject")
publisher.sink(
    receiveCompletion: { print($0) },
    receiveValue: { print("Value: \($0)") }
)

subject.send(8)
subject.send(7)
subject.send(6)
subject.send(5)

/**
    Map
 */

printSection("Map")

print("- Map publisher to lowercased")

publisher
    .map { $0.lowercased() }
    .sink { print("Value: \($0)") }

/**
    CompactMap
 */

printSection("Compact Map")

print("- Compact map cast to number")

publisher
    .map(String.init)
    .compactMap { Int($0) }
    .sink { print("Value: \($0)") }

/**
    Filter
 */

printSection("Filter")

print("- Filter numbers less than 7")

subject
    .filter { $0 < 7 }
    .sink(
        receiveCompletion: { print("Completion: \($0)") },
        receiveValue: { print("Value: \($0)") }
    )

/**
    Scan
 */

printSection("Scan")

print("- Scan numbers subject")

[1, 3, 5].publisher
    .scan(.zero, { acumulated, value in
        acumulated + value
    })
    .sink(
        receiveCompletion: { print("Completion: \($0)") },
        receiveValue: { print("Value: \($0)") }
    )

/**
    All operators [https://developer.apple.com/documentation/combine/publishers-merge-publisher-operators]
 */
