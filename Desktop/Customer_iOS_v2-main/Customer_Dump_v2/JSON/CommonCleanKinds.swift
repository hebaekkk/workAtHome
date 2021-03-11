//
//  CommonCleanKinds.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/03.
//

import Foundation

enum Service: String, Codable {
    case jr = "jr"
    case ts = "ts"
    case pg = "pg"
    case cg = "cg"
    
    func returnString() -> String {
        switch self {
        case .jr:
            return "정리수납"
        case .ts:
            return "특수청소"
        case .pg:
            return "폐기물"
        case .cg:
            return "철거"
        }
    }
}


enum ServiceDetail: String, Codable {
    
    case TS001
    case TS002
    case TS003
    case TS004
    case TS005
    case TS006
    case TS007
    case TS008
    
    case JR001
    case JR002
    case JR003
    case JR004
    case JR005
    case JR006
    case JR007
    case JR008
    case JR009
    case JR010
    
    case CG001
    case CG002
    case CG003
    case CG004
    case CG005
    case CG006
    case CG007
    case CG008 
    case CG009
    case CG010
    
    case PG001
    case PG002
    case PG003
    case PG004
    case PG005
    case PG006
    case PG007
    case PG008
 
    var detailClean: String {
        switch self {
        case .TS001:
            return "집쓰레기배출/청소"
        case .TS002:
            return "이사 후 퇴실청소"
        case .TS003:
            return "유품정리/고독사"
        case .TS004:
            return "화재현장청소"
        case .TS005:
            return "사고현장정리"
        case .TS006:
            return "빈집만들기"
        case .TS007:
            return "침수/수해복구 청소"
        case .TS008:
            return "기타특수청소"
        case .JR001:
            return "집 전체"
        case .JR002:
            return "주방"
        case .JR003:
            return "드레스룸/옷방(의류)"
        case .JR004:
            return "베란다/다용도실"
        case .JR005:
            return "거실"
        case .JR006:
            return "방 1개"
        case .JR007:
            return "방 2개"
        case .JR008:
            return "방 3개"
        case .JR009:
            return "이삿짐 정리"
        case .JR010:
            return "상담 후 결정"
        case .CG001:
            return "주택(주거공간)"
        case .CG002:
            return "사무실"
        case .CG003:
            return "학원/독서실/PC방"
        case .CG004:
            return "상가"
        case .CG005:
            return "식당/공유주방"
        case .CG006:
            return "카페/제과점"
        case .CG007:
            return "유흥주점/노래방"
        case .CG008:
            return "미용/피부/네일/마사지샵"
        case .CG009:
            return "병원/의원/약국"
        case .CG010:
            return "건물/외부구조물"
        case .PG001:
            return "생활폐기물"
        case .PG002:
            return "사업장폐기물"
        case .PG003:
            return "건축폐기물"
        case .PG004:
            return "인테리어폐기물"
        case .PG005:
            return "혼합폐기물"
        case .PG006:
            return "목재(MDF)"
        case .PG007:
            return "고철/재활용"
        case .PG008:
            return "가구/가전제품"
        }
    }
}
