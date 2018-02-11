//
//  Geolocation.swift
//  CodableExample
//
//  Created by Serj Agopian on 2/10/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

struct Geolocation {
    
    /// As you have noticed the API returns the locations as Strings
    /// This isn't very convenient maybe if you need the values as double
    /// There is two ways of implementing this. You could make the properties Double
    /// And implement the decoder and encoder manually and intercept these values
    /// Or you could make a computed variable (My prefered way of dealing with it)
    /// Why do I prefer that? Because if you implement the encoder or decoder you have
    /// to manually implement encoding and decoding all the keys on your own. So the work that the language already does for you
    /// You will have to do it again because of some exception with 1 property out of 20 lets say that isn't very convenient
    /// For the sake of example I will implement both here
    let latitude: String? 
    let longitude: Double?
    
    /// This enums maps your own property keys to the json keys
    /// If they are the same you don't need to implement this!
    /// But I always like implementing it, just incase if things change on the server
    /// I could change things easily. I need to implement it here because I changed the key values on purpose
    enum CodingKeys: String, CodingKey {
        /// case is your property name, the string value is the json key name
        case latitude = "lat"
        case longitude = "lng"
    }
    
}

extension Geolocation: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Geolocation.CodingKeys.self)
        /// We use decode if present, if we think the value might be nil
        /// we will be decoding it as a string since it is a string from the json
        latitude = try container.decodeIfPresent(String.self, forKey: .latitude)
        /// Again we are decoding from a string because the value of the json is string
        /// But i passed it to a temporary variable so we make make the converion manually
        if let lng = try container.decodeIfPresent(String.self, forKey: .longitude) {
            longitude = Double(lng)
        } else {
            /// We could give a default value or just pass it nil
            longitude = nil
        }
    }
    
}

extension Geolocation: Encodable {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Geolocation.CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        /// Since this is double we will need to conver it into string
        /// Since the json requires it to be a String
        try container.encode(longitude?.description, forKey: .longitude)
    }
    
}

/// Computed variable solution where it prevents you from doing all of the above for transformations
extension Geolocation {
    
    /// Yes thats it wow!
    var latitudeDouble: Double? {
        guard let lat = latitude else {return nil}
        return Double(lat)
    }
    
}

