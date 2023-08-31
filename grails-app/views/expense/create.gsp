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

        .errors {
            color: #a94442;
            list-style: none;
            padding-left: 0;
        }

        .form {
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .save {
            background-color: #337ab7;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
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
    <g:set var="entityName" value="${message(code: 'expense.label', default: 'Expense')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>
<body>
<div id="content" role="main">
    <div class="container">
        <section class="row">
            <div id="create-expense" class="col-12 content scaffold-create" role="main">
                <h1><g:message code="default.create.label" args="[entityName]"/></h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${this.expense}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.expense}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <g:form resource="${this.expense}" method="POST">
                    <fieldset class="form">
                        <f:all bean="expense"/>
                    </fieldset>
                    <fieldset class="">
                        <g:submitButton name="create" class="save c-form-btn"
                                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                    </fieldset>
                </g:form>
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
