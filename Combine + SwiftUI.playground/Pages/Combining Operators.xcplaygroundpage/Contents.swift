import Foundation
import Combine

/**
    Define publishers
 */

printSection("Initial publisher & subjects")

let progression = [4,3, 2, 1].publisher

let multipliers = [1, 2].publisher

/**
    Combine Latest
 */

printSection("Combine Latest")

progression
    .combineLatest(multipliers)
    .sink { print("Value: \($0)") }

print("- Combining elements")

progression
    .combineLatest(multipliers) { $0 * $1 }
    .sink { print("Value: \($0)") }

/**
    Merge
 */

printSection("Merge")

print("- Combining elements")

progression
    .merge(with: multipliers)
    .sink(
        receiveCompletion: { print($0) },
        receiveValue: { print("Value: \($0)") }
    )


/**
    Zip
 */

printSection("Zip")

progression
    .zip(multipliers)
    .sink(
        receiveCompletion: { print("Completion: \($0)") },
        receiveValue: { print("Value: \($0)") }
    )

/**
    FlatMap
 */

printSection("FlatMap")

progression
    .flatMap { int in
        return Just("\(int) is a number")
    }
    .sink(
        receiveCompletion: { print("Completion: \($0)") },
        receiveValue: { print("Value: \($0)") }
    )

/**
    All operators [https://developer.apple.com/documentation/combine/publishers-merge-publisher-operators]
 */
