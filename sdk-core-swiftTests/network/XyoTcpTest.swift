
//
//  TcpTest.swift
//  sdk-core-swiftTests
//
//  Created by Carter Harrison on 1/29/19.
//  Copyright © 2019 XYO Network. All rights reserved.
//

import Foundation
import XCTest
import sdk_objectmodel_swift
@testable import sdk_core_swift

class XyoTcpSocketTest : XCTestCase {
    
    func testClient () throws {
        let node = XyoOriginChainCreator(hasher: XyoSha256(), blockRepository: try XyoStrageProviderOriginBlockRepository(storageProvider: XyoInMemoryStorage(), hasher: XyoSha256()))
        
        let socket = XyoTcpSocket.create(ip: "127.0.0.1", port: 6968)
        let pipe = XyoTcpSocketPipe(socket: socket, initiationData: nil)
        let handler = XyoNetworkHandler(pipe: pipe)
        
        try node.doNeogeoationThenBoundWitness(handler: handler, procedureCatalogue: XyoFlagProcedureCatalogue(forOther: 0xff, withOther: 0xff))
        
    }
    
}
