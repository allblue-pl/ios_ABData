
import ABDatabase
import Foundation

open class ABTable {
    
    private var columns: [ABTableColumn]
    
    
    public init(_ columns: [ABTableColumn]) {
        self.columns = columns
    }
    
    public func getColumnIndex(_ columnName: String) -> Int {
        for i in 0..<columns.count {
            if columns[i].name == columnName {
                return i
            }
        }
        
        fatalError("Column '\(columnName)' does not exist.")
    }
 
    public func getSelect_ColumnNames(tableAlias: String? = nil, prefix: String? = nil) -> String {
        var select = ""
        for i in 0..<columns.count {
            if i > 0 {
                select += ","
            }
            if let tableAlias {
                select += "\(tableAlias)."
            }
            select += columns[i].name
            if let prefix {
                select += " AS \(prefix)\(columns[i].name)"
            }
        }
        
        return select
    }
    
    public func getSelect_ColumnTypes() -> [SelectColumnType] {
        var columnTypes = [SelectColumnType]()
        for i in 0..<columns.count {
            columnTypes.append(columns[i].type)
        }
        
        return columnTypes
    }
    
}


open class ABTableRow {
    
    private let _columnsCount: Int
    
    public let json: [AnyObject]
    public let offset: Int
    
    
    public var columnsCount: Int {
        get { _columnsCount }
    }
    
    
    public init(_ json: [AnyObject], _ columnsCount: Int, offset: Int = 0) {
        self.json = json
        self._columnsCount = columnsCount
        self.offset = offset
    }
    
}

public protocol ABTableRowProtocol {
    func getRowAsJSONObject(prefix: String) -> [String: AnyObject]
}
