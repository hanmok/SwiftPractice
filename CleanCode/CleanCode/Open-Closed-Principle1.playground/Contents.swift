import UIKit

// Organizing for change

// Make organized structure for future changes.

//class Sql {
//    var table: String
//    var columns: [String]
//
//    init(table: String, columns: [String]) {
//        self.table = table
//        self.columns = columns
//    }
//
//    func create() -> String {
//        return ""
//    }
//
////    func update() -> String {
////        return ""
////    }
//
//    func insert(fields: [AnyObject]) {
//
//    }
//
//    func selectAll() {
//
//    }
//}


protocol Sql {
    func generate() -> String
}

class SqlBase {
    var table: String = ""
    var columns: [String] = [String]()
}

class InsertSQL: SqlBase, Sql {
    
//    var table: String
//    var columns: [String]

    var values: [String] = [String]()
    
    init(table: String, columns: [String], values: [String]) {
//        self.table = table
//        self.columns = columns
        super.init()
        self.values = values
    }
    
    func generate() -> String {
        return "INSERT INTO \(self.table)(\(columns.joined(separator: ","))) VALUES(\(self.values.map{"'\($0)'"}.joined(separator: ",")))"
    }
}

func executeSql(sql: Sql) {
    let sqlAsString = sql.generate()
    // execute the sql
}

let insertSql = InsertSQL(table: "Customers", columns: ["firstName", "lastName"], values: ["John", "Doe"])

//print(insertSql.generate())

executeSql(sql: insertSql)




class SelectWithCriteria: Sql {
    
    var table: String
    var columns: [String]
    var criteria: String
    
    init(table: String, columns: [String], criteria: String) {
        self.table = table
        self.columns = columns
        self.criteria = criteria
    }
    
    func generate() -> String {
        return ""
    }
}

executeSql(sql: SelectWithCriteria(table: "Customers", columns: ["firstName", "lastName"], criteria: "where customerId > 10"))
