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

        .user-table {
            width: 100%;
            border-collapse: collapse;
        }

        .user-table th,
        .user-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .user-table th {
            background-color: #f2f2f2;
        }

        .user-table-row:nth-child(even) {
            background-color: #f2f2f2;
        }

        .add-btn,
        .show {
            display: inline-block;
            padding: 5px 10px;
            background-color: #337ab7;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease-in-out;
        }

        .add-btn:hover,
        .show:hover {
            background-color: #23527c;
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
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<body>
<div id="content" role="main">
    <div class="container">
        <section>
            <div id="show-user" class="col-12 content scaffold-show" role="main">
                <h1 class="text-center"><g:message code="default.show.label" args="[user.userName]"/></h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <table class="rounded user-table">
                    <tr class="user-table-row">
                        <th>Name</th>
                        <th>Starting Balance</th>
                        <th>Expense</th>

                    </tr>
                    <g:each var="prop" in="${user}">
                        <tr class="user-table-row">
                            <td>${prop.userName}</td>
                            <td>${prop.startingBalance}</td>
                            <g:if test="${expense == null}">
                                <td><g:link class="add-btn" controller="expense" action="create"
                                             resource="${expense}">Add Expense</g:link></td>
                            </g:if>
                            <g:else>
                                <td><g:link class="show" controller="expense" action="statement"
                                             resource="${expense}">View Statement</g:link></td>
                            </g:else>
                        </tr>
                    </g:each>
                </table>
            </div>
        </section>
    </div>
</div>

<div class="footer-container">
    <footer class="footer" role="contentinfo">
        <div class="img-wrapper">
            <div class="img-container">
                <a href="http://guides.grails.org" target="_blank">
                    <asset:image src="advancedgrails.svg" alt="Grails Guides" size="20"/>
                </a>
            </div>
            <div class="sub-text">
                <strong class="centered"><a href="http://guides.grails.org" target="_blank">Grails Guides</a></strong>
                <p>Building your first Grails app? Looking to add security, or create a Single-Page-App?
                    Check out the <a href="http://guides.grails.org" target="_blank">Grails Guides</a> for step-by-step tutorials.</p>
            </div>
        </div>

        <div class="img-wrapper">
            <div class="img-container">
                <a href="http://docs.grails.org" target="_blank">
                    <asset:image src="documentation.svg" alt="Grails Documentation" class="float-left"/>
                </a>
            </div>
            <div class="sub-text">
                <strong class="centered"><a href="http://docs.grails.org" target="_blank">Documentation</a></strong>
                <p>Ready to dig in? You can find in-depth documentation for all the features of Grails in the
                    <a href="http://docs.grails.org" target="_blank">User Guide</a>.</p>
            </div>
        </div>

        <div class="img-wrapper">
            <div class="img-container">
                <a href="https://slack.grails.org" target="_blank">
                    <asset:image src="slack.svg" alt="Grails Slack" class="float-left"/>
                </a>
            </div>
            <div class="sub-text">
                <strong class="centered"><a href="https://slack.grails.org" target="_blank">Join the Community</a></strong>
                <p>Get feedback and share your experience with other Grails developers in the community
                    <a href="https://slack.grails.org" target="_blank">Slack channel</a>.</p>
            </div>
        </div>
    </footer>
</div>
</body>
</html>
