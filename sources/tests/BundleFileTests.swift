@testable import Kit
import XCTest

final class BundleFileTests: XCTestCase
{
    func testBundleFile_reads_resource_from_package_under_test() throws {
        let file = BundleFile(filename: "empty.json", bundle: BundleReference.bundle)
        XCTAssertNotNil(try file.data)
        XCTAssertNotNil(try file.string)
    }

    func testBundleFile_reads_resource_from_test_package() throws {
        let file = BundleFile(filename: "emptytestfile.json", bundle: Bundle.module)
        XCTAssertNotNil(try file.data)
        XCTAssertNotNil(try file.string)
    }

    func testBundleFile_throws_when_reading_missing_file() throws {
        do {
            let filename = "missing-file"
            _ = try BundleFile(filename: filename, bundle: Bundle.module).url
        } catch FileError.missingFilename {
            return
        }
        XCTFail("Expected to throw when trying to read missing file")
    }
}
