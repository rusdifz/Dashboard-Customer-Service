export default function caringOutcomeService({obcDb}) {
    return async function caringOutcome(body){
      try {
        
        const outcome = ["Sukses Winback", "Clearing Tagihan", "Gagal Caring (Not Contacted)", "Gagal Caring (Contacted)"]

        // if(getData != undefined){
          return {
            responseCode: 200,
            message: 'sucess',
            data: outcome,
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