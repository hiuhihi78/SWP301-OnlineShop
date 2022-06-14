/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

  document.getElementById('getval').addEventListener('change', readURL, true);
        function readURL() {
            var file = document.getElementById("getval").files[0];
            var reader = new FileReader();
            reader.onloadend = function () {
                document.getElementById('clock').style.backgroundImage = "url(" + reader.result + ")";
            }
            if (file) {
                reader.readAsDataURL(file);
            } else {
            }
        }
        
        
//       function loadImage(src) {
//           document.getElementById('clock').style.backgroundImage = "url(../../" + src + ")";
//       }

