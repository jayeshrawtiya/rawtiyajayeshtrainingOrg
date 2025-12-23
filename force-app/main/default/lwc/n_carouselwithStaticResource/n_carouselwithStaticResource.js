import { LightningElement } from 'lwc';
import carousel_Images from '@salesforce/resourceUrl/carousel_Images';


export default class N_carouselwithStaticResource extends LightningElement 
{
    //whatever we write inside [] are component of array
    //whatever we write inside:" {} is an object
    //means we created array of objects 
    //any one property of objects should be unique
    Player = [{Id:"1", name:"ViratKohli", src:carousel_Images+'/staticresourceimage/viratkohli.jpeg',  href:"https://en.wikipedia.org/wiki/Neymar", description:"This is the first image"},
              {Id:"2", name:"Neymar",     src:carousel_Images+'/staticresourceimage/Neymar.jpg',      href:"https://en.wikipedia.org/wiki/Neymar", description:"This is the second image"},
              {Id:"3", name:"RohiSharma", src:carousel_Images+'/staticresourceimage/RohitSharma.jpg', href:"https://en.wikipedia.org/wiki/Neymar", description:"This is the third image"},
            ]
}

//carousel_image : is the name of static resource in salesforce
//staticresourceimage used in line 11 12 13 : is the name of folder inside zip folder