// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

// contract Monitor {
//     string public name;
//     constructor(string memory _name) {
//         name = _name;
//     }

//     function show() public pure returns(string memory) {
//         return "show";
//     }
// }

// contract SystemUnit {
//     string public name = "XG12";
     
//     function turnOn() public pure returns(string memory) {
//         return "turnOn";
//     }
// }

// contract Computer {
//     Monitor public monitor;                                                                                                                                                                                                                                                                                                                                                                                                                                               
//     SystemUnit public systemUnit;

//     constructor() {
//         monitor = new Monitor("DW12");
//         systemUnit = new SystemUnit();
//     }

//     function getAllNames() public view returns(string memory, string memory) {
//         return(monitor.name(), systemUnit.name());
//     }

//     function start() public view returns(string memory, string memory) {
//         return(monitor.show(), systemUnit.turnOn());
//     }
// }

// contract Number {
//     uint private num = 4;
//     function changeNum() public {
//         num = 5;
//     }
//     function getNum() public view returns(uint) {
//         return num;
//     }
// }

// contract Caller {
//     Number internal instance = new Number();
//     function changeNumber() public {
//         instance.changeNum();
//     }
//     function getNumber() public view returns(uint) {
//         return instance.getNum();
//     }
// }

// contract Student {
//     string public schoolName = "The University of Solidity";
// }

// contract ArtStudent is Student {
//     function changeSchoolName() public {
//         schoolName = "The University of Blockchain";
//     }
//     function getSchoolName() public view returns(string memory) {
//         return schoolName;
//     }
// }

// contract Student {
//     string public schoolName = "The University of Solidity";
//     string public major;
//     constructor(string memory _major) {
//         major = _major;
//     }
// }

// contract ArtStudent is Student("Art") {
// }

// contract MusicStudent is Student {
//     constructor() Student("Music"){
//     }
// }

// contract MathStudent is Student {
//     constructor(string memory _major) Student(_major) {
//     }
// }

// contract Student {
//     string private schoolName = "Solidity University"; // 정의된 contract 내부에서만 접근 가능
//     string internal schoolNumbers = "02-1234-5678"; // 상속받은 스마트컨트랙트에서도 접근 가능
// }

// contract ArtStudent is Student {
//     /*
//     function getSchoolName() public view returns(string memory) {
//         return schoolNmae; // 에러
//     }
//     */
    
//     function getSchoolNumbers() public view returns(string memory) {
//         return schoolNumbers;
//     }
// }

//// Overriding - 부모: virtual, 자식: override 사용
// contract Student {
//     function major() public pure virtual returns(string memory) {
//         return "Math";
//     }
// }

// contract ArtStudent is Student {
//     function major() public pure override returns(string memory) {
//         return "Art";
//     }
// }

//// Overloading
// contract Calculator {
//     function mul(uint _num1, uint _num2) public pure returns(uint) {
//         return _num1* _num2;
//     }

//     function mul(uint _num1, uint _num2, uint _num3) public pure returns(uint) {
//         return _num1* _num2* _num3;
//     }
// }

// contract Ex6_1 {
//     Calculator internal calculator = new Calculator();
//     function getNumbers() public view returns(uint, uint) {
//         return (calculator.mul(4,5), calculator.mul(4,5,6));
//     }
// }

//// super: 부모 컨트랙트 함수 호출
// contract Student {
//     string[] internal courses;
//     function showCourses() public virtual returns(string[] memory) {
//         delete courses;
//         courses.push("English");
//         courses.push("Music");
//         return courses;
//     }
// }

// contract ArtStudent is Student {
//     function showCourses() public override returns(string[] memory) {
//         super.showCourses();
//         courses.push("Art");
//         return courses;
//     }
// }

//// 부모 스마트 컨트랙트 자료형으로 선언한 인스턴스 
// contract Animal {
//     function getName() public pure virtual returns(string memory) {
//         return "Animal";
//     }
// }

// contract Tiger is Animal {
//     function getName() public pure override returns(string memory) {
//         return "Tiger";
//     }
// }

// contract Turtle is Animal {
//     function getName() public pure override returns(string memory) {
//         return "Turtle";
//     }
// }

// contract AnimalSet {
//     Animal public tiger = new Tiger();
//     Animal public turtle = new Turtle();

//     function getAllNames() public view returns(string memory, string memory) {
//         return (tiger.getName(), turtle.getName());
//     }

//     function whatIsTheName(Animal _animal) public pure returns(string memory) {
//         return (_animal.getName());
//     }
// }

//// 다중상속: 여러 개의 스마트 컨트랙트 상속
// contract ArtStudent {
//     string public schoolName = "The Solidity University";
//     uint public schoolHours = 5;
// }

// contract PartTimer {
//     string public workPlace = "A pizza shop";
//     uint public workingHours = 6;
// }

// contract Alice is ArtStudent, PartTimer {
//     uint public totalHours = schoolHours + workingHours;
// }

//// 추상 컨트랙트: abstract 키워드 - 함수 구현 X, 선언부만을 가짐
abstract contract System {
    uint internal version;
    bool internal errorPass;

    function versionCheck() internal virtual;
    function errorCheck() internal virtual;

    function boot() public returns(uint, bool) {
        versionCheck();
        errorCheck();
        return(version, errorPass);
    }
}

contract Computer is System {
    function versionCheck() internal override {
        version = 3;
    }

    function errorCheck() internal override {
        errorPass = true;
    }
}

contract SmartPhone is System {
    function versionCheck() internal override {
        version = 25;
    }

    function errorCheck() internal override {
        errorPass = false;
    }
}