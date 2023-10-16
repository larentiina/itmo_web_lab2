
let R,Y;
const X = document.getElementById("X");

const buttonClear = document.getElementById("clear_button");
buttonClear.addEventListener("click",(event)=>{
    request(actionClear,null,null,null);
});

X.addEventListener("input",function (event){
        let value = Number(X.value.replace(",", "."));
        if (!isFinite(value)) {
                X.setCustomValidity("Неверный ввод. Нужно ввести число");
        } else if(value>5 || value<-3){
            X.setCustomValidity("Неверный ввод. Диапозон числа от -3 до 5");
        } else {
            X.setCustomValidity("");
        }
    }
);
function chooseButton(element,className){
    if(className==='R') {
        R = element.value;
        deleteGraph();
        drawGraph(element.value);
    }
    if(className==='Y') {
        Y = element.value;
    }
    console.log(className);
    [...document.getElementsByClassName(className)].forEach(function (btn){
        btn.style.backgroundColor="#ffffff";
        btn.style.color="rgb(112,84,232)";

    });
    element.style.backgroundColor="rgb(112,84,232)";
    element.style.color="#ffffff";
    console.log(R)

}
function checkR(){
    return(R!==undefined);
}
function checkY(){
    return(R!==undefined);
}



