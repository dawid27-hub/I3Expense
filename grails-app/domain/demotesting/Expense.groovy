package demotesting

class Expense {
    Date dateCreated
    Double withdraw
    Double convertedAmount
    Double runningBalance = 0.0

    static transients = ['runningBalance', 'convertedAmount']
    static belongsTo = [user: User]

}
