//
//  Phone.swift
//
//  Created by rs on 07/04/22
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Phone: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let label = "label"
    static let value = "value"
    static let primary = "primary"
  }

  // MARK: Properties
  public var label: String?
  public var value: String?
  public var primary: Bool? = false

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    label = json[SerializationKeys.label].string
    value = json[SerializationKeys.value].string
    primary = json[SerializationKeys.primary].boolValue
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = label { dictionary[SerializationKeys.label] = value }
    if let value = value { dictionary[SerializationKeys.value] = value }
    dictionary[SerializationKeys.primary] = primary
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.label = aDecoder.decodeObject(forKey: SerializationKeys.label) as? String
    self.value = aDecoder.decodeObject(forKey: SerializationKeys.value) as? String
    self.primary = aDecoder.decodeBool(forKey: SerializationKeys.primary)
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(label, forKey: SerializationKeys.label)
    aCoder.encode(value, forKey: SerializationKeys.value)
    aCoder.encode(primary, forKey: SerializationKeys.primary)
  }

}
