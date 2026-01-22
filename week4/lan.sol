// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// contract Ex4_1 {
//     uint public a = 3;
//     function myFun() public {
//         a = 5;
//     }
// }

// contract Ex4_2 {
//     uint public a = 3;
//     function myFun(uint b, uint c, uint d) public {
//         a = b;
//         a = c;
//         a = d;
//     }
// }

// contract Ex4_3 {
//     uint public a = 3;
//     uint public b = 5;
//     function myFun() public returns(uint, uint) {
//         a = 100;
//         b = 0;
//         return (a, b);
//     }
// }

// contract Ex4_4 {
//     function myFun() public pure returns(uint age, uint weight) {
//         age = 31;
//         weight = 60;
//     }
// }

// contract Ex4_5 {
//     uint public a = 3;
//     uint public b = myFun();

//     function myFun() public returns(uint) {
//         a = 100;
//         return a;
//     }
// }

// contract Ex4_6 {
//     int a;
//     uint b;
//     bool c;
//     bytes d;
//     string e;
//     address f;

//     function assignment() public view returns(int, uint, bool, bytes memory, string memory, address) {
//         return(a, b, c, d, e, f);
//     }
// }
//// 산술 연산자
// contract Ex4_7 {
//     uint a = 5+2;
//     uint b = 5-2;
//     uint c = 5*2;
//     uint d = 5/5;
//     uint e = 5%2;
//     uint f = 5**2;

//     function arithmetic() public view returns(uint, uint, uint, uint, uint, uint) {
//         return(a, b, c, d, e, f);
//     }
// }
//// 복합할당연산자(대입 + 산술연산)
// contract Ex4_8 {
//     uint a = 5;
//     uint b = 5;
//     uint c = 5;
//     uint d = 5;
//     uint e = 5;

//     function assignment() public returns(uint, uint, uint, uint, uint) {
//         a += 2; // a = a + 2
//         b -= 2; // b = b - 2
//         c *= 2; // c = c * 2
//         d /= 5; // d = d / 5
//         e %= 2; // e = e % 2
//         return(a, b, c, d, e);
//     }
// }
//// 증감연산자: 변수 값을 1씩 증가 또는 감수
// contract Ex4_9 {
//     uint a = 5;
    
//     function justA() public view returns(uint) {
//         return a;
//     }

//     function prePlus() public returns(uint) {
//         return ++a; // a = a + 1
//     }

//     function postPlus() public returns(uint) {
//         return a++; // a = a + 1
//     }
// }
//// 증감연산자
// contract Ex4_10 {
//     uint a = 5;
    
//     function justA() public view returns(uint) {
//         return a;
//     }

//     function preMinus() public returns(uint) {
//         return --a; // a = a + 1
//     }

//     function postMinus() public returns(uint) {
//         return a--; // a = a + 1
//     }
// }
//// 비교연산자
// contract Ex4_11 {
//     bool a = 3 > 4;
//     bool b = 3 < 4;
//     bool c = 5 >= 2;
//     bool d = 5 <= 5;
//     bool e = 3 == 2;
//     bool f = 3 != 2;

//     function comparison() public view returns(bool, bool, bool, bool, bool, bool) {
//         return(a, b, c, d, e, f);
//     }
// }
//// 논리연산자(AND, OR, NOT)
// contract Ex4_12 {
//     bool a = true&&true;
//     bool b = true&&false;
//     bool c = false&&false;
//     bool d = true||true;
//     bool e = true||false;
//     bool f = false||false;
//     bool g = !false;

//     function logical() public view returns(bool, bool, bool, bool, bool, bool, bool) {
//         return(a, b, c, d, e, f, g);
//     }
// }
//// 상수(constant) - 변수와 달리 저장한 값을 바꿀 수 없음
// contract Ex4_13 {
//     uint constant A = 13;

//     function plusA() public pure returns(uint) {
//         return A + 10;
//     }

//     function changeA() public {
//         A = 99; // 에러
//     }
// }
//// pure 함수: 함수밖에 선언된 변수를 함수 내부에서 읽거나 변경 불가
// contract Ex4_14 {
//     function myFun(uint a) public pure returns(uint) {
//         return a;
//     }
// }
//// 오류남 - 함수 밖에서 선언된 변수를 변경 불가
// contract Ex4_15 {
//     uint a = 3;
//     function myFun() public pure returns(uint) {
//         a = 4;
//         return a;
//     }
// }
//// view 함수: 함수밖에 선언된 변수를 함수 내부에서 읽을 수 있으나 변경 불가
// contract Ex4_16 {
//     uint public a = 4;

//     function myFun() public view returns(uint) {
//         uint b = a + 5;
//         return b;
//     }
// }
//// 변경 불가 오류
// contract Ex4_17 {
//     uint public a = 3;

//     function myFun() public view returns(uint) {
//         a = 4; // 오류
//         return a;
//     }
// }
//// 솔리디티의 저장 영역 - 참조 타입이 함수의 매개변수, 반환 값 또는 내부 변수로 정의될 때는 저장공간을 명시해야 한다. -> 에러 발생
// contract Ex4_18 {
//     function myFun(string memory str) public pure returns(uint, string memory, bytes memory) {
//             uint num = 99;
//             bytes memory byt = hex"01";
//             return(num, str, byt);
//     }
// }
//// calldata 지정: external 함수의 참조 타입 매개변수
// contract Ex4_19 {
//     function myFun(string calldata str) external pure returns(string memory) {
//         return str;
//     }
// }
//// 상태변수와 지역변수 - 지연변수는 정의된 함수 밖에서 사용할 수 없다
// contract Ex4_20 {
//     uint public a = 3;

//     function myFun1() external view returns(uint, uint) {
//         uint b = 4;
//         return(a, b);
//     }

//     /* 에러
//     function myFun2() external pure returns(uint) {
//         return b;
//     }
//     */
// }