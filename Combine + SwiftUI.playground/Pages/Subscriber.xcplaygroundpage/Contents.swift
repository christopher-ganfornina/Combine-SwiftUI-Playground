import UIKit
import Combine
import NotificationCenter

/**
    Assign
 */

printSection("Assign")

var person = Person()
let just = Just("Robert")

just.assign(to: \.name, on: person)
person

/**
    NSNotification
 */

printSection("Notification")

extension NSNotification.Name {
    static let personAge = NSNotification.Name("age")
}

let notificationPublisher = NotificationCenter.Publisher(center: .default, name: .personAge, object: nil)
let nameSubscriber = Subscribers.Assign(object: person, keyPath: \.age)

notificationPublisher
    .compactMap { $0.object as? Int }
    .subscribe(nameSubscriber)

NotificationCenter.default.post(name: .personAge, object: 33)

person

/**
    Store
 */

printSection("Store")

var subscriptions = Set<AnyCancellable>()

let subject = CurrentValueSubject<Int, Error>(1)

subject
    .sink(
        receiveCompletion: { print("Completion: \($0)") },
        receiveValue: { print("Value: \($0)") }
    )
    .store(in: &subscriptions)

subject.send(2)
subject.send(3)

subscriptions = .init()

subject.send(4)
