import { LightningElement } from 'lwc';
import { countryCodeList } from 'c/countryCodeList'
import currencyConverterAssets from '@salesforce/resourceUrl/currencyConverterAssets'
import getConvertedCurrency from '@salesforce/apex/CurrencyProxyController.getConvertedCurrency';
export default class CurrencyConvertorApp extends LightningElement {
    currencyImage = currencyConverterAssets+'/currencyConverterAssets/currency.svg'
    countryList= countryCodeList
    countryFrom="USD" //default value
    countryTo="AUD" //default value
    amount=''
    result
    error


    handleChange(event)
    {
        const{name, value}= event.target
        console.log("name", name)
        console.log("value", value)
        this[name]= value
        this.result=''
        this.error=''
    }
    submitHandler(event)
    {
        event.preventDefault(); /* this will prevent reload on clicking button*/
        this.convert();
    }


    async convert() {
        const API_KEY = 'e5ec8568e0bbabb580e33707'
        const API_URL = `https://v6.exchangerate-api.com/v6/${API_KEY}/pair/${this.countryFrom}/${this.countryTo}`
        console.log('API_URL',API_URL)

        try {
            const data = await fetch(API_URL)
            const jsonData = await data.json()
            debugger;
            this.result = (Number(this.amount) * jsonData.conversion_rate).toFixed(2)
            console.log(this.result)
        } 
        catch (error) {
            console.log("error", error)
            console.log('error occured please review api call')
            console.error('Error message:', error.message);
            console.error('Stack trace:', error.stack);
        }
    }
}