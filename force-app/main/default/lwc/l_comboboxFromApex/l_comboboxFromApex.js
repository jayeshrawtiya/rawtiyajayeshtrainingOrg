import { LightningElement, track } from 'lwc';
import getAccounts from '@salesforce/apex/lwc_fetchAccount.getAccounts'

export default class L_comboboxFromApex extends LightningElement 
{
    @track value='';
    @track accOption = [];

    getOptions()
    {
        return this.accOption;
    }

    connectedCallback()
    {
        getAccounts()
            .then(result => {
                            let arr = [];
                            for (var i=0; i<result.length; i++)
                            {
                                arr.push({label:result[i].name, value : result[i].Id})
                            }

                            this.accOption = arr;

                            })
    }


    handleChange(event)
    {
        this.value = event.detail.value;
    }

}