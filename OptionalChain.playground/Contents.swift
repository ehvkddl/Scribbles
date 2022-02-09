//옵셔널 타입의 문제점
struct Human {
    var name: String?
    var man: Bool = true
}

var boy: Human? = Human(name: "홍길동", man: true)

if boy != nil {
    if boy!.name != nil {
        print("이름은 \(boy!.name!)입니다")
    }
}

if let b = boy {
    if let name = b.name {
        print("이름은 \(name)입니다")
    }
}


struct Company {
    var ceo: Human?
    var companyName: String?
    func getCEO() -> Human? {
        return self.ceo
    }
}
var startup: Company? = Company(ceo: Human(name: "나대표", man: false), companyName: "루비페이퍼")

if let company = startup {
    if let ceo = company.ceo {
        if let name = ceo.name {
            print("대표이사의 이름은 \(name)입니다")
        }
    }
}

if let name = startup!.ceo!.name {
    print("대표이사의 이름은 \(name)입니다")
}

if let name = startup?.ceo?.name {
    print("optional chain: 대표이사의 이름은 \(name)입니다")
}

//옵셔널 체인으로 참조된 값은 무조건 옵셔널 타입으로 반환 (마지막 값이 옵셔널 타입이 아닌 일반 값이어도)
print(startup?.ceo?.man)
//옵셔널 체인으로 처리된 값은 그 과정에서 몇 번의 옵셔널 체인이 반복되더라도 하나의 옵셔널 객체로만 반환


var someCompany: Company? = Company(ceo: Human(name: "팀 쿡", man: true), companyName: "Apple")
let name = someCompany?.getCEO()?.name
if name != nil {
    print("대표이사의 이름은 \(name!)입니다.")
}
