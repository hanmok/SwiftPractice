import UIKit

var greeting = "Hello, playground"

print("hi")

print("unable?")



/*
 It has to be singular
 
 
 */

/*
class Customer {
    private var isManager: Bool = false
    
    var firstName: String
    var middleName: String?
    var lastName: String
    
    init(firstName: String, middleName: String? = nil, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
    }
    
    static func ById(id: String) -> Customer? {
        return nil
    }
    
    func save() {
        isManager = true
    }
    
    func delete() {
        
    }
}

Customer.ById(id: "234")
let customer = Customer(firstName: "John", middleName: "Alex", lastName: "Doe")
*/
// Class should be small!
// Single Responsibility Principle



class Customer {

    var customerId: String?
    var firstName: String
    var middleName: String?
    var lastName: String
    var address: Address?
    
//    var street: String?
//    var city: String?
//    var state: String?
//    var zipCode: String?
    
    init(firstName: String, middleName: String? = nil, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
    }
    
    // too much arguments are passing. The less the better
//    func setAddress(street: String, city: String, state: String, zipCode: String) {
//        self.street = street
//        self.city = city
//        self.state = state
//        self.zipCode = zipCode
//    }
    
    func setAddress(address: Address) {
        self.address = address
    }
    
    
    static func ById(id: String) -> Customer? {
        return nil
    }
    
    func save() {
        
    }
    
    func delete() {
        
    }
    
    // don't give customer class a responsibility of UI
    
//    func displayCustomer() -> UIView {
//        let firstNameLabel = UILabel()
//        firstNameLabel.text = self.firstName
//
//        let lastNameLabel = UILabel()
//        lastNameLabel.text = self.lastName
//
//        let stackView = UIStackView()
//        stackView.addSubview(firstNameLabel)
//        stackView.addSubview(lastNameLabel)
//        return stackView
//    }
    
}

//let customer = Customer(firstName: "John", middleName: "Alex", lastName: "Doe")
//customer.setAddress(street: "1200", city: "Houstom", state: "TX", zipCode: "70098")
  

class Address {
    var street: String
    var city: String
    var state: String
    var zipCode: String
    
    init(street: String, city: String, state: String, zipCode: String) {
        self.street = street
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}



