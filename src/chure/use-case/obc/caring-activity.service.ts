export default function caringActivityService({obcDb,decodeJwt}) {
  return async function caringActivity(body){
    try {
      const obc = await decodeJwt(body.jwt)
      const getDataCaring = await obcDb.getCaringActivity(obc)

      // if(getDataCaring != undefined){
        return {
          responseCode: 200,
          message: 'success',
          data: {
            data_caring: getDataCaring,
            general_filter: ['YTD', 'MTD', 'Full Year']
          },
          error: '',
        }
      // }

      // return {
      //   responseCode: 404,
      //   message: 'data not found',
      //   data: null, 
      //   error: 'data not found',
      // }s

    } catch (error:any) {
      throw new Error(error)
    }

  }        
}