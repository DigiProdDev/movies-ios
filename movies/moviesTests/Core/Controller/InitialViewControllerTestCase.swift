//
//  InitialViewControllerTestCase.swift
//  moviesTests
//
//  Created by Gustavo Garcia Leite on 30/06/22.
//

@testable import movies
import XCTest

final class InitialViewControllerTestCase: XCTestCase {

    private var sut: InitialViewController!

    override func setUp() {
        super.setUp()
        sut = InitialViewController()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testLoadView() {
        sut.loadView()
        XCTAssertTrue(sut.view is InitialView)
    }

}
