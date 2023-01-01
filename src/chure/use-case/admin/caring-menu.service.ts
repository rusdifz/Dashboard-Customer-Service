export default function caringMenuService({adminDb}) {
  return async function caringMenu(body){
    try {

      const needCaring = await adminDb.getNeedCaring(body)
      const chunrPerformance = await adminDb.getChurePerformance()
      const customers = await adminDb.getCustomers()

      return {
        responseCode: 200,
        message: 'success',
        data: {
          overview: {
            churn_prevented: '200 users', 
            churn: '100 users',
            high_churn_probability: needCaring+" users",
            new_customers: '2,197'
          }, 
          churn_performance: {
            data: chunrPerformance,
            filter: ['daily', 'monthly', 'yearly']
          },
          main_problem: {
            tagihan_tidak_sesuai: '62%',
            paket_kemahalan: '88%',
            gangguan_ulang: '87%'
          },
          users_with_high_churn_prob: customers, 
          general_filter: ['YTD', 'MTD', 'Full Year']
        },
        error: '',
      }
      
    } catch (error:any) {
      throw new Error(error)
    }

  }    
}