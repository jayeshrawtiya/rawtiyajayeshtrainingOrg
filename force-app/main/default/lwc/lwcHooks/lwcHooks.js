import { LightningElement } from 'lwc';

export default class LwcHooks extends LightningElement 
{
    constructor() {
        super();
        console.log('Constructor - Component is constructed.');
    }
 
    connectedCallback() {
        console.log('Connected Callback - Component is inserted into the DOM.');
    }
 
    renderedCallback() {
        console.log('Rendered Callback - Component is rendered.');
    }
 
    disconnectedCallback() {
        console.log('Disconnected Callback - Component is removed from the DOM.');
    }
 
    errorCallback(error, stack) {
        console.error('Error Callback - An error occurred:', error);
        console.error('Stack Trace:', stack);
    }

}