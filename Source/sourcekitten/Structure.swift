import ArgumentParser
import SourceKittenFramework

extension SourceKitten {
    struct Structure: ParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Print Swift structure information as JSON")

        @Option(help: "Relative or absolute path of Swift file to parse")
        var file: String = ""
        @Option(help: "Swift code text to parse")
        var text: String = ""

        mutating func run() throws {
            if !file.isEmpty {
                if let file = File(path: file) {
                    #if DEBUG

                    #endif
                    return
                }
                throw SourceKittenError.readFailed(path: file)
            }
            if !text.isEmpty {
                #if DEBUG

                #endif
                return
            }
            throw SourceKittenError.invalidArgument(
                description: "either file or text must be set when calling \(Self._commandName)"
            )
        }
    }
}
