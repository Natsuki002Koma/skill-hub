function btnAction() {
  const btnLists = document.querySelectorAll(".login-btn");
  const textLine = document.getElementById("login-text");
  const userBtns = document.querySelectorAll(".user-element-btn");

  btnLists.forEach( function(btnList){
    btnList.addEventListener('mouseover', function(){
      this.setAttribute("style", "background-color:#d3d3d3;")
    })
  })
  btnLists.forEach( function(btnList){
    btnList.addEventListener('mouseout', function(){
      this.removeAttribute("style")
    })
  })

  textLine.addEventListener('mouseover', function(){
    this.setAttribute("style", "text-decoration: underline;")
  })

  textLine.addEventListener('mouseout', function(){
    this.removeAttribute("style")
  })

  userBtns.forEach( function(userBtn){
    userBtn.addEventListener('mouseover', function(){
      this.setAttribute("style", "background-color:#f5deb3;")
    })
  })
  userBtns.forEach( function(userBtn){
    userBtn.addEventListener('mouseout', function(){
      this.removeAttribute("style")
    })
  })
  }
  
  window.addEventListener('turbo:load', btnAction)