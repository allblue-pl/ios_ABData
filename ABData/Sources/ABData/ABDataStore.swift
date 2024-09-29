
import ABDatabase
import Foundation

public class ABDataStore {
    
    static public func getDBSchemeVersion(db: ABDatabase, transactionId: Int?, execute callback: @escaping (_ dbSchemeVer: Int?) -> Void) {
        db.query_Select("SELECT Name, Data FROM _ABData_Settings WHERE Name = 'version'", [ SelectColumnType.String, SelectColumnType.JSON ]) { rows in
            guard rows.count > 0 else {
                callback(nil)
                return
            }
            
            guard let dbSchemeVersion = rows[0][1] as? Int else {
                callback(nil)
                return
            }
            
            callback(dbSchemeVersion)
        } execute: { error in
            print("ABDataStore Error -> \(error)")
            callback(nil)
        }
    }
    
}
