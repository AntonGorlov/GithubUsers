//
//  ApplicationCoordinatorTest.swift
//  GithubUsersTests
//
//  Created by Anton Gorlov on 01.10.2022.
//

import XCTest
@testable import GithubUsers

class ApplicationCoordinatorTest: XCTestCase {
    
    //red, green, refactor
    
    func testStartCoordinator() {
        
        let sut = makeSUT()
        
        let _ = sut.start()
    }
    
    func testEmptyChildsAnyCoordinator() {
        
        //given
        let sut = makeSUT()
        
        //then
        let childs = sut.childs
        
        //when
        XCTAssertTrue(childs.isEmpty, "array of childs coordinator are not empty ")
    }
    
    func testAddChildCoordinatorToApplicationCoordinator() {
        
        let sut = makeSUT()
        
        sut.coordinate(to: sut)
        let childs = sut.childs
        
        XCTAssertEqual(childs.count, 1, "A child doesn't add to the application coordinator")
    }
    
    func testParentCoordinatorIsNotNil() throws {
        
        let sut = makeSUT()
        
        sut.coordinate(to: sut)
        
        XCTAssertNotNil(sut.parent, "Parent coordinator is nil")
    }
    
    func testRemoveChildFromParentApplicationCoordinator() throws {
        
        let sut = makeSUT()
        
        sut.coordinate(to: sut)
        sut.finish()
        
        let parent = try XCTUnwrap(sut.parent)
        XCTAssertTrue(parent.childs.isEmpty, "The number of objects in the array of the current coordinator is not equal to 0")
    }
   
    func testAddOtherChildCoordinatorToApplicationCoordinator() {
        
        let sut = makeSUT()
        
        let otherCoordinator = OtherCoordinatorDummy()
        sut.coordinate(to: sut)
        sut.coordinate(to: otherCoordinator)
        
        XCTAssertEqual(sut.childs.count, 2, "A coordinator object has not been added to the array of the childs")
    }
    
    func testAddTheSameChildCoordinatorToApplicationCoordinator() {
        
        let sut = makeSUT()
        
        sut.coordinate(to: sut)
        sut.coordinate(to: sut)
        
        XCTAssertEqual(sut.childs.count, 1, "The same coordinator object has been added to the array of the childs")
    }
    
    private func makeSUT() -> AnyCoordinator {
        
        return ApplicationCoordinatorDummy()
    }
}
