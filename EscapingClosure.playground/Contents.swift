import UIKit

var greeting = "Hello, playground"
// make it escape score of this function.
//func getData( completion: ((Bool) -> Void)) {
    // error: escaping closure captures non-escaping parameter completion
func getData( completion: @escaping ((Bool) -> Void)) {
    let task = URLSession.shared.dataTask(with: URL(string: "")!) { data, response, error in
        guard data != nil else {
            completion(false)
            return
        }
        completion(true)
    }
    task.resume()
}

final class APICaller {
    var isReady = false
    
    func warmup() {
        isReady = true
        
        if !completionHandlers.isEmpty {
            completionHandlers.forEach({ $0() })
            completionHandlers.removeAll()
        }
    }
    
    var completionHandlers = [(() -> Void)]()
    
    func doSomething(completion: @escaping (() -> Void)) {
        guard isReady else {
            completionHandlers.append {
                completion()
            }
            return
        }
        completion()
    }
}

APICaller().doSomething {
    
}
