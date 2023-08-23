function addComment(vid,ani)
{
    alert("Hello call !");
  let msg=document.getElementById("exampleFormControlTextarea1").value;
  let addinsection=document.getElementById("addcomments");
    let jsonR={
                "action":2,
                "vid":vid,
                "ani":ani,
                "msg":msg
    }
    

    let query=new URLSearchParams(jsonR)

   fetch('ApiServlet',{method:'Post',body:query}).then(resp=> {return resp.json()})
   .then(data=>{
       
    console.log(data)
    if(data=='1')
    {
      let html=`<div class="row pt-3 align-items-center">
      <div class="col-md-1 col-2">
          <img src="images/user.jpg" alt="" class="img-fluid">
      </div><div class="col-md-6 col-10">
      <p class="mb-0">${msg}.</p>
  </div>
</div>`;

addinsection.insertAdjacentHTML('afterbegin',html);
document.getElementById("exampleFormControlTextarea1").value="";
    }

}
   ).catch(error=>console.log(error));
    

}


