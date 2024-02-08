<%@ page import="db.Tasks" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books JSP</title>
    <%@include file="styles.jsp"%>
</head>
<body>
<div class="container mt-3">
    <%@include file="navbar.jsp"%>

    <%
        Tasks task = (Tasks)request.getAttribute("tAssk");
        if (task !=null){
    %>
    <div class="row">
        <div class="col-6 mx-auto">
            <div class="row mt-3">
                <div class="col-12">
                    <label>NAME: </label>
                </div>
            </div>
            <div class="row mt-1" >
                <div class="col-12">
                    <input type="text" class="form-control " readonly value="<%=task.getName()%>">
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-12">
                    <label>DESCRIPTION: </label>
                </div>
            </div>
            <div class="row mt-1" >
                <div class="col-12">
                    <textarea class="form-control" readonly rows="5"><%=task.getDescription()%></textarea>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-12">
                    <label>DEADLINE: </label>
                </div>
            </div>
            <div class="row mt-1" >
                <div class="col-12">
                    <input class="form-control" readonly value="<%=task.getDeadlineDate()%>">
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-12">
                    <label>CURRENT STATUS: </label>
                </div>
            </div>
            <div class="row mt-1" >
                <div class="col-12">
                    <input type="text" class="form-control" readonly value="<%=(task.isStatus())?"DONE":"NOT"%>">
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-12">
                    <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editTask">
                        EDIT TASK
                    </button>
                    <button type="button" class="btn btn-danger btn-sm ms-2" data-bs-toggle="modal" data-bs-target="#deleteTask">
                        DELETE TASK
                    </button>
                </div>
            </div>

            <div class="modal fade" id="editTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="/save-task" method="POST">
                                <input type="hidden" name="task_id" value="<%=task.getId()%>">
                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>NAME: </label>
                                    </div>
                                </div>
                                <div class="row mt-1" >
                                    <div class="col-12">
                                        <input type="text" class="form-control " name="task_name"
                                               value="<%=task.getName()%>">
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>DESCRIPTION: </label>
                                    </div>
                                </div>
                                <div class="row mt-1" >
                                    <div class="col-12">
                                        <textarea class="form-control" name="task_description" ><%=task.getDescription()%></textarea>
                                    </div>
                                </div>

                                <%
                                    String dateOfDeadline  = task.getDeadlineDate();
                                    SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
                                    Date date = null;
                                    try {
                                        date = format.parse(dateOfDeadline);
                                        format.applyPattern("yyyy-MM-dd");
                                        dateOfDeadline = format.format(date);
                                    } catch (ParseException ignored) {
                                    }
                                    System.out.println("HERE IS CHAMP FORMAT: " + dateOfDeadline);
                                %>
                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>DEADLINE: </label>
                                    </div>
                                </div>
                                <div class="row mt-1" >
                                    <div class="col-12">
                                        <input type="date" class="form-control" name="task_deadline" value="<%=dateOfDeadline%>">
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>DESCRIPTION: </label>
                                    </div>
                                </div>
                                <div class="row mt-1" >
                                    <div class="col-12">
                                        <select class="form-select" name="task_status">
                                            <option <%=(task.isStatus())?"selected":""%> value="1">Done</option>
                                            <option <%=(task.isStatus())?"":"selected"%> value="0">Not</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-12">
                                        <button class="btn btn-success">SAVE CHANGES</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="deleteTask" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/delete-task" method="post">
                            <input type="hidden" name="id" value="<%=task.getId()%>">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5">Confirm Delete</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <h3 class="text-center">Are you sure?</h3>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                <button class="btn btn-danger">Yes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <%
    } else{
    %>
    <h3 class="text-center mt-5">Unfortunately, there is no such a book that corresponds to your parameters</h3>
    <%
        }
    %>
</div>
</body>
</html>
