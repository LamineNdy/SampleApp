//
//  QontoTestCase.swift
//  QontoTest
//
//  Created by Lamine NDIAYE on 01/12/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import XCTest
import OHHTTPStubs

let RequestTimeout: TimeInterval = 30
let SucceedStatus: Int32 = 200
let ContentTypeKey = "Content-Type"
let ContentTypeValue = "application/json"


class SampleAppTestCase: XCTestCase {
    
  override func setUp() {
    super.setUp()
    OHHTTPStubs.removeAllStubs()
  }
  
  override func tearDown() {
    OHHTTPStubs.removeAllStubs()
    super.tearDown()
    
  }
  
  func setupStub(filename : String, status : Int32) {
    stub(condition: isExtension("json")) { _ in
      let stubPath = OHPathForFile(filename, type(of: self))
      return fixture(filePath: stubPath!, headers: [ContentTypeKey as NSObject: ContentTypeValue as AnyObject])
    }
  }
  
  func setupStubWithEmptyjson() {
    stub(condition: isMethodGET()) { _ in
      return OHHTTPStubsResponse(data: NSData() as Data, statusCode:204, headers:[ContentTypeKey: ContentTypeValue])
    }
  }
  
  func setupStubWithjson(json: AnyObject!) {
    stub(condition: isMethodGET()) { _ in
      return OHHTTPStubsResponse(jsonObject: json, statusCode: 200, headers:[ContentTypeKey: ContentTypeValue])
    }
  }
  
  func setupStubWithError() {
    stub(condition: isMethodGET()) { _ in
      return OHHTTPStubsResponse(error: NSError(domain: "error", code: 400, userInfo: nil))
    }
  }
 
}
