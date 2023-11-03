//
// UserResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UserResponse: Codable, JSONEncodable, Hashable {

    public var id: String?
    public var email: String?
    public var givenName: String?
    public var familyName: String?
    public var usePassword: Bool?
    public var usePublicKey: Bool?
    public var forgottenPassword: Bool?
    public var publicKeyCredentials: [PublicKeyCredentials]?
    public var linkedAccounts: [LinkedAccount]?
    public var schacHomeOrganization: String?
    public var uid: String?
    public var rememberMe: Bool?
    public var created: Int64?
    public var eduIdPerServiceProvider: [String: EduID]?
    public var loginOptions: [String]?
    public var registration: [String: AnyCodable]?

    public init(id: String? = nil, email: String? = nil, givenName: String? = nil, familyName: String? = nil, usePassword: Bool? = nil, usePublicKey: Bool? = nil, forgottenPassword: Bool? = nil, publicKeyCredentials: [PublicKeyCredentials]? = nil, linkedAccounts: [LinkedAccount]? = nil, schacHomeOrganization: String? = nil, uid: String? = nil, rememberMe: Bool? = nil, created: Int64? = nil, eduIdPerServiceProvider: [String: EduID]? = nil, loginOptions: [String]? = nil, registration: [String: AnyCodable]? = nil) {
        self.id = id
        self.email = email
        self.givenName = givenName
        self.familyName = familyName
        self.usePassword = usePassword
        self.usePublicKey = usePublicKey
        self.forgottenPassword = forgottenPassword
        self.publicKeyCredentials = publicKeyCredentials
        self.linkedAccounts = linkedAccounts
        self.schacHomeOrganization = schacHomeOrganization
        self.uid = uid
        self.rememberMe = rememberMe
        self.created = created
        self.eduIdPerServiceProvider = eduIdPerServiceProvider
        self.loginOptions = loginOptions
        self.registration = registration
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case email
        case givenName
        case familyName
        case usePassword
        case usePublicKey
        case forgottenPassword
        case publicKeyCredentials
        case linkedAccounts
        case schacHomeOrganization
        case uid
        case rememberMe
        case created
        case eduIdPerServiceProvider
        case loginOptions
        case registration
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(givenName, forKey: .givenName)
        try container.encodeIfPresent(familyName, forKey: .familyName)
        try container.encodeIfPresent(usePassword, forKey: .usePassword)
        try container.encodeIfPresent(usePublicKey, forKey: .usePublicKey)
        try container.encodeIfPresent(forgottenPassword, forKey: .forgottenPassword)
        try container.encodeIfPresent(publicKeyCredentials, forKey: .publicKeyCredentials)
        try container.encodeIfPresent(linkedAccounts, forKey: .linkedAccounts)
        try container.encodeIfPresent(schacHomeOrganization, forKey: .schacHomeOrganization)
        try container.encodeIfPresent(uid, forKey: .uid)
        try container.encodeIfPresent(rememberMe, forKey: .rememberMe)
        try container.encodeIfPresent(created, forKey: .created)
        try container.encodeIfPresent(eduIdPerServiceProvider, forKey: .eduIdPerServiceProvider)
        try container.encodeIfPresent(loginOptions, forKey: .loginOptions)
        try container.encodeIfPresent(registration, forKey: .registration)
    }
}

