<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        #list-expense {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f0f0f0;
        }
        .message {
            margin: 20px 0;
            padding: 10px;
            background-color: #dff0d8;
            border: 1px solid #d0e9c6;
            color: #3c763d;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    %{--Use ConvertZarService--}%
    <g:set var="convert" bean="convertZarService"/>
    <div id="list-expense" class="content scaffold-list" role="main">
        <h2>Statement: ${user.userName}, Starting Balance: R${user.startingBalance}</h2>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <div class="d-flex align-items-center flex-column text-align-center">
            <table>
                <tr>
                    <th>Date</th>
                    <th>Amount Withdrew</th>
                    <th>Remaining Balance</th>
                    <th>Current usd Rate</th>
                </tr>
                <g:each var="expense" in="${user.expense}">
                    <tr>
                        <td>${expense.dateCreated}</td>
                        <td>${expense.withdraw}</td>
                        <td>${expense.runningBalance}</td>
                        <td>${convert.convertZar(expense.withdraw)}</td>
                    </tr>
                </g:each>
            </table>
                      <button class="c-form-btn">
                          <g:link controller="expense" action="exportCSV" id="${user.id}">Export to CSV</g:link>
                      </button>
        </div>
    </div>
</body>
</html>
