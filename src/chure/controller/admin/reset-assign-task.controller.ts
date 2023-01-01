export default function resetAssignTaskController({dataResetAssignTask,authJwt}){      
  return async function resetAssignTask(httpRequest) {
    try {
      // const authentication = await authJwt({jwt: httpRequest.auth, role: 'admin'})
      
      // if(authentication == false){
      //   throw new Error("Authentication Failed")
      // }
      console.log('masuks');
      
      const bodyparam = httpRequest.body

      const posted = await dataResetAssignTask(bodyparam)
      
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