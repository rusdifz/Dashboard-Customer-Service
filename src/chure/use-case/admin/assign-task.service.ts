export default function assignTaskService({adminDb,makeTask}) {
  return async function assignTask(body){
    try {

      const task = await makeTask(body)
      
      const checkObc = await adminDb.checkObcData(task)

      if(checkObc == true){
        const insertData = await adminDb.assignTask(task)

        if(insertData == true){
          //ganti status di tabel customers jadi pending
          return {
            responseCode: 201,
            message: 'success',
            data: 'Success Assign Task',
            error: '',
          }
        }

        return {
          responseCode: 400,
          message: 'failed',
          data: null, 
          error: 'Failed Assign Task',
        }
      }

      return {
        responseCode: 400,
        message: 'failed',
        data: null, 
        error: 'Obc Not Found',
      }
    
    } catch (error:any) {
        // console.log('catch')
        throw new Error(error)
      }

  }   
}  