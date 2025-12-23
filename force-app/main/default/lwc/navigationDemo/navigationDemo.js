import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';


//extends navigationMixin in class
export default class NavigationDemo extends NavigationMixin(LightningElement)
{
    handleClick()
    {
        // Navigate To Tab
        /*
        this[NavigationMixin.Navigate]({
            type:'standard__navItemPage',
            attribute:{apiName:'DemoLWC',},
        })
        */


        //Navigate To Account object Home Page
        
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
                attributes:{
                    objectApiName:'Account',
                    actionName : 'list'
                },
            })
        
        

        //Navigate To Account object recently viewed filter page.
        /*
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
                attributes:{
                    objectApiName:'Account',
                    actionName :'list'
                },
                state:{
                    filterName:'Recent'
                }
            })
        */


        //Navigate To create new account modal
        /*
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
                attributes:{
                    objectApiName:'Account',
                    actionName : 'new'
                },
            })
        */


        //Navigate To View account Redcord
        /*
        this[NavigationMixin.Navigate]({
            type:'standard__recordPage',
                attributes:{
                    recordId:'0015g00001U9jiGAAR',
                    objectApiName:'Account',
                    actionName : 'view'
                },
            })
        */

        //Open object record modal in edit mode
        /*
        this[NavigationMixin.Navigate]({
            type:'standard__recordPage',
                attributes:{
                    recordId:'0015g00001U9jiGAAR',
                    objectApiName:'Account',
                    actionName : 'edit'
                },
            })
        */


        
        //Navigate to url
        /*
        this[NavigationMixin.Navigate]({
            type:'standard__webPage',
                attributes:{
                    url:'https://www.google.co.in'
                },
            })
        */



    }
}