//
//  detailApplyInfo.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/08.
//

import Foundation


// MARK: - DetailApply
struct DetailApply: Codable {
    let resCode: String
    let row: DetailApplyInfo
}

// MARK: - Row
struct DetailApplyInfo: Codable {
    let customerKey: String?
    let partnerKey: Int?
    let clnDate, addr, addrDetail, matching: String?
    let progress: String?
    let review: Int?
    let clnType: Service
    let clnTypeDetail: ServiceDetail//String?
    let room, bath: Int?
    let payment, addInfo: String?
    let deleted, requestReview: Int?
    let addrKey: JSONNull?
    let writeDt: String?
    let applyKey: Int?
    let pet: String?
    let py, kitchen, submit: Int?
    let applyImg: [String]?

    let elevator    : String?
    let balcony: Int?
    let vehicle: String?
    let vehicleCnt: Int?
    let worker: Int?
    let detail: String?
    
    enum CodingKeys: String, CodingKey {
        case customerKey = "customer_key"
        case partnerKey = "partner_key"
        case clnDate = "cln_date"
        case addr
        case addrDetail = "addr_detail"
        case matching, progress, review
        case clnType = "cln_type"
        case clnTypeDetail = "cln_type_detail"
        case room, bath, payment
        case addInfo = "add_info"
        case deleted
        case requestReview = "request_review"
        case addrKey = "addr_key"
        case writeDt = "write_dt"
        case applyKey = "apply_key"
        case pet, py, kitchen, submit
        case applyImg = "apply_img"
        
        case elevator, balcony, vehicle
        case vehicleCnt = "vehicle_cnt"
        case worker
        case detail

    }
}
