//
//  main.m
//  OC03_继承和便利构造器
//

#import <Foundation/Foundation.h>
#import "CommondZombie.h"
#import "BarricadeZombie.h"
#import "Person.h"
#import "Student.h"
#import "CollegeStudent.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        CommondZombie *commondZombie = [[CommondZombie alloc]initWithTotalBlood:80 andLoseBlood:5 andZombieName:@"普通僵尸"];
//        
//        NSLog(@"%@,总血量%ld,每次被攻击失%ld血量",[commondZombie zombieName],
//              [commondZombie totalBlood],[commondZombie loseBlood]);
//        
//        BarricadeZombie *barricade = [[BarricadeZombie alloc]initWithTotalBlood:120 andLoseBlood:3 andZombieName:@"路障僵尸"];
//        NSLog(@"%@,总血量%ld,每次被攻击失%ld血量",[barricade zombieName],[barricade totalBlood],[barricade loseBlood]);
     
        //[barricade sayHi];
        
   //     CollegeStudent *student = [[CollegeStudent alloc]initWithName:@"张三" andAge:23 andSex:@"男"];
        
//        [student setNumber:101];
//        [student setSchool:@"Lanou"];
//        [student setNumber:101];
//        [student setMajor:@"信息管理"];
//        [student setAcademy:@"计算机"];
//        [student study];
        
        
        CollegeStudent * collegeStudent = [[CollegeStudent alloc]initWithMajor:@"计算机" andAcademy:@"ios"];
        NSLog(@"%@, %ld, %@, %@, %ld, %@, %@",[collegeStudent name],[collegeStudent age],[collegeStudent sex],[collegeStudent school],[collegeStudent number],[collegeStudent academy],[collegeStudent major]);
//
        
//        Person *p = [[Person alloc]initWithName:@"张三" andAge:24 andSex:@"男"];
//        NSLog(@"%@, %ld, %@", [student name], [student age], [student sex]);
//        
//        Student *s = [[Student alloc]initWithSchool:@"蓝鸥" andNumber:101];
//        NSLog(@"%@, %ld", [student school], [student number]);
//        
//        CollegeStudent *c = [[CollegeStudent alloc]initWithMajor:@"大学" andAcademy:@"ios"];
//        NSLog(@"%@, %@",[student major],[student academy]);
        
        
//        Person *person = [Person personWithName:@"张三" andSex:@"男" andAge:23];
//         NSLog(@"%@, %@",[person major],[person academy]);
    }
    return 0;
}
