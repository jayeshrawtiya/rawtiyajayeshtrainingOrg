import { LightningElement, api } from 'lwc';

export default class D1_ChildComponent extends LightningElement 
{
    @api itemName = "Children";


    @api handleChangeValue(){
        this.itemName = "chnaged after clickinhg button of parent component"
    }

}