export default function resetAssignTaskService({adminDb}) {
    return async function resetAssignTask(body){
      try {
        
        console.log('usecase');
        
        const resetData = await adminDb.resetAssignTask()
        console.log('resetData');
        
        if(resetData == true){
          //ganti status di tabel customers jadi pending
          return {
            responseCode: 201,
            message: 'success',
            data: 'Success Reset Data Assign Task',
            error: '',
          }
        }
  
        return {
          responseCode: 400,
          message: 'failed',
          data: null, 
          error: 'Failed Reset Data Assign Task',
        }
      
      } catch (error:any) {
          // console.log('catch')
          throw new Error(error)
        }
  
    }   
  }  