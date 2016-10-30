//: Playground - noun: a place where people can play

import UIKit
//这个工程不需要运行,编译器自动运行
//Swift不需要main函数入口,编译器会在自动在全局函数自动设置为程序的入口,在Swift中,语句不需要以";"结束
/*
print("Hello World")
//Swift2.0 以前的输出语句println("Hello World")

//常量
//常量使用let关键字进行定义
//定义形式1:let 常量名 = 常量值
let a = 10
//定义形式2:let 常量名 :数据类型 = 常量值
let a1 : String = "haha"
print(a1)

//变量
//变量使用var关键字进行定义
//定义形式1: var 变量名 = 变量值
var b = 10
b = 20
//定义形式2: var 变量名 : 数据类型 = 变量值
var b1 : String = "hehe"
b1 = "hehe1"
var b2 : Int = 17
//数据类型是可以省略的,编译器会根据变量值的类型自动生成类型

//Swift 变量/常量的命名更加开发
var 付寒宇 = "🐷"
var 🐷 : String = "付寒宇"
var str = 付寒宇 + 🐷
*/

/*
//Swift 中不支持饮食转换数据类,必须显示转换
var a : Float = 18.5
var b : Int = 10
var c = a + Float(b)

//元祖
//关系数据库中的概念,一个元祖相当于数据表中的一条数据
var person = (name : "付寒宇", age : 30, sex : "?")
person.name
person.0
person.name = "关宜山"
person

//没有key值,只能用0,1,2 取值
var student = ("哈哈", 18, "男")
student.0
student.1
student.2

//数组
//Swift 中的数组要求每个元素的数据类型必须是相同的,如果数据类型不统一,那么将会自动跳转成OC中的数组
//let 定义不可变数组 var定义可变数组
//定义形式 : let/var 数组名 : [数据元素类型] = 数据的值 ps[数据元素类型]是可以省略的
let myArray : [String] = [String]()
var myArrayOne = ["🐔","🐷","🐶","🐘","🐱"];
//修改
myArrayOne[0] = "😄";
//增加
myArrayOne.append("🐔")
//插入
myArrayOne.insert("嘿嘿", atIndex: 0)
//删除
myArrayOne.removeAtIndex(0)
myArrayOne
//闭区间0~2
myArrayOne[0...2]
//半闭半开0~2
myArrayOne[0..<2]

var 🐷 = "付寒宇"
print("\(🐷)真帅")


//字典
//在Swift中要求字典中key必须是统一类型,value必须是统一类型,但是key和value可以是不同类型,如果存在不同类型,那么编译器就会自动将其转换成OC中的字典
//定义一个空字典
//方式1
var dic1 = [Int : String]()//推荐的方法
//方式2
var dic2 = Dictionary<Int, String>()

var dic3 = ["key1" : "value1", "key2" : "value2"]
//通过key值查找value
dic3["key1"]
//通过key值修改value
dic3["key1"] = "haha"
//如果keybucunzia,那就相当于添加一对key value
dic3["key3"] = "value"
dic3
dic3.removeValueForKey("key3")
*/
/*
//可选变量
//这个值可能为空,也可能存在

//条件分支
var a : Bool = false
if a == true {
    print(11111)
}else{
    print(22222)
}

//Switch
//Swift中对switch中的写法做了很大的优化,我们可以不写条件语句的括号,也可以不写break,(系统默认为我们break) 如果我们想强行执行下一个case,需要使用fallthrougt关键字,OC中default是必须存在 但是在Swift中不一定了

var compare = 1
switch compare {
case 1:
    print("111")
case 2:
    print("222")
case 3:
    print("333")
default:
    print("错误")
}


switch compare {
case 1...4:
    print("范围1111")
case 5...6:
    print("范围2222")
default:
    print("错误")
}

//_ 用在那个位置,那个位置就不做判断
var per = (0, 1)
switch per{
case (0, _):
    print("在X轴上")
case (_, 0):
    print("在Y轴上")
default:
    print("不在坐标轴上")
}


//for循环
var sum = 0
//i++ 后面必须加空格,否则报错
for var i = 0; i <= 100; i++ {
    sum = sum + i
}
print(sum)

//for in循环
sum = 0
for f in 1..<100{
    sum = sum + f
}
print(sum)

//while循环
sum = 0
while sum < 100 {
    sum++
}
print(sum)

//do_while
sum = 0
//在Swift2.0 以前是用作do Swift 2.0之后改为 repeat
repeat {
    sum++
}while sum < 100
print(sum)

//-----函数-----
//1无参数,无返回值
func sayHello() {
    print("嘿! 嫂嫂")
}
sayHello()
//2 有参数,无返回值
func getName(name : String) {
    print("名字是\(name)")
}
getName("嫂嫂")

func getPerson (name : String, age : Int, sex : String) {
    print("名字是\(name), 年龄是\(age), 性别是\(sex)")
}
getPerson("嫂嫂", age: 18, sex: "女")

//需要给外部参数加个小名
func getStudent (studentName name : String, studentAge age : Int, studentSex sex : String){
    print("名字是\(name)年龄是\(age)性别是\(sex)")
}
getStudent(studentName: "嫂嫂", studentAge: 10, studentSex: "女")

//默认参数
//默认参数,函数定义的时候,需要在内部参数前加"_" + "空格",并且在参数名之后赋值
//在调用的时候可以不给默认参数赋值,如果赋值的时候,就用传进来的值,不赋值则用默认参数
func getName2(name : String, _ sex : String = "男"){
    print("名字是\(name), 性别是\(sex)")
}
//getName2("嫂嫂")
getName2("嫂嫂", "女")

//3.无参数有返回值
func getName3 () ->String{
    return "哈哈"
}

var myStr = getName3()
print(myStr)

//有参数,有返回值
func getName4 (name : String) ->String{
    return name
}
var myName = getName4("芦彬")
print(myName)

//多参数,多返回值
func getName5 (name : String, sex : String) ->(name1 : String, sex1 : String){
    return (name, sex)
}
var person1 = getName5("姚旭", sex: "男")
print(person1)
//inout
var num = 10
func getName6 (inout number : Int){
    number = 40
}
num
getName6(&num)
num

//不确定参数的个数
func sumNumber (numbers : Int...) ->Int{
    var sum = 0
    for i in numbers{
        sum = sum + i
    }
    return sum
}
var inta = sumNumber(1,2,3,4,5,6,7,8,9)

//类与结构体
//结构体1
struct Student{
    var name : String?
    var age : Int?
    //构造器
    init(name : String, age : Int){
        self.name = name
        self.age = age
    }
}

var stu = Student.init(name: "姚旭", age: 18)
stu.name
stu.age

//类
class Person {
    //定义属性
    var name : String?
    var age : Int?
    
    //定义实例方法 -
    func description() ->String{
        return "这是一个实例"
    }
    //构造器 初始化
    init (name : String, age : Int){
        self.name = name;
        self.age = age
    }
    //类方法 +
    class func text() -> String {
        return "这是一个类方法"
    }
    //析构器
    deinit{
        //移除通知
        //代理置空
    }
}


var 芦彬 = Person.init(name: "芦彬", age: 20)
芦彬.name
芦彬.age

芦彬.description()
Person.text()

class Student1: Person {
    override func description() -> String {
            return "重写父类方法"
    }
}

var stu1 = Student1.init(name: "芦彬", age: 20)
stu1.name
stu1.age
stu1.description()

//代理
protocol myDelegate{
    func sayHello() ->String
}
//Swift2.0 不实现协议的方法全会报错
class heihei: myDelegate {
    func sayHello() -> String {
        return "这是协议"
    }
}

class lubin: Person, myDelegate {
    func sayHello() -> String {
        return "这也是协议"
    }
}
*/


//可变变量
//可变变量的意图在于某一个的变量的值在使用过程中，可以为空，我们需要一个声明
var myString = "123";
var numbers : Int? = Int(myString)
print(numbers ?? <#default value#>)
print(numbers!)

//定义一个函数，传进去一个数字和一个数组，返回一个数组，这个数组里的值都比数字大

var array = [15,20,60,18]
func compare (num : Int, arr : [Int]) ->[Int] {
    var resultArray = [Int]()
    //for in循环
    for i in arr {
        if i > num{

            resultArray.append(i)
        }
    }
    return resultArray;
}
compare (num: 20, arr : array)

//闭包函数
//相当于oc中的block
//闭包的声明：（参数列表）->返回值
//闭包的定义： （参数列表）->返回值 in 函数体

func compare2 (number : Int, myArray : [Int], cb:(_ num1 : Int, _ num2 : Int) ->Bool) ->[Int]{
    var isArray = [Int]()
    for c in myArray {
        if cb(c, number){
            isArray.append(c)
        }
    }
    return isArray
}
compare2 (number: 20, myArray : array) { (num1 , num2) ->Bool in
    return num1 > num2
}










