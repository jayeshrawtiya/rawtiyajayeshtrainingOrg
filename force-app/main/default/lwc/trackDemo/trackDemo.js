import { LightningElement, track} from 'lwc';

export default class TrackDemo extends LightningElement 
{
    @track fullName = {firstname:"" , lastname: ""};

    handleChange(event)
    {
        const field = event.target.name;
        windows.alert(field);

        if(field =='firstName')
        {
            this.fullName.firstname = event.target.value;
        }
        else if(field == 'lastname')
        {
            this.fullname.lastname = event.target.value;
        }
    }
}