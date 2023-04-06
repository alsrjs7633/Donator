const supMenu = document.querySelector("#sup-menu");
const fundMenu = document.querySelector("#fund-menu");
const boardMenu = document.querySelector("#board-menu");
const allMenu = document.querySelectorAll(".dnone-menu");
const infoMenu = document.querySelector("#info-menu");

function openSup(){
  if(supMenu.classList.contains("dnone")){
    for(let i=0; i<allMenu.length; i++){
      if(!allMenu.item(i).classList.contains("dnone")){
        allMenu.item(i).classList.add("dnone");
      }
    }
    supMenu.classList.remove("dnone");
  }else{
    for(let i=0; i<allMenu.length; i++){
      if(!allMenu.item(i).classList.contains("dnone")){
        allMenu.item(i).classList.add("dnone");
      }
    }
  }
}
function openFund(){
  if(fundMenu.classList.contains("dnone")){
    for(let i=0; i<allMenu.length; i++){
      if(!allMenu.item(i).classList.contains("dnone")){
        allMenu.item(i).classList.add("dnone");
      }
    }
    fundMenu.classList.remove("dnone");
  }else{
    for(let i=0; i<allMenu.length; i++){
      if(!allMenu.item(i).classList.contains("dnone")){
        allMenu.item(i).classList.add("dnone");
      }
    }
  }
}
function openBoard(){
  if(boardMenu.classList.contains("dnone")){
    for(let i=0; i<allMenu.length; i++){
      if(!allMenu.item(i).classList.contains("dnone")){
        allMenu.item(i).classList.add("dnone");
      }
    }
    boardMenu.classList.remove("dnone");
  }else{
    for(let i=0; i<allMenu.length; i++){
      if(!allMenu.item(i).classList.contains("dnone")){
        allMenu.item(i).classList.add("dnone");
      }
    }
  }
}
function openInfo(){
  if(infoMenu.classList.contains("dnone")){
    for(let i=0; i<allMenu.length; i++){
      if(!allMenu.item(i).classList.contains("dnone")){
        allMenu.item(i).classList.add("dnone");
      }
    }
    infoMenu.classList.remove("dnone");
  }else{
    for(let i=0; i<allMenu.length; i++){
      if(!allMenu.item(i).classList.contains("dnone")){
        allMenu.item(i).classList.add("dnone");
      }
    }
  }
}