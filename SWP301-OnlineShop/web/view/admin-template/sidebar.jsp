<%-- 
    Document   : sidebar
    Created on : May 24, 2022, 2:59:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg" alt="User Image">
        <div>
          <p class="app-sidebar__user-name">John Doe</p>
          <p class="app-sidebar__user-designation">Frontend Developer</p>
        </div>
      </div>
        <ul class="app-menu" id="siderBar-nav">
        <li><a class="app-menu__item" href="index.html"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Dashboard</span></a></li>
        <li><a class="app-menu__item" href="index.html"><i class="app-menu__icon fa fa-users"></i><span class="app-menu__label">User List</span></a></li>
        <li><a class="app-menu__item" href="index.html"><i class="app-menu__icon fa fa-cog"></i><span class="app-menu__label">Setting List</span></a></li>
      </ul>
    </aside>
</html>
