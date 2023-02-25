<div class="tab-content tab-space">
    <div class="tab-pane active show" id="tab1">

        <div class="row">
            <div class="col-md-12">
                <div class="card-box">
                    <div class="card-head">
                        <button id="panel-button"
                                class="mdl-button mdl-js-button mdl-button--icon pull-right"
                                data-upgraded=",MaterialButton">
                            <i class="material-icons">more_vert</i>
                        </button>
                        <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                            data-mdl-for="panel-button">
                            <li class="mdl-menu__item"><i class="material-icons">assistant_photo</i>Action
                            </li>
                            <li class="mdl-menu__item"><i class="material-icons">print</i>Another action
                            </li>
                            <li class="mdl-menu__item"><i class="material-icons">favorite</i>Something
                                else here
                            </li>
                        </ul>
                    </div>
                    <div class="card-body ">
                        <div class="table-scrollable">
                            <table class="table table-hover table-checkable order-column full-width"
                                   id="example4">
                                <thead>
                                <tr>
                                    <th class="center"> Name</th>
                                    <th class="center"> Email</th>
                                    <th class="center"> Birthday</th>
                                    <th class="center"> Address</th>
                                    <th class="center"> Gender</th>
                                    <th class="center"> Phone Number</th>
                                    <th class="center"> Status</th>
                                    <th class="center"> Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listUser}" var="item">
                                    <tr class="odd gradeX">
                                        <td class="center"><c:out value="${item.fullName}"/></td>
                                        <td class="center"><c:out value="${item.email}"/></td>
                                        <td class="center"><c:out value="${item.birthday}"/></td>
                                        <td class="center"><c:out value="${item.address}"/></td>
                                        <td class="center"><c:out value="${item.gender}"/></td>
                                        <td class="center"><c:out value="${item.phoneNumber}"/></td>
                                        <td class="center"><p id="${item.status}"><c:out value="${item.status}"/></p></td>
                                        <td class="center">
                                            <a href=""
                                               class="btn btn-tbl-edit btn-xs">
                                                <i class="fa fa-pencil"></i>
                                            </a>
                                            <a class="btn btn-tbl-delete btn-xs">
                                                <i class="fa fa-trash-o "></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>