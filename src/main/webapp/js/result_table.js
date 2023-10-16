const table = document.getElementById("result_table");
function addToTable(x,y,r,isHit,date,scriptWork){
    let newRow = table.insertRow(-1);
    let newCell = newRow.insertCell(0);
    let newCell2 = newRow.insertCell(1);
    let newCell3 = newRow.insertCell(2);
    let newCell4 = newRow.insertCell(3);
    let newCell5 = newRow.insertCell(4);
    let newCell6 = newRow.insertCell(5);
    newCell.appendChild(document.createTextNode(x));
    newCell2.appendChild(document.createTextNode(y));
    newCell3.appendChild(document.createTextNode(r));
    newCell4.appendChild(document.createTextNode(isHit));
    newCell5.appendChild(document.createTextNode(date));
    newCell6.appendChild(document.createTextNode(scriptWork));
}
function clearTable(){
    for(let i=table.rows.length-1; i>0; i--){
        table.deleteRow(i);
    }
}
