export default function signupAdminController({dataSignupAdmin}){      
    return async function signupAdmin(httpRequest) {
      try {
  
        const bodyparam = httpRequest.body
  
        const data = await dataSignupAdmin(bodyparam)
        
        let posted
  
        if(data.status == true){
  
          posted = {
            responseCode: 200, 
            message: data.message,
            data: data.data,
            error: ''
          }
          
        }else{
  
          posted = {
            responseCode: 401, 
            message: data.message,
            data: {},
            error: data.message
          }
  
        }
  
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