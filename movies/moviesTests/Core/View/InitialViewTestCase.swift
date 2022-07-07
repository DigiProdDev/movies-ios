//
//  InitialViewTestCase.swift
//  moviesTests
//
//  Created by Gustavo Garcia Leite on 30/06/22.
//

import XCTest
@testable import movies

final class InitialViewTestCase: XCTestCase {
    
    private var sut: InitialView!

    override func setUp() {
        super.setUp()
        sut = InitialView()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testLayout() {
        XCTAssertEqual(sut.backgroundColor, .yellow)
        XCTAssertEqual(sut.titleLabel.backgroundColor, .black)
        XCTAssertEqual(sut.titleLabel.textColor, .white)
        XCTAssertEqual(sut.titleLabel.text, "Movies")
        XCTAssertFalse(sut.titleLabel.translatesAutoresizingMaskIntoConstraints)
    }
}
