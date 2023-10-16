const graph =document.getElementById('svg');
const svg = document.querySelector('svg');
const Ox = 150;
const Oy = 150;
const scaleR = 40;

graph.addEventListener('click', (event)=>{
    if(checkR()) {
        const svgPoint = svg.createSVGPoint();
        svgPoint.x = event.clientX;
        svgPoint.y = event.clientY;
        const point = svgPoint.matrixTransform(svg.getScreenCTM().inverse());
        console.log(`Координаты: x=${point.x}, y=${point.y}, r=${R}`);
        createPoint(point.x,point.y)
        const x = transformCoordinate(point.x).toFixed(4);
        const y = -1*transformCoordinate(point.y).toFixed(4)
        console.log(`Переведенные координаты: x=${x}, y=${y}, r=${R}`);
        request(actionCheckPoint,x,y,R);
    }else {
        alert("Введите корректно координату R");
    }
});
function createPoint(x,y){
    const circle = document.createElementNS("http://www.w3.org/2000/svg", "circle");
    circle.setAttribute("cx", x);
    circle.setAttribute("cy", y);
    circle.setAttribute("r", "5");
    circle.setAttribute("fill", "yellow");
    circle.setAttribute("stroke", "orange");
    circle.setAttribute("stroke-width", "1");
    circle.setAttribute("opacity","0.9");
    svg.appendChild(circle);
}
function drawGraph(r){
    createRect((r*scaleR)/2,r*scaleR);
    createPolygon(Ox+r*scaleR,Oy-r*scaleR);
    createPath(Ox-r*scaleR,Oy-r*scaleR,r*scaleR);
}
function createRect(width,height){
    const rect = document.createElementNS("http://www.w3.org/2000/svg","rect");
    rect.setAttribute('x',Ox);
    rect.setAttribute('y',Oy);
    rect.setAttribute('width',width);
    rect.setAttribute('height',height);
    rect.setAttribute('fill-opacity',0.4);
    rect.setAttribute('stroke','navy');
    rect.setAttribute('fill','blue');
    svg.appendChild(rect)

}
function createPolygon(x,y){
    const polygon = document.createElementNS('http://www.w3.org/2000/svg', 'polygon');
    polygon.setAttribute('points', `150,150 ${x},150 150,${y}`);
    polygon.setAttribute('fill-opacity',0.4);
    polygon.setAttribute('stroke','navy');
    polygon.setAttribute('fill', 'blue');
    svg.appendChild(polygon);
}
function createPath(x,y,r){
    const path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
    path.setAttribute('d', `M 150 150 L ${x} 150 A ${r} ${r} 0 0 1 150 ${y} L Z`);
    path.setAttribute('fill', 'blue');
    path.setAttribute('fill-opacity',0.4);
    path.setAttribute('stroke', 'navy');
    svg.appendChild(path);
}
function transformCoordinate(x){
    return (x-Ox)/scaleR;
}
function clearPoints(){
    const circles = svg.querySelectorAll("circle");
    circles.forEach(circle => {
        circle.remove();
    });
}
function deleteGraph(){
    const rect = document.getElementsByTagName("rect")[0];
    rect.parentNode.removeChild(rect);
    const path = document.getElementsByTagName("path")[0];
    path.parentNode.removeChild(path);
    const polygon = document.getElementsByTagName("polygon")[2];
    polygon.parentNode.removeChild(polygon);
}
