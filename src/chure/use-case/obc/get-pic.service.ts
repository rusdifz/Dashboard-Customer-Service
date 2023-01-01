export default function getPicListService({obcDb}) {
  return async function getPicList(body){
    try {
    
      const listPic = await obcDb.getPicList(body)

      if(listPic != undefined){
        return {
          responseCode: 200,
          message: 'success',
          data: listPic,
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