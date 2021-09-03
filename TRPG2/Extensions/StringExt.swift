//
//  StringExt.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/09/03.
//

import Foundation

extension String {
    init(numerator: Int, denominator: Int) {
        self.init("\(numerator)/\(denominator)")
    }
}
