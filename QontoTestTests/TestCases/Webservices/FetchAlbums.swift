//
//  FetchAlbums.swift
//  QontoTest
//
//  Created by Lamine NDIAYE on 01/12/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import XCTest

class FetchAlbums: QontoTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
  
  func test_Albums_should_be_fetched_with_invalid_json_then_return_zero_element() {
    //Arrange
    setupStubWithEmptyjson()
    let requestExpectation = expectation(description: "request completion")
    var fetchedAlbums: [Album]?
    //Act
    WebService.fetchAlbums(0) { (albums, error) -> () in
      fetchedAlbums = albums
      requestExpectation.fulfill()
      
    }
    //Assert
    waitForExpectations(timeout: RequestTimeout, handler: { error in
      XCTAssertNil(fetchedAlbums?.first, "should return nil")
    })
  }
  
  func test_Albums_should_be_fetched_with_error_then_return_zero_element() {
    //Arrange
    setupStubWithError()
    let requestExpectation = expectation(description: "request completion")
    var fetchedAlbums: [Album]?
    //Act
    
    WebService.fetchAlbums(0) { (albums, error) -> () in
      fetchedAlbums = albums
      requestExpectation.fulfill()
    }
    
    //Assert
    waitForExpectations(timeout: RequestTimeout, handler: { error in
      XCTAssertNil(fetchedAlbums?.first, "should return nil")
    })
  }
  
    
}
