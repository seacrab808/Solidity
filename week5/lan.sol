// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

//// 함수와 가시성 지정자 
// contract Ex4_21 {
//     uint public pub = 1;
//     uint private pri = 2;
//     uint internal inter = 3;
//     // uint external ext = 4; // external은 변수 적용 불가

//     function funPub() public view returns(uint, uint, uint) {
//         return(pub, pri, inter);
//     }

//     function funPriv() private view returns(uint, uint, uint) {
//         return(pub, pri, inter);
//     }

//     function funInter() internal view returns(uint, uint, uint) {
//         return(pub, pri, inter);
//     }

//     function funExt() external view returns(uint, uint, uint) {
//         return(pub, pri, inter);
//     }
// }
// - public (pub): 모든 곳에서 접근 가능. Solidity가 자동으로 변수 값을 읽을 수 있는 'Getter 함수'를 만들어줌.

// - private (pri): 오직 현재 컨트랙트 내부에서만 읽고 쓸 수 있음. (상속받은 자식 컨트랙트도 접근 불가)

// - internal (inter): 현재 컨트랙트와 이를 상속받은 자식 컨트랙트에서 접근 가능. (상태 변수의 기본값)

// - external: 변수에는 사용할 수 없음. external은 오직 함수에만 사용 가능하기 때문에 코드에서 주석 처리가 되어 있는 것.

//// 