//
//  TabBarViewControllerTestCase.swift
//  moviesTests
//
//  Created by gustavo.cosenza on 07/07/22.
//

import XCTest
@testable import movies

class TabBarViewControllerTestCase: XCTestCase {

    var sut: TabBarViewController!
    
    override func setUp() {
        super.setUp()
        sut = TabBarViewController()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSetup() {
        XCTAssertEqual(sut.tabBar.isTranslucent, false)
        XCTAssertEqual(sut.tabBar.tintColor, .black)
        XCTAssertEqual(sut.tabBar.unselectedItemTintColor, .darkGray)
        XCTAssertEqual(sut.tabBar.backgroundColor, UIColor(named: "lightYellow"))
    }
    
    func testInitialView() {
        let viewController = sut.viewControllers?.first
        let title = viewController?.tabBarItem.title
        XCTAssertEqual(title, "Movies")
    }
    
    func testSecondView() {
        let viewController = sut.viewControllers?.last
        let title = viewController?.tabBarItem.title
        XCTAssertEqual(title, "Favorites")
    }

}
