//
//  NetworkObserver.swift
//  kinda-movie-db
//
//  Created by Arsen Kipachu on 11/10/24.
//
import Foundation
import Network

class NetworkMonitor: ObservableObject {

    private var monitor: NWPathMonitor?
    private let queue = DispatchQueue(label: "NetworkMonitorQueue")

    @Published var isConnected: Bool = true
    @Published var connectionType: NWInterface.InterfaceType = .other

    func startMonitoring() {
        monitor = NWPathMonitor()
        monitor?.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
                self?.connectionType = path.availableInterfaces.first(where: { path.usesInterfaceType($0.type) })?.type ?? .other
            }
        }
        monitor?.start(queue: queue)
    }

    func stopMonitoring() {
        monitor?.cancel()
    }
}
