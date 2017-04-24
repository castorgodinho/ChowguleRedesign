<%-- 
    Document   : sidebar
    Created on : 21 Apr, 2017, 10:08:43 AM
    Author     : gaurav
--%>

<%@page import="dbAdmission.DBUserTypeRights"%>
<%@page import="Admission.PageUrl"%>

<%@page import="java.sql.Connection"%>
<%@page import="Admission.Database"%>
<%@page import="Admission.AdmissionAdmin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
            
            if(session.getAttribute("userid") == null) {
                String url=request.getContextPath();
                response.sendRedirect(""+url+"/admin/LoginError.jsp");
              return;
            }
        %>
        <div class="logo" style="padding: 7px;"><img
                src="<%=request.getContextPath()%>/img/admin-logo.png"  class="img-responsive hidden-xs hidden-sm"></a></div>
        <div class="navi">
            <ul class="nav">
                <li class="active"><a href="<%=request.getContextPath()%>/admin/admission/a_index.jsp"><i class="fa fa-home"
                                                                                                aria-hidden="true"></i><span class="hidden-xs hidden-sm">HOME</span></a></li>
    <%
                                int l = 2;
                                Database database = new Database();
                                Connection con = database.openConnection();

                                AdmissionAdmin admissionAdmin = new AdmissionAdmin(con);

                                
                                DBUserTypeRights dbusertyperight[] = admissionAdmin.getUserTypeRights(Integer.parseInt(session.getAttribute("userid").toString()));
                                for (int i = 0; i < dbusertyperight.length; i++) {
                                    
                                    
                                    out.println("<li><a class='nav-dropdown-link-" + l + "'> <i class='fa fa-graduation-cap' aria-hidden='true'></i><span class='hidden-xs hidden-sm'>" + dbusertyperight[i].rightName + "</span> "
                                            + "<span class='fa fa-angle-down pull-right drop-caret'></span></a>");

                                    PageUrl pageurl = new PageUrl(database.openConnection(),
                                            0,
                                            "",
                                            "");
                                    out.println("<ul class='nav nav-dropdown-" + l + " role=''>");
                                    
                                    l++;
                                    System.out.println("hellll" + dbusertyperight[i].rightName);
                                    PageUrl PageUrl[] = pageurl.getPageUrl(con, dbusertyperight[i].rightID);
                                    for (int j = 0; j < PageUrl.length; j++) {

                                        out.println(""
                                                + "<li><a href=" + request.getContextPath() + PageUrl[j].getPageUrl() + "><i class='fa fa-tasks'"
                                                + "aria-hidden='true'></i><span class='hidden-xs hidden-sm'>" + PageUrl[j].getPageName() + "</span></a></li>");

                                    }
                                    out.println("</ul>");
                                    out.println("</li>");

                                }
                            %>
            </ul>
        </div>
    </body>
</html>
