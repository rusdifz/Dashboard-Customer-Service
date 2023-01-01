export default function downloadReportsService({}) {
  return async function downloadReports(body){
    try {
      
      if(body.result == "blob"){
        return {
          responseCode: 200,
          message: 'sucess',
          data: "blob",
          error: '',
        }
      }

      let filename = "reports.pdf"

      if(body.file == "excel"){
        filename = "reports.xlsx"
      }

      return {
        responseCode: 200,
        message: 'sucess',
        data: {
          filename: filename
        },
        error: '',
      }
      

    } catch (error:any) {
      throw new Error(error)
    }

  }            
}