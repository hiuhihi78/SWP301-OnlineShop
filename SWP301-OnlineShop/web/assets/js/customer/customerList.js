function pagger(id,pageindex,totalpage)
{
    container = document.getElementById(id);
    var result = '';
    result += 'Index:<input id="pageindex_input" type="text" value="'+pageindex+'"/> Total: '+totalpage;
    container.innerHTML = result;
    
    var input = document.getElementById("pageindex_input");

    input.addEventListener("keyup", function(event) {
      if (event.keyCode === 13) {
            window.location.href = 'list?page='+input.value; 
      }
    });
}

