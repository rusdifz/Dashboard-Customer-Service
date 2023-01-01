export default function myPerformanceService({obcDb,decodeJwt}) {
  return async function myPerformance(body){
    try {

      const obc = await decodeJwt(body.jwt)
      console.log('obc', obc);
      
      const customers = await obcDb.getCustomers(obc)
      const diagram = await obcDb.myPerformanceDiagram()

      // if(customers != undefined && diagram != undefined){
        return {
          responseCode: 200,
          message: 'success',
          data: {
            data_diagram: diagram,
            users_with_high_churn_prob: customers,
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
      // }

    } catch (error:any) {
      throw new Error(error)
    }

  }            
}