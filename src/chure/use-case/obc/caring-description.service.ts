export default function caringDescriptionService({obcDb}) {
  return async function caringDescription(body){
    try {
      
      const getDescription = await obcDb.getCaringDescription(body)

      // if(getData != undefined){
        return {
          responseCode: 200,
          message: 'sucess',
          data: getDescription,
          error: '',
        }
      // }

      // return {
      //   responseCode: 404,
      //   message: 'data not found',
      //   data: null, 
      //   error: 'data not found',
      // }

    } catch (error:any) {
      throw new Error(error)
    }

  }            
}