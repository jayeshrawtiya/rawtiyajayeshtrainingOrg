import { LightningElement, api } from 'lwc';

export default class ChildComponentParentToChild extends LightningElement 
{
    @api counter=0;

    @api increaseCounter()
    {
        this.counter=parseInt(this.counter)+100;
    }
}