var request = require('request');
const https = require('https');

const url = 'https://api.plant.id';

export const PlantIDUsage = () =>{

    // https.get('https://private-b785e-plantid.apiary-mock.com/usage_info?key='+process.env.PLANT_ID_KEY), (resp) =>{
    //     resp.on('end', () =>{
    //         console.log(JSON.parse())
    //     })
    // }
    let data = {'key': '50vulBj9jUabpDEk3edQYQyTUj7vr694L35NkUSqkgkFDByUov'}
    fetch(url+'/usage_info', {
        method: 'POST',
        body: JSON.stringify(data),
        headers: {
            'Content-Type': 'application/json'
        }
    }).then(res => res.json())
    .then(response => console.log('Success:', JSON.stringify(response)))
    .catch(error => console.error('Error:', error));
    
    // request.post({
    //     headers: {'content-type': 'application/json'},
    //     url: 'https://api.plant.id/usage_info',
    //     body: 'key=50vulBj9jUabpDEk3edQYQyTUj7vr694L35NkUSqkgkFDByUov'
    // }, (error, response, body) => {
    //     if(error) console.log('Error', error);
    //     console.log('Status:', response.statusCode);
    //     console.log('Headers:', JSON.stringify(response.headers));
    //     console.log('Response:', body);
    // });

    // request.post('https://api.plant.id/usage_info'), 
    //     {json: {'key': process.env.PLANT_ID_KEY} }, 
    //     (err,res,body) => {
    //         if(err) { console.log(err); }
    //         console.log(body.url);
    //         console.log(body.explanation);
    //         console.log(res);
    //         console.log('usage done');
    //     }
}

export const PlantIDIdentification = (dataUrl) => {

    request.post('https://api.plant.id/identify'),
        {json: {
            key: process.env.PLANT_ID_KEY,
            usage_info:true,
            images: [dataUrl]
        }},
        (err,res,body) => {
            if(err) { console.log(err); }
            console.log(body.url);
            console.log(body.explanation);
            console.log(res);
            console.log('identification done');
        }

    // request({
    //     method: 'POST',
    //     url: 'https://private-b785e-plantid.apiary-mock.com/identify',
    //     headers: {
    //       'Content-Type': 'application/json'
    //     },
    //     body: {
    //       "key": process.env.PLANT_ID_KEY,          // required - string
    //       "usage_info": true,            // optional - attache info about API usage and limits (see usage_info endpoint below)
    //       "images": [                     // required - images in base64 in one of folowing formats
    //         dataUrl
    //       ]
    //     }
    //   }, function (error, response, body) {
    //       if(error) console.log('Error', error);
    //     console.log('Status:', response.statusCode);
    //     console.log('Headers:', JSON.stringify(response.headers));
    //     console.log('Response:', body);
    //   });
}