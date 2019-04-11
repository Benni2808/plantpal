import { PlantIDUsage, PlantIDIdentification } from "../api/PlantId";
import ImagTools from './ImageTools';
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// require("@rails/ujs").start();
// require("@rails/activestorage").start();
// require("channels");
// require("main");
//= require_tree .
//= require jquery-placeholder

// console.log('test');
window.addEventListener('load', ()=>{
  console.log(window.location.pathname);
  const path = window.location.pathname;
  
  const ResizeImage = (image) => {
    ImagTools.resize(image, {
      width: 1200,
      height: 1200
    }, (blob,didItResize)=>{
      let newForm = new FormData();
      newForm.append('image', blob);
      document.getElementById('preview').src = window.URL.createObjectURL(blob);

      console.log(document.getElementById('plant_image').files[0]);
      var newFile = blobToFile(blob, 'output.png');
      console.log(newFile);
      console.log(newFile.name);
      let current_image = document.getElementById('plant_image');

      const dt = new DataTransfer();
      console.log(blob);
      dt.items.add(new File([blob], newFile.name ));

      // for (let file of current_image.files) {
      //   if(file !== current_image.files[0]) {
      //     dt.items.add(file);
      //   }
      // }
      current_image.files = dt.files;
      
      console.log(document.getElementById('plant_image').files[0]);
      function blobToFile(theBlob, fileName){
        //A Blob() is almost a File() - it's just missing the two properties below which we will add
        theBlob.lastModifiedDate = new Date();
        theBlob.name = fileName;
        return theBlob;
    }
    });
  }
  

    console.log('test');

    

    // if (window.location.pathname)
    
    if(path.includes('plant')) {

      document.getElementById('plant_image').onchange = (event) =>{
        console.log(event);
        ResizeImage(event.target.files[0])
      };

      const current_plant = document.getElementById('plant_photo');
      current_plant.addEventListener('click', (e) => {
        console.log(e.currentTarget);
        var dataUrl = getDataUrl(event.currentTarget)
        console.log(dataUrl)
        PlantIDIdentification(dataUrl)
      });
    }


    /**
     * API request plant
     */
    console.log(` Node Environment: ${process.env.NODE_ENV}`);
    console.log(` Other Environment ${process.env.PLANT_ID_KEY}`);
    console.log(PlantIDUsage());
});
