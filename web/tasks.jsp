<%@ page import="db.Tasks" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Books JSP</title>
    <%@include file="styles.jsp"%>
</head>
<body>
<div class="container mt-3">
    <%@include file="navbar.jsp"%>
    <div class="row mt-3">
        <div class="col-12">
            <button type="button" class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#add_book">
                + Add task
            </button>

            <div class="modal fade" id="add_book" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Новое задание</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="/add-task" method="POST">
                            <div class="modal-body">
                                <%@include file="addForm.jsp"%>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <h3 class="text-center">Welcome to <%=storeName%>!</h3>
    </div>

    <div class="row mt-3">
        <div class="col-12">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>DeadLine</th>
                    <th>Status</th>
                    <th style="width: 10%">DETAILS</th>
                </tr>
                </thead>
                <tbody>

                <%
                    ArrayList<Tasks> task = (ArrayList<Tasks>) request.getAttribute("tusks");
                    if(task!=null){
                        for (Tasks t : task){
                %>
                <tr>
                    <td><%=t.getId()%></td>
                    <td><%=t.getName()%></td>
                    <td><%=t.getDeadlineDate()%></td>
                    <td><%=(t.isStatus())?"Done":"Not"%></td>
                    <td><a href="/details?task_id=<%=t.getId()%>" class="btn btn-info btn-small">Details</a></td>
                </tr>
                <%
                        }
                    }
                %>

                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>