//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by QL Jeong on 2023/08/29.
//

import Foundation

class Person {
    enum Gender {
        case male, female, other
    }

    private(set) var name: String
    private(set) var age: Int
    private(set) var gender: Person.Gender
    private(set) var mbti: MBTI
    private(set) var money: Int

    init(name: String, age: Int, gender: Person.Gender, mbti: MBTI, money: Int) {
        self.name = name
        self.age = age
        self.gender = gender
        self.mbti = mbti
        self.money = money
    }
}

// MARK: - Public

extension Person {
    func buyCoffee(_ coffee: Coffee, atShop shop: CoffeeShop) -> String {
        var result = ""
        let orderStatus = shop.requestOrder(coffee: coffee, from: self)
        switch orderStatus {
        case .success(let pickUpNumber):
            result = "\(pickUpNumber)번 손님 주문하신 \(coffee) 나왔습니다."
        case .failure(let error):
            result = error.message
        }

        return result
    }

    func increaseMoney(_ amount: Int) {
        money += amount
    }

    func requestPayment(_ amount: Int) -> Bool {
        if money < amount {
            return false
        }

        money -= amount
        return true
    }
}

// MARK: - Description

extension Person.Gender: CustomStringConvertible {
    var description: String {
        switch self {
        case .male:
            return "남성"
        case .female:
            return "여성"
        case .other:
            return "기타"
        }
    }
}