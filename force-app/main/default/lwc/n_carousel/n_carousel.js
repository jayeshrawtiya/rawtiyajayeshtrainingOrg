import { LightningElement } from 'lwc';

export default class N_carousel extends LightningElement 
{
    //whatever we write inside [] are component of array
    //whatever we write inside:" {} is an object
    //means we created array of objects 
    //any one property of objects should be unique
    Player = [{Id:"1", name:"ViratKohli",  src:"https://www.dynamitenews.com/images/2020/11/05/virat-kohli-turns-32-cricket-fraternity-extends-birthday-wishes/5fa375512b459.jpeg",  href:"https://en.wikipedia.org/wiki/Neymar", description:"This is the first image"},
              {Id:"2", name:"Neymar",  src:"https://upload.wikimedia.org/wikipedia/commons/1/16/Neymar_Olympics_August_2016.jpg",                                                    href:"https://en.wikipedia.org/wiki/Neymar", description:"This is the second image"},
              {Id:"3", name:"RohiSharma",  src:"https://resources.pulse.icc-cricket.com/ICC/photo/2020/04/23/052cfb45-436c-4d15-bb0c-03a15e073036/Rohit-Sharma.jpg",                href:"https://en.wikipedia.org/wiki/Neymar" ,description:"This is the third image"},
            ]
}