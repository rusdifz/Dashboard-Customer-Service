export default function obcListController({dataObcList}){      
  return async function obcList(httpRequest) {
    try {
      console.log('http', httpRequest);
      
      const bodyparam = httpRequest.query

      const posted = await dataObcList(bodyparam)
      
      return {
        headers: {
          'Content-Type': 'application/json',
          // 'Last-Modified': new Date(posted.createdTime).toUTCString()
        },
        statusCode: 200,
        body: posted
      }
    } catch (err:any) {
      // TODO: Error logging
      console.log(err)
 
      return {
        headers: {
          'Content-Type': 'application/json'
        },
        statusCode: 500,
        body: {
          responseCode: 500, 
          message: err.message,
          data: {},
          error: err.message      
        }
      }
    }
  }       
}     