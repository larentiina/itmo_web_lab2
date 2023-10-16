
const applicantForm = document.getElementById('point_coordinates');
if(applicantForm) {
    applicantForm.addEventListener('submit', handleFormSubmit)
}
const actionClear="clear";
const actionCheckPoint="check";

function handleFormSubmit(event) {
    event.preventDefault();
    if(!checkR()) {
        alert("Для отправки формы выберите R");
    } else if(!checkY()){
        alert("Для отправки формы выберите Y");
    }
   else{
    request(actionCheckPoint,X.value,Y,R);
   }
}

function request(action,x, y, r) {
    const xhr = new XMLHttpRequest();
    const urlParams =
        new URLSearchParams({"action":action,"x": x, "y": y, "r": r});
    xhr.open("GET",
        "http://localhost:8080/lab2web/controller?" + urlParams.toString(),
        true);
    xhr.onreadystatechange = () => {
        if (xhr.readyState === 4) {
            console.log(xhr.status)
                if (action !== actionClear) {
                    switch (xhr.status){
                        case 200:
                        {
                            const values = xhr.responseText.split(';');
                            addToTable(values[0], values[1], values[2], values[3], values[4], values[5]);
                            window.location.href= 'result.jsp';
                            break;
                        }
                        case 400: {
                            window.location.href = 'ErrorPage.jsp';
                            break;
                        }
                        default: {
                            window.location.href = "";
                        }

                    }

                }else {
               clearTable();
               clearPoints();
            }
        }

    }
    xhr.send(null);
}





