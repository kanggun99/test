let randomeList = [];
const map = [
    "one", "two", "three", "four", "five",
    "six", "seven", "eight", "nine", "ten",
    "eleven", "twelve", "thirteen", "fourteen", "fifteen",
    "sixteen", "seventeen", "eighteen", "nineteen", "twenty"
];

let width = 6;
let height = 6;

$(document).ready(function() {
	const path = window.location.pathname;

/*---------------메인 화면---------------*/
	console.log(path);	
	$('.gameMain').toggle(path === "/Test1/2048");
	$('.playGame').toggle(path === "/Test1/Start");
	
	let num = randome();
	
	window.addEventListener("keydown", function(e){
		if(e.key == "ArrowUp" || e.key == "ArrowDown" || e.key == "ArrowLeft" || e.key == "ArrowRight"){
			switch(e.key){
				case "ArrowUp":
					up(num);
					break;
				case "ArrowDown":
					break;
				case "ArrowLeft":
					break;
				case "ArrowRight":
					break;
				default:
					break;
			}
			num = randome();
		}
	})
});

function up(num){
	for(let i = 0; i < randomeList.length; i++){
		let top = num % width;
		let count = Math.floor(num / width) + 1;
		if(count > 1){			
			for(let k = 1; k < count; k++){
				let tdClassName = $('td').eq(num).attr('class');
				let tdClassChangeName = $('td').eq(top * k).attr('class');
				let mapNum = map.indexOf(tdClassName);
				if(!tdClassChangeName){
					console.log("!");
					randomeList[randomeList.indexOf(num)] = top * k;
					moveBlock(top, num, mapNum);
					break;
				}else if(tdClassChangeName == tdClassName){
					console.log(tdClassChangeName);
					console.log(tdClassName);
					console.log("!!");
					randomeList.splice(randomeList.indexOf(num), 1);
					moveBlock(top, num, mapNum+1);
					break;
				}else{
					console.log("!!!");
					randomeList.splice(randomeList.indexOf(num), 1);
					applyBlock(top*(k+1), mapNum);
					removeBlock(num);
					break;
				}
			}
			break;
		}
	}
}

function randome(){
	if (randomeList.length >= width*height) {
		alert("Gmae Over");
		return null;
	}
	let num;
	while(true){		
		num = parseInt(Math.random()*(width*height));
		if(!randomeList.includes(num)){
			randomeList.push(num);
			console.log("random : "+randomeList);
			applyBlock(num, 1);
			return num;			
		}
	}
}

function applyBlock(addNum, value) {
  console.log("applyBlock : "+randomeList);
  $('td').eq(addNum).text(value);
  $('td').eq(addNum).addClass(map[value]);
}

function removeBlock(RemoveNum) {
  console.log("RemoveNum : "+randomeList);
  $('td').eq(RemoveNum).text("");
  $('td').eq(RemoveNum).removeClass();
}

function moveBlock(addNum, RemoveNum, value){
	console.log("moveBlock : "+randomeList);
	applyBlock(addNum, value);
	removeBlock(RemoveNum);
	
}