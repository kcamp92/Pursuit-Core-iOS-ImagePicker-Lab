//
//  UserNamePersistenceHelper.swift
//  Pursuit-Core-iOS-ImagePicker-Lab
//
//  Created by Krystal Campbell on 10/7/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct UsernamePersistenceHelper {
    
    static let manager = UsernamePersistenceHelper()
    
    func save(newUsername: Profile) throws {
        try persistenceHelper.save(newElement: newUsername)
    }
    
    private let persistenceHelper = PersistenceHelper<Profile>(fileName: "username.plist")
        
    private init() {}
    
}

