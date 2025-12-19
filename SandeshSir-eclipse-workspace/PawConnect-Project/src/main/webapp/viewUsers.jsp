<%@ page import="java.util.List" %>
<%@ page import="com.servlet.adoption.dto.User" %>

<h2>All Registered Users</h2>

<form action="viewUsers" method="get">
    <button type="submit">Load Users</button>
</form>

<%
    List<User> list = (List<User>) request.getAttribute("usersList");
    if (list != null && !list.isEmpty()) {
%>

<table border="1">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
    </tr>

<%
        for (User u : list) {
%>
    <tr>
        <td><%= u.getFullName() %></td>
        <td><%= u.getEmail() %></td>
        <td><%= u.getPhone() %></td>
    </tr>
<%
        }
%>
</table>

<%
    } else {
%>
<p>No users found.</p>
<%
    }
%>
