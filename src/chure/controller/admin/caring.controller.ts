export default function caringController({dataCaringMenu,authJwt}){      
  return async function caring(httpRequest) {
    try {

      const authentication = await authJwt({jwt: httpRequest.auth, role: 'admin'})
      
      if(authentication == false){
        throw new Error("Authentication Failed")
      }
      
      const bodyparam = httpRequest.params

      const posted = await dataCaringMenu(bodyparam)
      
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