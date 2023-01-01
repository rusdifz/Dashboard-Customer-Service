export default function downloadReportsController({dataDownloadReports}){
  return async function downloadReports(httpRequest) {
    try {

      const bodyparam = httpRequest.query
      bodyparam.result = "redirect"
      const posted = await dataDownloadReports(bodyparam)
      
      return {
        headers: {
          'Content-Type': 'application/json',
          // 'Last-Modified': new Date(posted.createdTime).toUTCString()
        },
        statusCode: 200,
        body: posted,
        downloadFile: true
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