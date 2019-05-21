import Foundation

extension Optional {
    func or(_ default: Wrapped) -> Wrapped {
        return self ?? `default`
    }
}
