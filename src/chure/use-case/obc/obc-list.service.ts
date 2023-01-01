export default function obcListService({obcDb}) {
  return async function obcList(body){
    try {
    
      const listObc = await obcDb.getListObc(body)

      if(listObc != undefined){
        return {
          responseCode: 200,
          message: 'success',
          data: listObc,
          error: '',
        }
      }

      return {
        responseCode: 404,
        message: 'data not found',
        data: [], 
        error: 'data not found',
      }

    } catch (error:any) {
      throw new Error(error)
    }

  }                
}