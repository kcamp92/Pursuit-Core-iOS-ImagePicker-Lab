//
//  ProfilePersistenceHelper.swift
//  Pursuit-Core-iOS-ImagePicker-Lab
//
//  Created by Krystal Campbell on 10/8/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct ProfilePersistenceHelper {
    
    static let manager = ProfilePersistenceHelper()
    
    func save(newProfile: Profile) throws {
        try persistenceHelper.save(newElement: newProfile)
    }
    
    func getProfiles() throws -> [Profile] {
        return try persistenceHelper.getObjects()
    }
    
    private let persistenceHelper = PersistenceHelper<Profile>(fileName: "profile.plist")
        
    private init() {}
    
}

