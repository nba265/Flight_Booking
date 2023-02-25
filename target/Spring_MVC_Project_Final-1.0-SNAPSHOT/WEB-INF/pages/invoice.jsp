<%--
  Created by IntelliJ IDEA.
  User: bbb26
  Date: 05/11/22
  Time: 2:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>A simple, clean, and responsive HTML invoice template</title>

    <style>
        .invoice-box {
            max-width: 800px;
            margin: auto;
            padding: 30px;
            border: 1px solid #eee;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
            font-size: 16px;
            line-height: 24px;
            font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
            color: #555;
        }

        .invoice-box table {
            width: 100%;
            line-height: inherit;
            text-align: left;
        }

        .invoice-box table td {
            padding: 5px;
            vertical-align: top;
        }

        .invoice-box table tr td:nth-child(2) {
            text-align: right;
        }

        .invoice-box table tr.top table td {
            padding-bottom: 20px;
        }

        .invoice-box table tr.top table td.title {
            font-size: 45px;
            line-height: 45px;
            color: #333;
        }

        .invoice-box table tr.information table td {
            padding-bottom: 40px;
        }

        .invoice-box table tr.heading td {
            background: #eee;
            border-bottom: 1px solid #ddd;
            font-weight: bold;
        }

        .invoice-box table tr.details td {
            padding-bottom: 20px;
        }

        .invoice-box table tr.item td {
            border-bottom: 1px solid #eee;
        }

        .invoice-box table tr.item.last td {
            border-bottom: none;
        }

        .invoice-box table tr.total td:nth-child(2) {
            border-top: 2px solid #eee;
            font-weight: bold;
        }

        @media only screen and (max-width: 600px) {
            .invoice-box table tr.top table td {
                width: 100%;
                display: block;
                text-align: center;
            }

            .invoice-box table tr.information table td {
                width: 100%;
                display: block;
                text-align: center;
            }
        }

        /** RTL **/
        .invoice-box.rtl {
            direction: rtl;
            font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        }

        .invoice-box.rtl table {
            text-align: right;
        }

        .invoice-box.rtl table tr td:nth-child(2) {
            text-align: left;
        }
    </style>
</head>

<body>
<div class="invoice-box">
    <table cellpadding="0" cellspacing="0">
        <tr class="top">
            <td colspan="2">
                <table>
                    <tr>
                        <td class="title">
                            <img src="https://www.sparksuite.com/images/logo.png" style="width: 100%; max-width: 300px" />
                        </td>

                        <td>
                            Invoice #: ${booking.bookingNumber}<br />
                            Created: ${booking.bookingDate}<br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr class="information">
            <td colspan="2">
                <table>
                    <tr>
                        <td>
                            ${booking.address}
                        </td>

                        <td>
                            ${booking.email}
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr class="heading">
            <td>Payment Method</td>

            <td>Check</td>
        </tr>

        <tr class="details">
            <td>CreditCard</td>

            <td>${booking.paymentEntity.creditCardEntity.cardNumber}</td>
        </tr>

        <tr class="heading">
            <td>Detail</td>

            <td>Price</td>
        </tr>


        <c:forEach var="item" items="${listBookingDetail}">
            <c:if test="${!(item.bookingStatusEnum == 'CANCEL')}">
        <tr class="item">
            <td>
                <p>
                    ${item.flightsEntity.flightRoute.departureAirport.code} -> ${item.flightsEntity.flightRoute.destinationAirport.code}
                </p>
            </td>

            <td></td>
        </tr>
            <tr class="item">
                <td>${item.passengersEntity.fullName}</td>

                <td></td>
            </tr>
            <tr class="item">
                <td>Aircraft(${item.flightsEntity.aircraft.name}${item.flightsEntity.aircraft.number})</td>

                <td></td>
            </tr>
            <tr class="item">
                <td>Seat(${item.seatsEntity.number})</td>

                <td></td>
            </tr>
            <tr class="item">
                <td>Departure Date(${item.flightsEntity.departure})</td>

                <td></td>
            </tr>

            <c:forEach items="${item.serviceBookingEntities}" var="item1" varStatus="status">
                <c:if test="${status.first}">
                    <tr class="item">
                    <td style="color:#00a65a">Service</td>
                    <td></td>
                    </tr>
                    <tr class="item">
                        <td>------${item1.serviceEntity.name}(${item1.serviceEntity.price}): ${item1.quantity}</td>
                        <td></td>
                    </tr>
                </c:if>
                <c:if test="${!status.first}">
                <tr class="item">
                    <td>------${item1.serviceEntity.name}(${item1.serviceEntity.price}): ${item1.quantity}</td>
                    <td></td>
                </tr>
                </c:if>
            </c:forEach>

            <tr class="item">
                <td>Unit Price</td>

                <td>$${item.unitPrice}</td>
            </tr>
            <tr class="item">
                <td>--------------------------------------------------------------------</td>

                <td>--------------------------------------------------------------------</td>
            </tr>
            </c:if>
        </c:forEach>


        <tr class="total">
            <td></td>

            <td>Total: $${booking.paymentEntity.amount}</td>
        </tr>
    </table>
</div>
</body>
</html>

