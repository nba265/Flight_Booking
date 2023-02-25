<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: speed
  Date: 03/31/22
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form  class="card-body row" modelAttribute="promotion" method="get" action="addPromotion" >

            <input class = "mdl-textfield__input" type = "text"  name="name">



            <input class = "mdl-textfield__input" type = "text"  name="discount" >



            <input class = "mdl-textfield__input" type = "date" name="createDate" onfocus="(this.type='date')" onblur="if(!this.value)this.type='text'" value = "<fmt:formatDate value="${cForm.dueDate}" pattern="yyyy-MM-dd" />">




            <input class = "mdl-textfield__input" type = "text" name="startDate" onfocus="(this.type='date')" onblur="if(!this.value)this.type='text'">
            <label class = "mdl-textfield__label">End Date</label>


            <input class = "mdl-textfield__input" type = "text" name="endDate" onfocus="(this.type='date')" onblur="if(!this.value)this.type='text'">



					                     <textarea class = "mdl-textfield__input" rows =  "4"
                                                   name="description"></textarea>


        <input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink" value="Submit" />

</form:form>
</body>
</html>
