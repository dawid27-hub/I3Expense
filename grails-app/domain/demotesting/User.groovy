package demotesting


class User {
    String userName
    Double startingBalance

    static hasMany = [expense: Expense]

    static constraints = {
    }
}
