//
//  BlockViewController.swift
//  swiftBasic
//
//  Created by 徐沈俊杰 on 2016/12/19.
//  Copyright © 2016年 tinypace. All rights reserved.
//

import UIKit

class BlockViewController: UIViewController {
    var name : String?
    var age : Int?
    ///使用func 声明一个函数。通过函数名称和参数调用一个函数。使用->区分参数名和函数返回的类型。
    func printName(myName:String?) -> Void {
        print("Hello \(myName!)")
    }
    
    //函数声明中包含外部参数名和内部参数名，外部参数名是用来说明用的，内部参数名是函数内部使用的
    func printNameAndAge(with myName:String?, _ myAge:Int?) -> Void {
        print("\(myName!) is \(myAge!) years old.")
    }
    
    //当函数需要返回多个值的时候，可以使用元组来返回
    func caculateStatistics(scores:[Int])->(min:Int,max:Int,sum:Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        
        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            
            sum += score
        }
        
        return (min,max,sum)
    }
    
    //一个函数可以将另一个函数作为返回值返回
    func makeIncrementer() -> ( (Int) -> Int ) {
        //(Int) -> Int 表示返回函数的参数类型和返回类型
        func addOne(number:Int) ->Int {
            return 1+number
        }
        return addOne
    }
    
    //一个函数也可以用其他函数作为参数
    func hasAnyMatches(list: [Int], condition:(Int)->Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    func lessThanTen(number:Int) -> Bool {
        return number < 10
    }
    
    //可变参数函数
    //可变参数函数是指函数可以接收不固定个参数。在参数类型后面添加 … 来标记这个参数为可变参数。
    func foo(names:String...) ->() {
        for name in names {
            print("\(name)")
        }
    }
    
    //In-out 参数函数
    func swapTwoInts( a: inout Int, b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name = "Jiles"
        age = 20
        
        printName(myName: name)
        printNameAndAge(with: name, age)
        
        let statistics = caculateStatistics(scores:[5,3,100,3,9])
        print(statistics.min)
        print(statistics.1)
        
        let number = makeIncrementer() // 返回的是addOne函数
        let res = number(7)
        print(res)
        
        let numbers = [20, 19, 7, 12]
        //只要number数组有一个元素小于10就返回true
        let isLessTen = hasAnyMatches(list:numbers,condition:lessThanTen)
        print(isLessTen)
        
        foo(names: "zhao","zhang","wang")
        
        var firstNumber = 3
        var secondNumber = 107
        swapTwoInts(a: &firstNumber, b: &secondNumber)
        print(firstNumber)
        print(secondNumber)
        
        let names = ["zhao","wang","Li"]
        let array = names.map({
            name in
            "\(name) has been map !"
        })
        print(array)
        
        let sortNames = names.sorted()
        print(sortNames)
    }
}
