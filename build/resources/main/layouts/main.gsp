<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="application.css"/>
    <style>
        /* Style for the active tab */
        .nav-tabs .nav-item .nav-link.active,
        .nav-tabs .nav-item .nav-link.active:focus,
        .nav-tabs .nav-item .nav-link.active:hover {
            background-color: #007bff; /* Change to the desired color */
            color: white; /* Text color for the active tab */
        }
    </style>
    <g:layoutHead/>
</head>

<body>

<header>
    <nav class="navbar navbar-expand-sm navbar-light mb-3" role="navigation">
        <div class="container-fluid">
            <a class="navbar-brand"><asset:image height="50" src="grails.svg" alt="Grails Logo"/></a>
            <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
                <div class="navbar-brand">
                    <h1 class="my-0">I3 Expense Sheet</h1>
                </div>
                <ul class="nav nav-tabs flex-grow-1">
                    <li class="nav-item mt-2"><a class="nav-link active" href="${createLink(uri: '/')}">Create New User</a></li>
                    <li class="nav-item mt-2"><a class="nav-link" href="${createLink(uri: '/user/index')}">View User List</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<g:layoutBody/>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
