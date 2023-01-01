import moment from 'moment'
moment.locale('id')

export default function makeAdminDb({Query}) {
    return Object.freeze({
      getUser, 
      getChurnAnalytic, 
      getRegionalTable, 
      getChurePerformance, 
      getCustomers, 
      getNeedCaring, 
      assignTask, 
      getRecentCaringActivity, 
      resetAssignTask, 
      checkObcData, 
      checkEmailId, 
      checkName,
      checkNikTele, 
      getUserIdLast, 
      insertNewUser
    })
  
    async function getUser(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT * FROM user WHERE email = '${body.email}'`;
  
          let result = await Query(sql);
  
          if(result.length>0){
            resolve(result[0])
          }else{
            resolve(undefined)
          }
           
        } catch(error){
          reject(new Error('adminDb-getUser '+error));
        }
      })
    }

    async function getChurnAnalytic(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT year, month, new_sales, churn FROM churn_analytics ORDER BY id asc`;
  
          let result = await Query(sql);
  
          if(result.length>0){
            resolve(result)
          }else{
            resolve([])
          }
           
        } catch(error){
          reject(new Error('adminDb-getChurnAnalytic'+error));
        }
      })
    }

    async function getRegionalTable(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT regional, high_prob_churn FROM regional_table ORDER BY id asc LIMIT 7`;
  
          let result = await Query(sql);
  
          if(result.length>0){
            const data = await Promise.all(
              result.map(async rg=>{
                
                let sqlPic = `SELECT roc,cc,paycol FROM rg_pic WHERE regional = '${rg.regional}'`
                let sqlSs = `SELECT open,pending,closed FROM rg_solving_status WHERE regional = '${rg.regional}'`
                let result = await Query(sqlPic);
                let result2 = await Query(sqlSs);

                rg.pic = {
                  roc: result[0].roc, 
                  cc: result[0].cc,
                  paycol: result[0].paycol
                }

                rg.solving_status = {
                  open: result2[0].open, 
                  pending: result2[0].pending,
                  closed: result2[0].closed
                }

                return rg
              })
            )

            resolve(data)

          }
          
          resolve(undefined)
    
        } catch(error){
          reject(new Error('adminDb-getRegionalTable '+error));
        }
      })
    }

    async function getChurePerformance(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT month, churn_prob, current_lis, churn FROM chure_performance ORDER BY id asc`;
  
          let result = await Query(sql);
  
          if(result.length>0){
            resolve(result)
          }else{
            resolve(undefined)
          }
           
        } catch(error){
          reject(new Error('adminDb-getChurePerformance '+error));
        }
      })
    }

    async function getCustomers(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT name as 'customer', internet_id, main_problem, unit_pic, status, churn_prob, action_admin as 'action' FROM customers_high_churn ORDER BY action_admin asc LIMIT 60`;
  
          let result = await Query(sql);
          
          if(result.length>0){
            // const data = await Promise.all(
            //   result.map(async dt=>{

            //     // dt.action = 'Assign Task Now'
                
            //     // if(dt.status == 'PENDING'){
            //     //   dt.action = 'Assigned'
            //     // }
            //     let sql = `SELECT * FROM obc_task WHERE customer_id = '${dt.internet_id}'`;
  
            //     let result = await Query(sql);
                
            //     dt.action = 'Assign Task Now'
            //     if(result.length>0){
            //       dt.action = 'Assigned'
            //     }
                
            //     return dt
            //   })
            // )

            resolve(result)
          }else{
            resolve(undefined)
          }
           
        } catch(error){
          reject(new Error('adminDb-getCustomers '+error));
        }
      })
    }
     
    async function getNeedCaring(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT count(id) as 'count' FROM customers_high_churn`;
  
          let result = await Query(sql);
  
          if(result.length>0){
            resolve(result[0].count)
          }else{
            resolve(0)
          }
           
        } catch(error){
          reject(new Error('adminDb-getNeedCaring '+error));
        }
      })
    }
    
    async function assignTask(body){
      return new Promise(async function(resolve, reject) {
        try{
          let sqlCheck = `SELECT * FROM obc_task WHERE customer_id = '${body.getInternetId()}'`;
  
          let resultCheck = await Query(sqlCheck);

          if(resultCheck.length>0){
            resolve(false)
          }else{
            let sql = `INSERT INTO obc_task SET
                        obc_id = ?,
                        customer_id = ?,
                        status = ?,
                        created_time = ?`;
  
            let inserts = [
              body.getObcId(), 
              body.getInternetId(),
              body.getStatus(),
              body.getCreatedTime()
            ]
    
            let assign = await Query(sql,inserts);
    
            if(assign.affectedRows > 0){
              const sql = `UPDATE customers_high_churn SET
                            action_admin = 'Assigned'
                            WHERE internet_id = '${body.getInternetId()}'`
                    
              let update = await Query(sql);
              console.log('update', update);
              
              resolve(true)
            }else{
              resolve(false)
            }
          }
            
        }catch(error){
          reject(new Error('adminDb-assignTask'+error));
        }
  
      })
    }

    async function getRecentCaringActivity(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          // let sql = `SELECT name, last_time FROM recent_caring_activity ORDER BY id asc`;
          let sql = `SELECT c.name, ot.created_time FROM obc_task ot LEFT JOIN customers_high_churn c ON ot.customer_id = c.internet_id ORDER BY ot.created_time desc LIMIT 7`;
  
          let result = await Query(sql);
  
          if(result.length>0){
            const data = await Promise.all( 
              result.map(dt=>{

                let lastTime = moment(dt.created_time)
                let dateNow = moment()
                
                return {
                  name: dt.name, 
                  last_time: dateNow.diff(lastTime, 'minutes')+ ' minutes ago'
                }
              })
            )
            resolve(data)
          }else{
            resolve([])
          }
         
        } catch(error){
          reject(new Error('adminDb-getRecentCaringActivity '+error));
        }
      })
    }

    async function resetAssignTask(){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `DELETE FROM obc_task`;
  
          let result = await Query(sql);
  
          if(result.affectedRows>0){
            const sql = `UPDATE customers_high_churn SET
                            status = 'OPEN', 
                            action = 'Caring Now'
                            WHERE status = 'PENDING'`
                    
            let updateStatus = await Query(sql);

            const sql2 = `UPDATE customers_high_churn SET
                            action_admin = 'Assign Task Now'`
                
            let updateStatus2 = await Query(sql);
          
            console.log('update', updateStatus);
            resolve(true)
          }else{
            resolve(false)
          }
           
        } catch(error){
          reject(new Error('adminDb-resetAssignTask '+error));
        }
      })
    }
  
    async function checkObcData(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT * FROM user WHERE user_id = '${body.getObcId()}'`;
  
          let result = await Query(sql);
  
          if(result.length>0){
            resolve(true)
          }else{
            resolve(false)
          }
         
        } catch(error){
          reject(new Error('adminDb-checkObcData '+error));
        }
      })
    }

    async function checkEmailId(email){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT * FROM user WHERE email = '${email}'`;
  
          let result = await Query(sql);
  
          if(result.length>0){
            resolve(true)
          }else{
            resolve(false)
          }
         
        } catch(error){
          reject(new Error('adminDb-checkEmailId '+error));
        }
      })
    }

    async function checkName(name){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT * FROM user WHERE fullname = '${name}'`;
  
          let result = await Query(sql);
  
          if(result.length>0){
            resolve(true)
          }else{
            resolve(false)
          }
         
        } catch(error){
          reject(new Error('adminDb-checkNname'+error));
        }
      })
    }

    async function checkNikTele(nik,idTele){
      return new Promise(async function(resolve, reject) {
        try{
          
          let sql = `SELECT * FROM user WHERE nik_portal = '${nik}' OR id_tele = '${idTele}'`;
         
          let result = await Query(sql);
          
          if(result.length>0){
            resolve(true)
          }else{
            resolve(false)
          }
         
        } catch(error){
          reject(new Error('adminDb-checkNikTele'+error));
        }
      })
    }

    async function getUserIdLast(){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT user_id FROM user WHERE role = 'admin' order by id desc`;
  
          let result = await Query(sql);
  
          if(result.length>0){
            resolve(result[0].user_id)
          }else{
            resolve('')
          }
         
        } catch(error){
          reject(new Error('adminDb-getUserIdLast'+error));
        }
      })
    }

    async function insertNewUser(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `INSERT INTO user SET
                        user_id = ?,
                        email = ?, 
                        password = ?,
                        fullname = ?,
                        nik_portal = ?, 
                        id_tele = ?,
                        role = ?, 
                        created_time = ?`;
  
          let inserts = [
              body.getUserId(), 
              body.getEmail(),
              body.getPassword(),
              body.getName(),
              body.getNikPortal(),
              body.getIdTelegram(),
              body.getRole(),
              body.getCreatedTime()
            ]
            
          let assign = await Query(sql,inserts);
    
          if(assign.affectedRows > 0){  
            resolve(true)
          }else{
            resolve(false)
          }
         
        } catch(error){
          reject(new Error('adminDb-insertNewUser'+error));
        }
      })
    }

    // const data = [
    //   {
    //     name: 'Henry Rashford', 
    //     last_time: '5 minutes ago'
    //   }, 
    //   {
    //     name: 'Jack Chidwell', 
    //     last_time: '31 minutes ago'
    //   },
    //   {
    //     name: 'Marie Jones', 
    //     last_time: '2 hours ago'
    //   },
    //   {
    //     name: 'Manuel Wilkons', 
    //     last_time: '1 day ago'
    //   },
    //   {
    //     name: 'Peter Crouch', 
    //     last_time: '2 days ago'
    //   },
    //   {
    //     name: 'Paul Smith', 
    //     last_time: '3 days ago'
    //   },
    //   {
    //     name: 'Han Lee', 
    //     last_time: '4 days ago'
    //   }
    // ]


    // await Promise.all(
    //   data.map(async admin=>{

    //     let sql = `INSERT INTO recent_caring_activity SET
    //               name = ?,
    //               last_time = ?,
    //               created_time = ?`;

    //     let inserts = [
    //       admin.name, 
    //       admin.last_time,
    //       moment().format('YYYY-MM-DD HH:mm:ss')
    //     ]

    //     let assign = await Query(sql,inserts);

    //     if(assign.affectedRows > 0){
    //       console.log('success');
    //     }else{
    //       console.log('failed');
    //     }
    //   })
    // )
   
  }
    