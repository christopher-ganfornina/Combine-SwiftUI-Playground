import Foundation

/**
{
  "id": 1,
  "title": "iPhone 9",
  "description": "An apple mobile which is nothing like apple",
  "price": 549,
  "discountPercentage": 12.96,
  "rating": 4.69,
  "stock": 94,
  "brand": "Apple",
  "category": "smartphones",
  "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
  "images": [
    "https://i.dummyjson.com/data/products/1/1.jpg",
    "https://i.dummyjson.com/data/products/1/2.jpg",
    "https://i.dummyjson.com/data/products/1/3.jpg",
    "https://i.dummyjson.com/data/products/1/4.jpg",
    "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
  ]
}
 */

public class ProductDecodable: Decodable {
    public let id: Int
    public let title: String
    public let description: String
    public let price: Int
    public let discountPercentage: Double
}

public extension ProductDecodable {
    public var debugDescription: String {
        "id: \(id)," +
        "title: \(title)," +
        "description: \(description)," +
        "price: \(price)," +
        "discountPercentage: \(discountPercentage)"
    }
}
