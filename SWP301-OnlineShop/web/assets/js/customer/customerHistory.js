/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function pagger(id,pageindex,totalpage)
{
    container = document.getElementById(id);
    var result = '';
    result += 'Index:<input id="pageindex_input" type="text" value="'+pageindex+'"/> Total: '+totalpage;
    container.innerHTML = result;
    
    var input = document.getElementById("pageindex_input");
    var customerID = document.getElementById("customerID");

    input.addEventListener("keyup", function(event) {
      if (event.keyCode === 13) {
            window.location.href = 'details?id='+ customerID.value + '?page='+input.value; 
      }
    });
}