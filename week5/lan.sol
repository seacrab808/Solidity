// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

// 매핑
// 지갑 주소 복사해서 키로 사용
contract Ex5_1 {
    mapping(address => uint) public balances;

    function addMapping(address _key, uint _amount) public {
        balances[_key] = _amount;
    }

    function getMapping(address _key) public view returns(uint) {
        return balances[_key];
    }

    function deleteMapping1(address _key) public {
        delete(balances[_key]);
    }

    function deleteMapping2(address _key) public {
        balances[_key] = 0;
    }
}

// 배열 - 배열의 길이 구하기, 인덱스에 대응하는 값 구하기
contract Ex5_3 {
    uint[] public array1;
    string[5] public array2 = ["apple", "banna", "Coconut"];

    function getLength1() public view returns(uint) {
        return array1.length;
    }

    function getLength2() public view returns(uint) {
        return array2.length;
    }

    function getArray1(uint _index) public view returns(uint) {
        return array1[_index];
    }

    function getArray2(uint _index) public view returns(string memory){
        return array2[_index];
    }
}

// 배열에 값 추가
contract Ex5_4 {
    uint[] public array1 = [97, 98];
    string[5] public array2 = ["apple", "banana", "Coconut"];

    function getLength1() public view returns(uint) {
        return array1.length;
    }

    function getLength2() public view returns(uint) {
        return array2.length;
    }

    function addArray1(uint _value) public {
        array1.push(_value);
    }

    //오류 발생
    /*
    function addArray2(string memory _value) public {
        array1.push(_value);
    }
    */
}

// 배열 값 변경
contract Ex5_5 {
    uint[] public array1 = [97, 98];
    string[5] public array2 = ["apple", "banana", "Coconut"];

    function getLength1() public view returns(uint) {
         return array1.length;
    }

    function getLength2() public view returns(uint) {
         return array2.length;
    }

    function addArray1(uint _value) public {
         array1.push(_value);
    }

    function changeArray1(uint _index, uint _value) public {
        array1[_index] = _value;
    }

    function changeArray2(uint _index, string memory _value) public {
        array2[_index] = _value;
    }
}

// 배열 값 삭제
contract Ex5_6 {
    uint[] public array = [97, 98, 99];

    function getLength() public view returns(uint) {
         return array.length;
    }

    function popArray() public {
        array.pop();
    }

    function deleteArray(uint _index) public {
        delete array[_index];
    }
}

// 순차 검색 알고리즘 - 배열의 첫 번째 인덱스부터 마지막 인덱스까지 순차적으로 검색, 문자열 비교 기능 X 해시값 비교
contract Ex5_7 {
    string[] public fruitArray = ["apple", "banana", "coconut", "durian", "pear"];

    function linearSearch(string memory _word) public view returns(uint256, string memory) {
        for(uint index = 0; index < fruitArray.length; ++index) {
            if(keccak256(bytes(fruitArray[index])) == keccak256(bytes(_word))) {
                return(index, fruitArray[index]);
            }
        }
        return(0, "Nothing");
    }
}

// 구조체(struct) - 사용자 정의 자료형, 한 개 이상 변수의 집단으로 구성, 여러 다른 자료형을 결합하여 복합적인 데이터를 처리
contract Ex5_8 {
    // 구조체 정의
    struct Human {
        string name;
        uint age;
        string job;
    }

    Human public human1 = Human("ploy", 25, "artist");
    Human public human2;

    function initializeHuman2(string memory _name, uint _age, string memory _job) public {
        human2 = Human(_name, _age, _job);
    }

    // 구조체 반환하는 함수 - 참조타입이므로 저장공간 명시
    function getHuman1() public view returns(Human memory) {
        return human1;
    }

    function getHuman2() public view returns(Human memory) {
        return human2;
    }

    // 점 연산자 : 구조체 내부 변수 접근
    function changeJobHuman1(string memory _job) public {
        human1.job = _job;
    }

    function getNameHuman1() public view returns(string memory) {
        return human1.name;
    }
}

// 구조체(struct)를 적용한 배열과 매핑
contract Ex5_9 {
    struct Human {
        string name;
        uint age;
    }

    Human[] public humanArray;
    mapping(address => Human) public humanMapping;

    function addArray(string memory _name, uint _age) public {
        humanArray.push(Human(_name, _age));
    }

    function getArrayName(uint _index) public view returns(string memory) {
        return humanArray[_index].name;
    }

    function addMapping(address _key, string memory _name, uint _age) public {
        humanMapping[_key] = Human(_name, _age);
    }

    function getMappingName(address _key) public view returns(string memory) {
        return humanMapping[_key].name;
    }
}

// 이벤트 
contract Ex5_10 {
    event MyFunction(uint result, string name);

    function add(uint _a, uint _b) public { // pure나 view 불가
        uint total = _a + _b;
        emit MyFunction(total, "add");
    }

    function mul(uint _a, uint _b) public {
        uint total = _a * _b;
        emit MyFunction(total, "mul");
    }
}

// 생성자(constructor)
// 스마트 컨트랙트가 생성, 배포될 때 제일 먼저 한 번 실행되는 함수
// 스마트 컨트랙트 배포시 변수에 특정한 값을 넣어줄 때 사용, 생략 가능
contract Ex5_11 {
    uint public num = 5;

    constructor(uint _num) {
        num = _num;
    }
}

// immutable
// constant와 같이 한 번 입력되면 변경 불가능
// constant는 선언 시 초기값 필수, immutable은 필수 아님
contract Ex5_12 {
    // uint public constant num1;
    // uint[] public immutable arr;
    uint public immutable num2;

    constructor(uint _num) {
        num2 = _num;
    }

    /* 생성자에서 초기화 가능
    function change() public pure returns(uint) {
        num2 = 10;
    }
    */
}