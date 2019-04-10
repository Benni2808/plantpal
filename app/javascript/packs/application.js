// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// require("@rails/ujs").start();
// require("@rails/activestorage").start();
// require("channels");
// require("main");
//= require_tree .

// console.log('test');
window.addEventListener('load', ()=>{
    console.log('test');

    const user_photo = document.getElementById('old_user_photo');

    user_photo.addEventListener('click', (e) => {
        console.log(e);
        startup();
    });

    /**
     * WebRTC camera access request
     */
    // define width, height is calculated later
    let width = 320;   
    let height = 0;   
    let streaming = false;
    // define some html elements
    let video = null;
    let canvas = null;
    let photo = null;
    let startbutton = null;

    function startup() {
      video = document.getElementById('video');
      canvas = document.getElementById('canvas');
      photo = document.getElementById('photo');
      startbutton = document.getElementById('startbutton');
      navigator.mediaDevices.getUserMedia({video: true, audio: false})
      .then(function(stream) {
        video.srcObject = stream;
        video.play();
      })
      .catch(function(err) {
        console.log("An error occurred: " + err);
      });
      video.addEventListener('canplay', function(ev){
        if (!streaming) {
          height = video.videoHeight / (video.videoWidth/width);
          // fixes a bug in firefox
          if (isNaN(height)) {
            height = width / (4/3);
          }
          video.setAttribute('width', width);
          video.setAttribute('height', height);
          canvas.setAttribute('width', width);
          canvas.setAttribute('height', height);
          streaming = true;
        }
      }, false);
      startbutton.addEventListener('click', function(ev){
        takepicture();
        ev.preventDefault();
      }, false);
      clearphoto();
    }

    function clearphoto() {
      var context = canvas.getContext('2d');
      context.fillStyle = "#AAA";
      context.fillRect(0, 0, canvas.width, canvas.height);
      var data = canvas.toDataURL('image/png');
      photo.setAttribute('src', data);
    }

    // Capture a photo by fetching the current contents of the video
    // and drawing it into a canvas, then converting that to a PNG
    // format data URL. By drawing it on an offscreen canvas and then
    // drawing that to the screen, we can change its size and/or apply
    // other changes before drawing it.

    function takepicture() {
      var context = canvas.getContext('2d');
      if (width && height) {
        canvas.width = width;
        canvas.height = height;
        context.drawImage(video, 0, 0, width, height);
        var data = canvas.toDataURL("image/png").replace("image/png","image/octet-stream");
        // window.location.href=data;
        var blob = canvas.toB
        photo.setAttribute('src', data);
        let file_field = document.getElementById('user_photo')
        // console.lo
        canvas.toBlob((blob) =>{
            console.log(blob);
            var url=window.URL.createObjectURL(blob);
            let new_url = URL.revokeObjectURL(url);
            console.log(new_url);
            // file_field.files.append(data,blob.size, url);
            console.log(`Super ${blob.size} amazing ${url}`);
            file_field.files[0] = {name: 'test.jpg', size: 23424, type: 'image/png'};
            image.src=url;
            // file_field.value = url;
            document.body.appendChild(image);
            console.log(file_field.files); 
        });
      } 
      else {
        clearphoto();
      }
    }


    // event listener to run startup once loading is done
    // window.addEventListener('load', startup, false);
});
