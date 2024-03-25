function save() {
    //save함수 호출시 icon_color 변수 선언 하고, 변수에 id값이 icon인 요소를 담는다.
    console.log("save 함수 진입.");

    var icon_color = document.querySelector('#icon1');
    
    console.log("icon_color 변수 값 = " + icon_color);
    //icon_color 변수를 이용하여 id값인 요소의 style을 변경한다.
    icon_color = "red";

    alert("완료!");
}