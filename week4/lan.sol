// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// 간단한 함수 정의
contract Ex4_1 {
    uint public a = 3;
    function myFun() public {
        a = 5;
    }
}
// 매개변수(parameter)가 있는 function 정의
contract Ex4_2 {
    uint public a = 3;
    function myFun(uint b, uint c, uint d) public {
        a = b;
        a = c;
        a = d;
    }
}
// 반환(return) 값이 있는 function 정의
contract Ex4_3 {
    uint public a = 3;
    uint public b = 5;
    function myFun() public returns(uint, uint) {
        a = 100;
        b = 0;
        return (a, b);
    }
}
// 반환 자료형과 함께 변수명 선언
contract Ex4_4 {
    function myFun() public pure returns(uint age, uint weight) {
        age = 31;
        weight = 60;
    }
}
// 함수의 반환값 활용
contract Ex4_5 {
    uint public a = 3;
    uint public b = myFun();

    function myFun() public returns(uint) {
        a = 100;
        return a;
    }
}
// 자료형에 따른 각 변수의 기본값
contract Ex4_6 {
    int a;
    uint b;
    bool c;
    bytes d;
    string e;
    address f;

    function assignment() public view returns(int, uint, bool, bytes memory, string memory, address) {
        return(a, b, c, d, e, f);
    }
}
// 산술 연산자
contract Ex4_7 {
    uint a = 5+2;
    uint b = 5-2;
    uint c = 5*2;
    uint d = 5/5;
    uint e = 5%2;
    uint f = 5**2;

    function arithmetic() public view returns(uint, uint, uint, uint, uint, uint) {
        return(a, b, c, d, e, f);
    }
}
// 복합할당연산자(대입 + 산술연산)
contract Ex4_8 {
    uint a = 5;
    uint b = 5;
    uint c = 5;
    uint d = 5;
    uint e = 5;

    function assignment() public returns(uint, uint, uint, uint, uint) {
        a += 2; // a = a + 2
        b -= 2; // b = b - 2
        c *= 2; // c = c * 2
        d /= 5; // d = d / 5
        e %= 2; // e = e % 2
        return(a, b, c, d, e);
    }
}
// 증감연산자: 변수 값을 1씩 증가 또는 감수
contract Ex4_9 {
    uint a = 5;
    
    function justA() public view returns(uint) {
        return a;
    }

    function prePlus() public returns(uint) {
        return ++a; // a = a + 1
    }

    function postPlus() public returns(uint) {
        return a++; // a = a + 1
    }
}
// 증감연산자
contract Ex4_10 {
    uint a = 5;
    
    function justA() public view returns(uint) {
        return a;
    }

    function preMinus() public returns(uint) {
        return --a; // a = a + 1
    }

    function postMinus() public returns(uint) {
        return a--; // a = a + 1
    }
}
// 비교연산자
contract Ex4_11 {
    bool a = 3 > 4;
    bool b = 3 < 4;
    bool c = 5 >= 2;
    bool d = 5 <= 5;
    bool e = 3 == 2;
    bool f = 3 != 2;

    function comparison() public view returns(bool, bool, bool, bool, bool, bool) {
        return(a, b, c, d, e, f);
    }
}
// 논리연산자(AND, OR, NOT)
contract Ex4_12 {
    bool a = true&&true;
    bool b = true&&false;
    bool c = false&&false;
    bool d = true||true;
    bool e = true||false;
    bool f = false||false;
    bool g = !false;

    function logical() public view returns(bool, bool, bool, bool, bool, bool, bool) {
        return(a, b, c, d, e, f, g);
    }
}
// 상수(constant) - 변수와 달리 저장한 값을 바꿀 수 없음
contract Ex4_13 {
    uint constant A = 13;

    function plusA() public pure returns(uint) {
        return A + 10;
    }

//     function changeA() public {
//         A = 99; // 에러
//     }
}
// pure 함수: 함수밖에 선언된 변수를 함수 내부에서 읽거나 변경 불가
contract Ex4_14 {
    function myFun(uint a) public pure returns(uint) {
        return a;
    }
}
// 오류남 - 함수 밖에서 선언된 변수를 변경 불가
// contract Ex4_15 {
//     uint a = 3;
//     function myFun() public pure returns(uint) {
//         a = 4;
//         return a;
//     }
// }
// view 함수: 함수밖에 선언된 변수를 함수 내부에서 읽을 수 있으나 변경 불가
contract Ex4_16 {
    uint public a = 4;

    function myFun() public view returns(uint) {
        uint b = a + 5;
        return b;
    }
}
// 변경 불가 오류
contract Ex4_17 {
    uint public a = 3;

    function myFun() public view returns(uint) {
        // a = 4; // 오류
        return a;
    }
}
// 솔리디티의 저장 영역 - 참조 타입이 함수의 매개변수, 반환 값 또는 내부 변수로 정의될 때는 저장공간을 명시해야 한다. -> 에러 발생
contract Ex4_18 {
    function myFun(string memory str) public pure returns(uint, string memory, bytes memory) {
            uint num = 99;
            bytes memory byt = hex"01";
            return(num, str, byt);
    }
}
// calldata 지정: external 함수의 참조 타입 매개변수
contract Ex4_19 {
    function myFun(string calldata str) external pure returns(string memory) {
        return str;
    }
}
// 상태변수와 지역변수 - 지연변수는 정의된 함수 밖에서 사용할 수 없다
contract Ex4_20 {
    uint public a = 3;

    function myFun1() external view returns(uint, uint) {
        uint b = 4;
        return(a, b);
    }

    /* 에러
    function myFun2() external pure returns(uint) {
        return b;
    }
    */
}

// 함수와 가시성 지정자 
contract Ex4_21 {
    uint public pub = 1;
    uint private pri = 2;
    uint internal inter = 3;
    // uint external ext = 4; // external은 변수 적용 불가

    function funPub() public view returns(uint, uint, uint) {
        return(pub, pri, inter);
    }

    function funPriv() private view returns(uint, uint, uint) {
        return(pub, pri, inter);
    }

    function funInter() internal view returns(uint, uint, uint) {
        return(pub, pri, inter);
    }

    function funExt() external view returns(uint, uint, uint) {
        return(pub, pri, inter);
    }
}
// - public (pub): 모든 곳에서 접근 가능. Solidity가 자동으로 변수 값을 읽을 수 있는 'Getter 함수'를 만들어줌.

// - private (pri): 오직 현재 컨트랙트 내부에서만 읽고 쓸 수 있음. (상속받은 자식 컨트랙트도 접근 불가)

// - internal (inter): 현재 컨트랙트와 이를 상속받은 자식 컨트랙트에서 접근 가능. (상태 변수의 기본값)

// - external: 변수에는 사용할 수 없음. external은 오직 함수에만 사용 가능하기 때문에 코드에서 주석 처리가 되어 있는 것.

// external 함수는 내부 접근 불가
contract Ex4_22 {
    function funExt() external pure returns(uint) {
        return 2;
    }

    function funPri() private pure returns(uint) {
        return 3;
    }

    /*
    function outPutExt() public pure returns(uint) {
        return funExt(); // external 함수 내부 접근 불가
    }
    */

    function outPutPri() public pure returns(uint) {
        return funPri();
    }
}
// 함수와 가시성 지정자 - this를 이용해 external 함수 내부 접근
contract Ex4_23 {
    function funExt() external pure returns(uint) {
        return 2;
    }

    function outPutExt() public view returns(uint) {
        return this.funExt(); // this 호출은 외부 호출로 간주함
    }
}
// 조건문(if)
contract Ex4_24 {
    function fun1(uint a) public pure returns(uint) {
        if (a>=10) {
            a = 9;
        }
        return a;
    }
}
// if-else
contract Ex4_25 {
    function fun1(uint a) public pure returns(uint) {
        if(a > 3) {
            a = 9;
        } else {
            a = 10;
        }
        return a;
    }
}
// if-else if-else
contract Ex4_26 {
    function fun1(uint a) public pure returns(uint) {
        if(a>=10) {
            a = 9;
        } else if(a>=5&&a<=7) {
            a = 7;
        } else {
            a = 10;
        }
        return a;
    }
}
// for 반복문
contract Ex4_28 {
    function fun1() public pure returns(uint) {
        uint result = 0;
        for(uint a = 0; a < 3; ++a) {
            result = result + a;
        }
        return result;
    }
}
// while 반복문
contract Ex4_29 {
    function fun1() public pure returns(uint) {
        uint result = 0;
        uint a = 3;
        while(a>0) {
            result = result + a;
            --a;
        }
        return result;
    }
}
// do-while 반복문
contract Ex4_30 {
    function fun1() public pure returns(uint) {
        uint result = 0;
        uint a = 0;
        do {
            result = result + a;
            ++a;
        } while(a < 3);

        return result;
    }
}