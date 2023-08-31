package demotesting

import grails.gorm.transactions.Transactional
import groovy.json.JsonSlurper

@Transactional
class ConvertZarService {


    static def convertZar(double withdrawAmount) {

        double rand
        double usd
        double convertZarToUSD

        println('converting')

        def fixerGet = new URL("http://data.fixer.io/api/latest?access_key=8f98d4633dc00cbc0705bfd7889320db&symbols=ZAR,USD").openConnection()
        def getRC = fixerGet.getInputStream().getText()
        def jsonSlurper = new JsonSlurper()
        def object = jsonSlurper.parseText(getRC)

        println('object: '+ object)

        rand = String.valueOf(object.rates.ZAR).toDouble()
        usd = String.valueOf(object.rates.USD).toDouble()
        convertZarToUSD = rand / usd
        println('Withdraw ' + withdrawAmount / convertZarToUSD.round(2))
        return  (withdrawAmount / convertZarToUSD).round(2)

    }
}
