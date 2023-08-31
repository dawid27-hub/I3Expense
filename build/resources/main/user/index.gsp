<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        section {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

        h1 {
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }

        .message {
            background-color: #dff0d8;
            border: 1px solid #d0e9c6;
            color: #3c763d;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 4px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        .border-bottom {
            border-bottom: 1px solid #ddd;
        }

        .text-center {
            text-align: center;
        }

        .footer-container {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        .footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .img-wrapper {
            flex-basis: calc(33.33% - 20px);
            text-align: center;
            margin-bottom: 20px;
        }

        .img-container {
            display: inline-block;
            padding: 10px;
            background-color: #444;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .sub-text {
            font-size: 14px;
            line-height: 1.5;
        }

        .centered {
            display: block;
            margin-bottom: 10px;
        }
    </style>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>
<body>
<div id="content" role="main">
    <div class="container">
        <section class="row">
            <div id="list-user" class="col-12 content scaffold-list" role="main">
                <h1 class="text-center"><g:message code="default.list.label" args="[entityName]"/></h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <table class="rounded">
                    <thead class="border-bottom">
                        <tr>
                            <th class="text-center">Name</th>
                            <th class="text-center">Expenses</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each var="user" in="${userList}">
                            <g:each var="expense" in="${user.expense}">
                                <tr class="border-bottom">
                                    <td class="text-center"><g:link controller="user" action="show" id="${user.id}">${user.userName}</g:link></td>
                                    <td class="text-center"><g:link controller="expense" action="statement" id="${user.id}">View Statement</g:link></td>
                                </tr>
                            </g:each>
                        </g:each>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
</div>
</body>
</html>
