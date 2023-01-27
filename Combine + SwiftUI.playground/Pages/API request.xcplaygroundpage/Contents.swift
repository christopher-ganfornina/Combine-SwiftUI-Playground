import Foundation
import Combine

/**
 Dummy Api rest [https://dummyjson.com/products/1]
 */

var subscriptions = Set<AnyCancellable>()

let url = URL(string: "https://dummyjson.com/products/1")!

var urlRequest = URLRequest(url: url)
urlRequest.httpMethod = "GET"
// urlRequest.headers = ....


/**
    Data task from URL
 */

printSection("Api request Combine")


//let dataTaskPublisher = URLSession.shared.dataTaskPublisher(for: urlRequest)
let dataTaskPublisher = URLSession.shared.dataTaskPublisher(for: url)
    .map { $0.data }
    .decode(type: ProductDecodable.self, decoder: JSONDecoder())
    .eraseToAnyPublisher()

print("🛠️ Request sent")

dataTaskPublisher
    .sink(
        receiveCompletion: { print("Completion: \($0)") },
        receiveValue: { print("Value: \($0.debugDescription)") }
    )
    .store(in: &subscriptions)

print("⏳ After subscription")

/**
    Acyn Await
 */

printSection("Api request Async await")

Task {
    let (productAsyncData, productAsyncResponse) = try! await URLSession.shared.data(from: url)
    let product = try? JSONDecoder().decode(ProductDecodable.self, from: productAsyncData)
    print("Value await: \(product!.debugDescription)")
    print("Response: \(productAsyncResponse)")
}
