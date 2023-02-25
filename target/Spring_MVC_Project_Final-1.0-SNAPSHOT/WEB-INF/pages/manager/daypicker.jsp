<%--
  Created by IntelliJ IDEA.
  User: speed
  Date: 04/02/22
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <link href="${pageContext.request.contextPath}/resources-management/datepicker/bootstrap.4.3.1.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources-management/datepicker/font-awesome.4.7.0.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources-management/datepicker/bootstrap-datepicker.1.9.0.css" rel="stylesheet" type="text/css" />




    <style type="text/css">

        /*
        *
        * ==========================================
        * CUSTOM UTIL CLASSES
        * ==========================================
        *
        */
        .datepicker td, .datepicker th {
            width: 2.5rem;
            height: 2.5rem;
            font-size: 0.85rem;
        }

        .datepicker {
            margin-bottom: 3rem;
        }

        /*
        *
        * ==========================================
        * FOR DEMO PURPOSES
        * ==========================================
        *
        */
        body {
            min-height: 100vh;
            background-color: #fafafa;
        }

        .input-group {
            border-radius: 30rem;
        }

        input.form-control {
            border-radius: 30rem 0 0 30rem;
            border: none;
        }

        input.form-control:focus {
            box-shadow: none;
        }

        input.form-control::placeholder {
            font-style: italic;
        }

        .input-group-text {
            border-radius: 0 30rem 30rem 0;
            border: none;
        }

        .datepicker-dropdown {
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }

    </style>
</head>
<body>

<!-- For Demo Purpose -->
<div class="container py-5">
    <header class="text-center">
        <h1 class="display-4 font-weight-bold">Bootstrap Datepicker</h1>
        <p class="font-italic text-muted mb-0">Create a nicely styled reservation form using Bootstrap 4 and <a href="https://github.com/uxsolutions/bootstrap-datepicker" class="text-muted">Bootstrap datepicker</a>.</p>
        <p class="font-italic text-muted">Snippet By <a href="https://bootstrapious.com" class="text-muted">
            <u>Bootstrapious</u></a>
        </p>
    </header>
</div>


<div class="container">
    <div class="row">
        <div class="col-md-6 mx-auto">
            <div class="py-4 text-center"><i class="fa fa-calendar fa-5x"></i></div>

            <!-- Date Picker Input -->
            <div class="form-group mb-4">
                <div class="datepicker date input-group p-0 shadow-sm">
                    <input type="text" placeholder="Choose a reservation date" class="form-control py-4 px-4" id="reservationDate">
                    <div class="input-group-append"><span class="input-group-text px-4"><i class="fa fa-clock-o"></i></span></div>
                </div>
            </div><!-- DEnd ate Picker Input -->

            <div class="form-group mb-4">
                <div class="datepicker date input-group p-0 shadow-sm">
                    <input type="text" placeholder="Choose a reservation date" class="form-control py-4 px-4" id="StartDate">
                    <div class="input-group-append"><span class="input-group-text px-4"><i class="fa fa-clock-o"></i></span></div>
                </div>
            </div>
            <!-- For Demo Purpose -->
            <div class="text-center">
                <p class="font-italic text-muted mb-0">Your reservation day is</p>
                <h4 id="pickedDate" class="font-weight-bold text-uppercase mb-3">Not set yet</h4>
                <a href="#" class="btn btn-primary btn-sm px-4 rounded-pill text-uppercase font-weight-bold shadow-sm">Confirm Reservation</a>
            </div>
        </div>
    </div>
</div>
<div class="col-lg-4 p-t-20">
    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
        <input class="mdl-textfield__input" type="text" name="startDate"
               onfocus="(this.type='date')" onblur="if(!this.value)this.type='text'">
        <label class="mdl-textfield__label">End Date</label>
    </div>
</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/resources-management/datepicker/jquery-3.3.1.slim.min.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/datepicker/bootstrap.bundle.4.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/datepicker/bootstrap-datepicker.1.9.0.min.js"></script>
<script type="text/javascript">
    $(function () {

        // INITIALIZE DATEPICKER PLUGIN
        $('.datepicker').datepicker({
            clearBtn: true,
            format: "dd/mm/yyyy"
        });


        // FOR DEMO PURPOSE
        $('#reservationDate').on('change', function () {
            var pickedDate = $('input').val();
            $('#pickedDate').html(pickedDate);
        });
    });
</script>

