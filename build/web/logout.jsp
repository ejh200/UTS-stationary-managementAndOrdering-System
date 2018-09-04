<%
    //Invalidate session when lister logs out and redirect back to main page
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
