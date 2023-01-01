const app = require ('express')()

module.exports = function makeExpressCallback (controller,camelcaseKeys) {

  return (req, res) => {
    
    const httpRequest = {
      body: camelcaseKeys(req.body,{deep:true}),
      query: camelcaseKeys(req.query, {deep:true}),
      params: camelcaseKeys(req.params, {deep:true}),
      ip: req.ip,
      method: req.method,
      path: req.path,
      file: req.file,
      auth: req.headers.authorization,
      headerss: {
        'Content-Type': req.get('Content-Type'),
        Referer: req.get('referer'),
        'User-Agent': req.get('User-Agent')
      }
    }

    controller(httpRequest)
    .then(httpResponse => {
      if (httpResponse.headers) {
        res.set(httpResponse.headers)
      }
      // console.log('http', httpResponse);
      
      if(httpResponse.downloadFile){
        // console.log('masuk sini');
        
        console.log('download file', httpResponse.body.data.filename);
        
        const filename = httpResponse.body.data.filename
        const basedir = __dirname
        const dirname = basedir.toString().replace(/call-back/g,"file")
        res.download(dirname+'/'+filename, function(err){
          if (err) {
            res.status(500).send({message: "Could not download the file. " + err,});
          }
        });
      }else{
        // console.log('masuk sono');
        
        res.type('json')
        res.status(httpResponse.statusCode).send(httpResponse.body)
      }
      
    })
    .catch(e => {
      res.status(500).send({ error: 'An unkown error occurred.' })
    })

  }
}
