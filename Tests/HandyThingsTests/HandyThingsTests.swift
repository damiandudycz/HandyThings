import XCTest
@testable import HandyThings

final class HandyThingsTests: XCTestCase {
    
    func testDispatchQueueInitWithRawRepresentable() {
        enum TestEnum: String {
            case foo
        }
        let queue = DispatchQueue(label: TestEnum.foo)
        XCTAssertEqual(queue.label, TestEnum.foo.rawValue)
    }
    
    static var allTests = [
        ("testDispatchQueueInitWithRawRepresentable", testDispatchQueueInitWithRawRepresentable),
    ]
}
