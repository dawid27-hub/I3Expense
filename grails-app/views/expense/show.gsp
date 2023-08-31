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

        .user-table-row {
            border-bottom: 1px solid #ddd;
        }

        .rounded {
            border-radius: 5px;
        }

        .footer-container {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
    </style>
    <g:set var="entityName" value="${message(code: 'expense.label', default: 'Expense')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<body>
<div id="content" role="main">
    <div class="container">
        <section class="row">
            <div id="show-expense" class="col-12 content scaffold-show" role="main">
                <h1><g:message code="default.show.label" args="[entityName]"/></h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <table class="rounded user-table">
                    <tr class="user-table-row">
                        <th>Amount</th>
                    </tr>
                    <g:each var="prop" in="${expense}">
                        <tr class="user-table-row">
                            <td>${prop.withdraw}</td>
                        </tr>
                    </g:each>
                </table>
            </div>
        </section>
    </div>
</div>
</body>
</html>
