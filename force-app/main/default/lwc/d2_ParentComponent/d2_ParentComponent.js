import { LightningElement } from 'lwc';

export default class D2_ParentComponent extends LightningElement 
{
    handleClick()
    {
        this.template.querySelector("c-d1_-child-component").handleChangeValue();
        //templeate because it is mentioned inside <template> tag.
    }
}