export default function submitCaringService({obcDb,decodeJwt}) {
  return async function submitCaring(body){
    try {

      const obc = await decodeJwt(body.jwt)
      const update = await obcDb.submitCaring({...body, obcId: obc.id})

      if(update == true){
        //ganti status di tabel customers jadi pending
        return {
          responseCode: 201,
          message: 'success',
          data: 'Success Submit Caring',
          error: '',
        }
      }

      return {
        responseCode: 400,
        message: 'failed',
        data: null, 
        error: 'Failed Submit Caring',
      }
    
    } catch (error:any) {
        // console.log('catch')
        throw new Error(error)
      }

  }       
}  