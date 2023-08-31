package demotesting

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ExpenseController {

//    ConvertService convertService
    ExpenseService expenseService
    UserService userService
    ConvertZarService convertZarService
    String csvMimeType
    String encoding

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)


        respond expenseService.list(params), model:[expenseCount: expenseService.count()]
    }

    def show(Long id) {
        respond expenseService.get(id)
    }

    def create() {
        respond new Expense(params)
    }

    def save(Expense expense) {
        if (expense == null) {
            notFound()
            return
        }

        try {
            expenseService.save(expense)
        } catch (ValidationException e) {
            respond expense.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'expense.label', default: 'Expense'), expense.id])
                redirect expense
            }
            '*' { respond expense, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond expenseService.get(id)
    }

    def update(Expense expense) {
        if (expense == null) {
            notFound()
            return
        }

        try {
            expenseService.save(expense)
        } catch (ValidationException e) {
            respond expense.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'expense.label', default: 'Expense'), expense.id])
                redirect expense
            }
            '*'{ respond expense, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        expenseService.delete(id)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'expense.label', default: 'Expense'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def statement(Long id) {
        def user = result(id)
        respond user
    }

    def convert(amount){
        println('Blah blah blah')
        return convertZarService.convertZar(amount)

    }


    def exportCSV(Long id) {
        def user = result(id)
        final String username = user.userName

        final String filename = "${username}_statement.csv"

        def rows = user.expense.collect { [it.dateCreated, it.withdraw, it.runningBalance,convert(it.withdraw)].join(';') } as List<String>

        def headers = "Date Created;Withdraw;Running Balance, Convert"

        def stream = response.outputStream

        response.status = OK.value()
        response.contentType = "${csvMimeType};charset=${encoding}"
        response.setHeader "Content-disposition", "attachment; filename=${filename}"

        stream << "${headers}\n"

        rows.each { String line ->
            stream << "${line}\n"
        }
    }


    protected result(Long id){

        def user = userService.get(id)

        def runningbalance = user.startingBalance

        for(expense in user.expense) {

            expense.runningBalance = runningbalance - expense.withdraw
            runningbalance = expense.runningBalance
//            expense.convertedAmount = convertService.convertZARToUSD(expense.withdraw)

        }

        return user
    }


}
