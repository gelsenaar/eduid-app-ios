import Foundation

extension Notification.Name {
    
    public static let createEduIDDidReturnFromMagicLink = Notification.Name("createEduIDDidReturnFromMagicLink")
    public static let didAddLinkedAccounts = Notification.Name("didAddLinkedAccounts")
    public static let didUpdateEmail = Notification.Name("didUpdateEmail")
    public static let willAddPassword = Notification.Name("willAddPassword")
    public static let willChangePassword = Notification.Name("willChangePassword")
    public static let firstTimeAuthorizationComplete = Notification.Name(rawValue: "firstTimeAuthorizationComplete")
    public static let firstTimeAuthorizationCompleteWithSecretPresent = Notification.Name(rawValue: "firstTimeAuthorizationCompleteWithSecretPresent")
    
}
