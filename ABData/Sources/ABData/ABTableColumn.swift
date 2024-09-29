
import ABDatabase
import Foundation

public struct ABTableColumn {
    
    public let name: String
    public let type: SelectColumnType
    
    public init(_ name: String, _ type: SelectColumnType) {
        self.name = name
        self.type = type
    }
    
}
