//
//  HomeList.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/03.
//

import Foundation

// MARK: - ApplyList
struct ApplyList: Codable {
    let resCode: String
    let rows: [ApplyInfo]
    let cnt: Int
}

// MARK: -
struct ApplyInfo: Codable {
    let clnType: Service
    let clnTypeDetail : ServiceDetail//String
    let addr, clnDate: String
    let teamID: Int?
    let teamName: String?
    let matching: String?
    let progress: String?
    let applyID, review: Int
    let stat: CleanStatus

    enum CodingKeys: String, CodingKey {
        case clnType = "cln_type"
        case clnTypeDetail = "cln_type_detail"
        case addr
        case clnDate = "cln_date"
        case teamID = "team_id"
        case teamName = "team_name"
        case matching, progress
        case applyID = "apply_id"
        case review, stat
    }
}

//// MARK: - Row
//struct ApplyInfo: Codable {
//    let clnType, clnTypeDetail, addr, clnDate: String
//    let teamID: Int?
//    let teamName: String?
//    let matching, progress: String
//    let applyID, review: Int
//    let stat: String
//
//    enum CodingKeys: String, CodingKey {
//        case clnType = "cln_type"
//        case clnTypeDetail = "cln_type_detail"
//        case addr
//        case clnDate = "cln_date"
//        case teamID = "team_id"
//        case teamName = "team_name"
//        case matching, progress
//        case applyID = "apply_id"
//        case review, stat
//    }
//}
