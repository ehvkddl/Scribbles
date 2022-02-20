import Foundation

enum DateParseError: Error {
    case overSizeString
    case underSizeString
    case incorrectFormat(part: String)
    case incorrectData(part: String)
}
struct Date {
    var year: Int
    var month: Int
    var date: Int
}

func parseDate(param: NSString) throws -> Date {
    //0000-00-00 입력된 문자열의 길이가 10이 아닐 경우 분석이 불가능하므로 오류
    guard param.length == 10 else {
        if param.length > 10 {
            throw DateParseError.overSizeString
        } else {
            throw DateParseError.underSizeString
        }
    }
    
    //반환할 객체 타입 선언
    var dateResult = Date(year: 0, month: 0, date: 0)
    
    //연도 정보 분석
    if let year = Int(param.substring(with: NSRange(location: 0, length: 4))) {
        dateResult.year = year
    } else {
        throw DateParseError.incorrectFormat(part: "year")
    }
    
    //월 정보 분석
    if let month = Int(param.substring(with: NSRange(location: 5, length: 2))) {
        guard month > 0 && month < 13 else {
            throw DateParseError.incorrectData(part: "month")
        }
        dateResult.month = month
    } else {
        throw DateParseError.incorrectFormat(part: "month")
    }
    
    
}
