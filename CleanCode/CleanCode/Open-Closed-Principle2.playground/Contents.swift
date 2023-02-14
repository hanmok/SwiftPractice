import UIKit
import XCTest

// Isolating from Change
//
// exchange: 거래소
//class NYStockExchange {
//    func currentPrice(symbol: String) -> Double {
//        return 10.0
//    }
//}
//
//class Portfolio {
//
//    var exchange: NYStockExchange
//
//    init(exchange: NYStockExchange) {
//        self.exchange = exchange
//    }
//}

protocol StockExchange {
    func currentPrice(symbol: String) -> Double
}


class NYStockExchange: StockExchange {
    func currentPrice(symbol: String) -> Double {
        return 10.0
    }
}

class Portfolio {
    
    var exchange: StockExchange
    var value: Double = 0.0
    
    init(exchange: StockExchange) {
        self.exchange = exchange
    }
    
    func add(quantity: Int, symbol: String) {
        let price = self.exchange.currentPrice(symbol: symbol)
        value = Double(quantity) * price
    }
}

class FixedStockExchangeStub: StockExchange {
    
    private var symbolAndPrice: [String: Double] = [:]
    
    func fix(symbol: String, price: Double) {
        symbolAndPrice[symbol] = price
    }
    
    func currentPrice(symbol: String) -> Double {
        return symbolAndPrice[symbol]!
    }
}

class PortfolioTests: XCTestCase {
    
    private var exchange: FixedStockExchangeStub!
    
    private var portfolio: Portfolio!
    
    override func setUp() {
        exchange = FixedStockExchangeStub()
        exchange.fix(symbol: "MSFT", price: 100)
        portfolio = Portfolio(exchange: exchange)
    }
    
    func test_given_5_microsoft_total_should_be_500() {
        portfolio.add(quantity: 5, symbol: "MSFT")
        XCTAssertEqual(500, portfolio.value)
    }
}

PortfolioTests.defaultTestSuite.run()
