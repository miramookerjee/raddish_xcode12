import XCTest
@testable import raddish

class ServerResponseTests: XCTestCase {

  // MARK: - Testing Server Response Asynchronously
  // Simply testing first that the server is responding and sending data (no tests on what the response is)
  
  // Start with a basic setup method
  let expired: TimeInterval = 6
  var expectation: XCTestExpectation!

  override func setUp() {
    expectation = expectation(description: "Server responds in reasonable time")
  }
  
  
  // Test the negative case first with a nonsense URL
  func test_noServerResponse() {
    defer { waitForExpectations(timeout: expired) }

    let url = URL(string: "fred")!
    URLSession.shared.dataTask(with: url) { data, response, error in

      XCTAssertNil(data)
      XCTAssertNil(response)
      XCTAssertNotNil(error)
      
      self.expectation.fulfill()
    }
    .resume()
  }
  
  // Now test the affirmative case with Meal DB API URL
  func test_ServerResponse1() {
    defer { waitForExpectations(timeout: expired) }

    let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata")!
    URLSession.shared.dataTask(with: url) { data, response, error in

      XCTAssertNotNil(data)
      XCTAssertNotNil(response)
      XCTAssertNil(error)
      
      self.expectation.fulfill()
    }
    .resume()
  }
  
  // Now test the affirmative case with Meal DB API URL
  func test_ServerResponse2() {
    defer { waitForExpectations(timeout: expired) }

    let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=Soup")!
    URLSession.shared.dataTask(with: url) { data, response, error in
      XCTAssertNotNil(data)
      XCTAssertNotNil(response)
      XCTAssertNil(error)
      
      self.expectation.fulfill()
    }
    .resume()
  }
  
  // Now test the case with MealDB API with a 404
  func test_404Error() {
    defer { waitForExpectations(timeout: expired) }

    let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search")!
    URLSession.shared.dataTask(with: url) { data, response, error in

      XCTAssertNotNil(data)
      XCTAssertNotNil(response)
      XCTAssertNil(error)
      do {
        let response = try XCTUnwrap(response as? HTTPURLResponse)
        XCTAssertEqual(response.statusCode, 404)

      } catch { }
      
      self.expectation.fulfill()
    }
    .resume()
  }
  
//Now test the case with MealDB API with invalid parameters (a null response)
  func test_invalidParameters() {
    defer { waitForExpectations(timeout: expired) }

    let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=Salmoon")!
    URLSession.shared.dataTask(with: url) { data, response, error in

      XCTAssertNotNil(data)
      XCTAssertNotNil(response)
      XCTAssertNil(error)
      guard let data = data else {
          print("Error: No data to decode")
          return
        }
      
        guard let result = try? JSONDecoder().decode(Result.self, from: data) else {
          print("Error: Couldn't decode data into a result")
          self.expectation.fulfill()
          return
      }
    }
    .resume()
  }

}
