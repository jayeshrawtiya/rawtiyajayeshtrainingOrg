import { LightningElement, track } from 'lwc';

export default class ParentComponentChildToParent extends LightningElement 
{
    @track countValue=0;

    handledecrement()
    {
        this.countValue--;
    }

    handleincrement()
    {
        this.countValue++;
    }
}