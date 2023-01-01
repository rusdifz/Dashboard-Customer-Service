export default function dashboardAdminService({adminDb}) {
  return async function dashboardAdmin(body){
    try {

      const needCaring = await adminDb.getNeedCaring(body)
      const churnAnalytic = await adminDb.getChurnAnalytic(body)
      const recCaringActivity = await adminDb.getRecentCaringActivity(body)
      const regionalTable = await adminDb.getRegionalTable(body)

      return {
        responseCode: 200,
        message: 'success',
        data: {
          overview: {
            churn_to_list: '3%',
            churn_to_list_up: '16,24 %', 
            new_churn_prediction: '10',
            new_churn_prediction_up: '10,82 %',
            need_caring: needCaring.toString(),
            churn_goal: '3%',
            churn_goal_2: '68%'
          }, 
          churn_analytics: churnAnalytic,
          recent_caring_activity: recCaringActivity,
          regional_table: regionalTable, 
          general_filter: ['YTD', 'MTD', 'Full Year']
        }, 
        error: '',
      }

  
    } catch (error:any) {
      throw new Error(error)
    }

  }
}

// if(getData != undefined){
// }
// return {
//   responseCode: 404,
//   message: 'data not found',
//   data: null, 
//   error: 'data not found',
// }