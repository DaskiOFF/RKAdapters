//
//  RKAdaptersTests.swift
//  RKAdaptersTests
//
//  Created by Roman Kotov on 19/08/2018.
//  Copyright © 2018 Roman Kotov. All rights reserved.
//

import XCTest

@testable import RKAdapters

class RKAdaptersTests: XCTestCase {

    var textFieldAdapter: TextFieldAdapter!

    override func setUp() {
        super.setUp()

        textFieldAdapter = TextFieldAdapter()
    }
    
    override func tearDown() {
        textFieldAdapter = nil

        super.tearDown()
    }

    // MARK: - DidReturn
    func test_SetDidReturn() {
        // given
        var wasCalled: Bool = false
        let closure: TextFieldAdapter.DidReturn = { tf in
            wasCalled = true
            return true
        }

        // when
        textFieldAdapter.setDidReturn(closure)
        textFieldAdapter.didReturn?(textFieldAdapter.textField)

        // then
        XCTAssertNil(textFieldAdapter.didBeginEditing)
        XCTAssertNil(textFieldAdapter.didEndEditing)
        XCTAssertNil(textFieldAdapter.didTextChanged)
        XCTAssertNil(textFieldAdapter.shouldChangeCharacters)

        XCTAssertNotNil(textFieldAdapter.didReturn)
        XCTAssertTrue(wasCalled)
    }

    // MARK: - DidBeginEndEditing
    func test_SetDidBeginEditing() {
        // given
        var wasCalled: Bool = false
        let closure: TextFieldAdapter.DidBeginEndEditing = { tf in
            wasCalled = true
        }

        // when
        textFieldAdapter.setDidBeginEditing(closure)
        textFieldAdapter.didBeginEditing?(textFieldAdapter.textField)

        // then
        XCTAssertNil(textFieldAdapter.didReturn)
        XCTAssertNil(textFieldAdapter.didEndEditing)
        XCTAssertNil(textFieldAdapter.didTextChanged)
        XCTAssertNil(textFieldAdapter.shouldChangeCharacters)

        XCTAssertNotNil(textFieldAdapter.didBeginEditing)
        XCTAssertTrue(wasCalled)
    }

    // MARK: - DidEndEditing
    func test_SetDidEndEditing() {
        // given
        var wasCalled: Bool = false
        let closure: TextFieldAdapter.DidBeginEndEditing = { tf in
            wasCalled = true
        }

        // when
        textFieldAdapter.setDidEndEditing(closure)
        textFieldAdapter.didEndEditing?(textFieldAdapter.textField)

        // then
        XCTAssertNil(textFieldAdapter.didReturn)
        XCTAssertNil(textFieldAdapter.didBeginEditing)
        XCTAssertNil(textFieldAdapter.didTextChanged)
        XCTAssertNil(textFieldAdapter.shouldChangeCharacters)

        XCTAssertNotNil(textFieldAdapter.didEndEditing)
        XCTAssertTrue(wasCalled)
    }

    // MARK: - DidTextChanged
    func test_SetDidTextChanged() {
        // given
        var wasCalled: Bool = false
        let closure: TextFieldAdapter.DidTextChanged = { tf, text in
            wasCalled = true
        }

        // when
        textFieldAdapter.setDidTextChanged(closure)
        textFieldAdapter.didTextChanged?(textFieldAdapter.textField, "")

        // then
        XCTAssertNil(textFieldAdapter.didReturn)
        XCTAssertNil(textFieldAdapter.didBeginEditing)
        XCTAssertNil(textFieldAdapter.didEndEditing)
        XCTAssertNil(textFieldAdapter.shouldChangeCharacters)

        XCTAssertNotNil(textFieldAdapter.didTextChanged)
        XCTAssertTrue(wasCalled)
    }

    // MARK: - ShouldChangeCharacters
    func test_SetShouldChangeCharacters() {
        // given
        var wasCalled: Bool = false
        let closure: TextFieldAdapter.ShouldChangeCharacters = { tf, range, string in
            wasCalled = true
            return true
        }

        // when
        textFieldAdapter.setShouldChangeCharacters(closure)
        textFieldAdapter.shouldChangeCharacters?(textFieldAdapter.textField, NSRange(location: 0, length: 0), "")

        // then
        XCTAssertNil(textFieldAdapter.didReturn)
        XCTAssertNil(textFieldAdapter.didBeginEditing)
        XCTAssertNil(textFieldAdapter.didEndEditing)
        XCTAssertNil(textFieldAdapter.didTextChanged)

        XCTAssertNotNil(textFieldAdapter.shouldChangeCharacters)
        XCTAssertTrue(wasCalled)
    }
}
