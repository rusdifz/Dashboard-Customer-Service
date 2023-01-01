export default function reportsService({obcDb}) {
  return async function reports(body){
    try {
   
      const getData = await obcDb.getReports(body)
      
      // if(getData != undefined){
        return {
          responseCode: 200,
          message: 'success',
          data: getData,
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