// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let story = try? newJSONDecoder().decode(Story.self, from: jsonData)

import Foundation

// MARK: - Story
struct Story: Codable {
    let id: Int
    let categories, authors: [JSONAny]
    let url: String
    let lastModified, onTime: Int
    let sponsored: Bool
    let displayName: String
    let assets: [Asset]
    let relatedAssets, relatedImages: [JSONAny]
    let assetType: String
    let timeStamp: Int
}

// MARK: - Asset
struct Asset: Codable {
    let id: Int
    let categories: [Category]
    let authors: [Author]
    let url: String
    let lastModified: Int
    let sponsored: Bool
    let headline, indexHeadline, tabletHeadline, theAbstract: String
    let byLine: String
    let acceptComments: Bool
    let numberOfComments: Int
    let relatedAssets: [RelatedAsset]
    let relatedImages: [AssetRelatedImage]
    let signPost: String?
    let companies: [Company]
    let legalStatus: LegalStatus
    let sources: [Source]
    let assetType: AssetAssetType
    let overrides: Overrides
    let timeStamp: Int
    let onTime: Int?
    let hasVideo: Bool?
}

enum AssetAssetType: String, Codable {
    case article = "ARTICLE"
    case video = "VIDEO"
}

// MARK: - Author
struct Author: Codable {
    let name, title, email: String
    let relatedAssets: [JSONAny]
    let relatedImages: [AuthorRelatedImage]
}

// MARK: - AuthorRelatedImage
struct AuthorRelatedImage: Codable {
    let id: Int
    let categories, brands, authors: [JSONAny]
    let url: String
    let lastModified: Int
    let sponsored: Bool
    let relatedImageDescription: Description
    let photographer: String
    let type: PurpleType
    let width, height: Int
    let assetType: RelatedImageAssetType
    let timeStamp: Int

    enum CodingKeys: String, CodingKey {
        case id, categories, brands, authors, url, lastModified, sponsored
        case relatedImageDescription = "description"
        case photographer, type, width, height, assetType, timeStamp
    }
}

enum RelatedImageAssetType: String, Codable {
    case image = "IMAGE"
}

enum Description: String, Codable {
    case empty = ""
    case jessicaSierAFRWoodcut = "Jessica Sier AFR Woodcut"
    case purple = " "
}

enum PurpleType: String, Codable {
    case afrWoodcutAuthorImage = "afrWoodcutAuthorImage"
}

// MARK: - Category
struct Category: Codable {
    let name, sectionPath: String
    let orderNum: Int
}

// MARK: - Company
struct Company: Codable {
    let id: Int
    let companyCode, companyName, abbreviatedName, exchange: String
    let companyNumber: String?
}

enum LegalStatus: String, Codable {
    case approved = "Approved"
    case none = "None"
}

// MARK: - Overrides
struct Overrides: Codable {
    let overrideHeadline, overrideAbstract: String
}

// MARK: - RelatedAsset
struct RelatedAsset: Codable {
    let id: Int
    let categories: [Category]
    let authors: [Author]
    let url: String
    let lastModified: Int
    let sponsored: Bool
    let assetType: AssetAssetType
    let headline: String
    let timeStamp: Int
    let onTime: Int?
    let brands: [Brand]?
    let lastPublishedDate: Int?
}

// MARK: - Brand
struct Brand: Codable {
    let title: TagID
    let orderNum: Int
}

enum TagID: String, Codable {
    case afr = "AFR"
    case theNewYorkTimes = "The New York Times"
}

// MARK: - AssetRelatedImage
struct AssetRelatedImage: Codable {
    let id: Int
    let categories, brands, authors: [JSONAny]
    let url: String
    let lastModified: Int
    let sponsored: Bool
    let relatedImageDescription, photographer: String
    let type: FluffyType
    let width, height: Int
    let assetType: RelatedImageAssetType
    let xLarge2X, xLarge, large2X, large: String?
    let thumbnail2X, thumbnail: String?
    let timeStamp: Int

    enum CodingKeys: String, CodingKey {
        case id, categories, brands, authors, url, lastModified, sponsored
        case relatedImageDescription = "description"
        case photographer, type, width, height, assetType
        case xLarge2X = "xLarge@2x"
        case xLarge
        case large2X = "large@2x"
        case large
        case thumbnail2X = "thumbnail@2x"
        case thumbnail, timeStamp
    }
}

enum FluffyType: String, Codable {
    case afrArticleInline = "afrArticleInline"
    case afrArticleLead = "afrArticleLead"
    case afrIndexLead = "afrIndexLead"
    case articleLeadNarrow = "articleLeadNarrow"
    case articleLeadWide = "articleLeadWide"
    case landscape = "landscape"
    case thumbnail = "thumbnail"
    case wideLandscape = "wideLandscape"
}

// MARK: - Source
struct Source: Codable {
    let tagID: TagID

    enum CodingKeys: String, CodingKey {
        case tagID = "tagId"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
