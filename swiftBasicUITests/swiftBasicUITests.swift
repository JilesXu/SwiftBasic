//
//  swiftBasicUITests.swift
//  swiftBasicUITests
//
//  Created by 徐沈俊杰 on 2016/12/19.
//  Copyright © 2016年 tinypace. All rights reserved.
//

import XCTest

class swiftBasicUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.buttons["闭包"].tap()
        
        let goSecondviewcontrollerButton = app.buttons["Go secondViewController"]
        goSecondviewcontrollerButton.tap()
//        print("测试\(goSecondviewcontrollerButton.otherElements.element.coordinate(withNormalizedOffset: CGVector.init(dx: 0, dy: 0)).screenPoint)")
        
        let element = app.otherElements.containing(.navigationBar, identifier:"swiftBasic.BlockSecondView").children(matching: .other).element
        let textField = element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        textField.typeText("aaa")
        element.buttons["Back"].tap()
        goSecondviewcontrollerButton.tap()
        textField.tap()
        textField.typeText("444")
        app.otherElements.containing(.navigationBar, identifier:"swiftBasic.BlockView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        
    }
    
}
