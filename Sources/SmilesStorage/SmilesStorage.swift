import Foundation

public class SmilesStorage {
    
    // MARK: - Private properties
    
    private var defaults: UserDefaults {
        UserDefaults.standard
    }
    
    public init() {
        
    }
    
    // MARK: - Methods
    
    public func string(forKey key: String) -> String? {
        defaults.string(forKey: key)
    }
    
    public func data(forKey key: String) -> Data? {
        defaults.data(forKey: key)
    }
    
    public func bool(forKey key: String) -> Bool? {
        defaults.bool(forKey: key)
    }
    
    public func set(_ value: Any, forKey: String) {
        defaults.set(value, forKey: forKey)
    }
    
    public func remove(_ forKey: String) {
        defaults.removeObject(forKey: forKey)
    }
}
