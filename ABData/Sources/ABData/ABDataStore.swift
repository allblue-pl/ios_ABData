
import ABDatabase
import Foundation

public class ABDataStore {
    
    static public func getDBSchemeVersion(db: ABDatabase, transactionId: Int?, execute callback: @escaping (_ dbSchemeVer: Int) -> Void) {
        db.query_Select("SELECT Name, Data FROM _ABData_Settings WHERE Name = 'version'", [ SelectColumnType.String, SelectColumnType.JSON ]) { rows in
            guard rows.count > 0 else {
                callback(-1)
                return
            }
            
            guard let data = rows[0][1] as? [String:AnyObject] else {
                callback(-1)
                return
            }
            
            guard let dbSchemeVersion = data["value"] as? Int else {
                callback(-1)
                return
            }
            
            callback(dbSchemeVersion)
        } execute: { error in
            print("ABDataStore Error -> \(error)")
            callback(-1)
        }
    }
    
}
