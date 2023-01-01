import moment from 'moment'
moment.locale('id')
export default function makeObcDb({Query}) {
    return Object.freeze({
      getUser, 
      getCustomers, 
      myPerformanceDiagram, 
      getCaringActivity, 
      getCaringDescription, 
      getListObc, 
      submitCaring, 
      getReports, 
      checkEmailId, 
      checkName, 
      getUserIdLast,
      insertNewUser, 
      getPicList
    })
  
    async function getUser(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT * FROM user WHERE email = '${body.email}' AND role = 'obc'`;
  
          let result = await Query(sql);
  
          if(result.length>0){
            resolve(result[0])
          }else{
            resolve(undefined)
          }
           
        } catch(error){
          reject(new Error('chureDb-getUser '+error));
        }
      })
    }

    async function getCustomers(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT chc.name as 'customer', chc.internet_id, chc.main_problem, chc.unit_pic, chc.status, chc.churn_prob, chc.action 
                      FROM customers_high_churn chc LEFT JOIN obc_task ot ON chc.internet_id = ot.customer_id WHERE ot.obc_id = '${body.id}' AND chc.status != 'OPEN'
                      ORDER BY chc.id asc`;

          let result = await Query(sql);
  
          if(result.length>0){
            // const data = await Promise.all(
            //   result.map(dt=>{
            //     if(dt.status != 'CLOSED'){
            //       dt.action = 'Re-caring'
            //     }
            //     return dt
            //   })
            // )

            resolve(result)
          }else{
            resolve([])
          }

          // resolve(data)
           
        } catch(error){
          reject(new Error('obcDb-getUser '+error));
        }
      })
    }

    async function myPerformanceDiagram(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT month, jumlah_caring, target_caring FROM performance_diagram ORDER BY month asc`;
  
          let result = await Query(sql);
  
          if(result.length>0){
            resolve(result)
          }else{
            resolve(undefined)
          }
    
        } catch(error){
          reject(new Error('obcDb-myPerformanceDiagram '+error));
        }
      })
    }

    async function getCaringActivity(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT chc.name as 'customer', chc.internet_id, chc.main_problem, chc.unit_pic, chc.status, chc.churn_prob, chc.action, 
                      chc.description1, chc.description2, chc.description3, chc.description4, chc.description5 
                      FROM customers_high_churn chc LEFT JOIN obc_task ot ON chc.internet_id = ot.customer_id WHERE ot.obc_id = '${body.id}' ORDER BY chc.status asc, chc.id asc`;
  
          let result = await Query(sql);
  
          if(result.length>0){
            const data = await Promise.all(
              result.map(data2=>{
                data2.action = ["MyCx", "FCR"]
                return data2
              })
            )

            resolve(data)
          }else{
            resolve([])
          }
           
        } catch(error){
          reject(new Error('obcDb-getCaringActivity'+error));
        }
      })
    }

    async function getCaringDescription(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          const outcome = body.outcome.toLowerCase()
          console.log('out', outcome);
          
          let data

          switch (outcome) {
            case "sukses winback":
              data = ["Paket Existing", "Paket Retensi", "Pola Cicilan", "Paket Prepaid"]
              resolve(data)
              break;

            case "clearing tagihan":
              data = ["Clearing Deposit PSB", "Clearing Uang Titipan CAPS"]
              resolve(data)
              break;
          
            case "gagal caring (not ontacted)":
              data = ['Telepon Tulalit', 'Telepon Tidak Diangkat - RNA', 'Telepon Salah Sambung', 'Mail Box - Memo', 'Line Busy', 'Invalid Phone Number', 'Call Rejected', 'ND_HP CP Tidak Aktif']
              resolve(data)
              break;
            default:
              data = ['Janji Bayar', 'Minta Call Ulang', 'Layanan Belum Aktif', 'Tidak Merasa Pasang', 'Bukan Pelanggan Bersangkutan', 'Kecepatan Tidak Sesuai Yang Di Janjikan', 'Pindah Ke Kompetitor Non-Mobile', 'Tidak Sempat Baya/ Sibuk/ Lupa', 'Pindah Rumah/ Selesai Kontrak', 'Kendala Keuangan/ Bangkrut', 'Tidak Tahu Tagihan/ Tidak Tahu Cara Bayar', 
              'Jarang Dipakai', 'Pasang Tinggal/ Cabut Pasang', 'Kemahalan', 'Tarif Tidak Sesuai Janji', 'Sering Gangguan/ Gangguan Berulang', 'Tidak Bisa Browsing', 'Tagihan Melonjak', 'CAPS Muncul Tagihan']
              resolve(data)
              break;
          }

          // resolve(data)
           
        } catch(error){
          reject(new Error('obcDb-getUser '+error));
        }
      })
    }

    async function getListObc(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT fullname, user_id, success_rate FROM user WHERE role = 'obc'`;

          let result = await Query(sql);
          console.log('res', result);
          
          if(result.length>0){
            // resolve(result[0])
            const data = await Promise.all(
              result.map(async obc => {
                
                let sql = `SELECT COUNT(id) as 'task' FROM obc_task WHERE obc_id = '${obc.user_id}' AND status = 'Assigned'`
                
                const ongoingTask = await Query(sql)
                console.log('on', ongoingTask);
                
                let task = '1'

                if(ongoingTask.length>0){
                  task = ongoingTask[0].task
                }

                return {
                  obc: obc.fullname, 
                  id: obc.user_id, 
                  ongoing_task: task,
                  success_rate: obc.success_rate 
                }
              })
            )

            resolve(data)
          }else{
            resolve(undefined)
          }
           
        } catch(error){
          reject(new Error('obcDb-getListObc '+error));
        }
      })
    }

    async function submitCaring(body){
      return new Promise(async function(resolve, reject) {
        try{

          let inserts = [
            'CLOSED', 
            'Success'
          ]
          let status = 'Success'

          if(body.caringSuccess.toLowerCase() == 'no'){
            inserts = [
              'PENDING', 
              'Re-Caring'
            ]
            status = 'Re-Caring'
          }

            const sql = `UPDATE customers_high_churn SET
                        status = ?, 
                        action = ?
                        WHERE internet_id = ${body.internetId}`
            
            let assign = await Query(sql,inserts);
  
            if(assign.affectedRows > 0){  
 
              const sql2 = `UPDATE obc_task SET
                        status = '${status}'
                        WHERE customer_id = '${body.internetId}' AND obc_id = '${body.obcId}'`
            
              await Query(sql2);  

              resolve(true)
            }else{
              resolve(false)
            }

        }catch(error){
          reject(new Error('obcDb-submitCaring'+error));
        }
  
      })
    }

    async function getReports(body){
      return new Promise(async function(resolve, reject) {
        try{
          const arr = ['SUKSES WINBACK', 'CLEARING TAGIHAN', 'GAGAL CARING (NOT CONTACTED)', 'GAGAL CARING (CONTACTED)']

          const dataTable1 = await Promise.all(
            arr.map(async dt=>{
              let sql = `SELECT hasil_caring, daily, bulan_ini, share_bulan_ini FROM reports_table1 WHERE title = '${dt}' ORDER BY id asc`
              let result = await Query(sql)
              return {
                title: dt, 
                data: result
              }
            })
          )
          
          let sqlPencairan = `SELECT uraian, ssl2 as 'ssl', rupiah FROM reports_pencairan ORDER BY id asc`
          let resPencairan = await Query(sqlPencairan)

          let sqlRekap = `SELECT uraian, hari_ini, bulan_ini, share FROM reports_rekapitulasi_hasil_caring  ORDER BY id asc`
          let resRekap = await Query(sqlRekap)

          const dataTable2 = [
            {
              title: 'PENCAIRAN', 
              data: resPencairan
            }, 
            {
              title: 'REKAPITULASI HASIL CARING', 
              data: resRekap
            }
          ]

          resolve({tabel1: dataTable1, tabel2: dataTable2, general_filter: ['YTD', 'MTD', 'Full Year']})
        }catch(error){
          reject(new Error('obcDb-assignTask'+error));
        }
  
      })
    }

    async function checkEmailId(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT * FROM user WHERE email = '${body.email}'`;
  
          let result = await Query(sql);
  
          if(result.length>0){
            resolve(true)
          }else{
            resolve(false)
          }
         
        } catch(error){
          reject(new Error('obcDb-checkEmailId '+error));
        }
      })
    }

    async function checkName(body){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT * FROM user WHERE fullname = '${body.name}'`;
  
          let result = await Query(sql);
  
          if(result.length>0){
            resolve(true)
          }else{
            resolve(false)
          }
         
        } catch(error){
          reject(new Error('obcDb-checkNname'+error));
        }
      })
    }

    async function getUserIdLast(){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT user_id FROM user WHERE role = 'obc' order by id desc`;
  
          let result = await Query(sql);
  
          if(result.length>0){
            resolve(result[0].user_id)
          }else{
            resolve('')
          }
         
        } catch(error){
          reject(new Error('obcDb-getUserIdLast'+error));
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
                        lokasi = ?, 
                        jabatan_kerja = ?, 
                        pic = ?,
                        role = ?, 
                        created_time = ?`;
  
          let inserts = [
              body.getUserId(), 
              body.getEmail(),
              body.getPassword(),
              body.getName(),
              body.getLokasi(),
              body.getJabatanKerja(),
              body.getPic(),
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
          reject(new Error('obcDb-insertNewUser'+error));
        }
      })
    }

    async function getPicList(){
      return new Promise(async function(resolve, reject) {
        try{
  
          let sql = `SELECT user_id, fullname as 'name' FROM user WHERE role = 'admin' order by id asc`;
  
          let result = await Query(sql)
  
          if(result.length>0){
            resolve(result)
          }else{
            resolve([])
          }
         
        } catch(error){
          reject(new Error('obcDb-getPicList'+error));
        }
      })
    }
   
  }

  
    
  

  // await Promise.all(
  //   data.map(async admin=>{

  //     let sql = `INSERT INTO customers_high_churn SET
  //               name = ?,
  //               internet_id = ?, 
  //               main_problem = ?, 
  //               unit_pic = ?, 
  //               status = ?, 
  //               churn_prob = ?, 
  //               action = ?,
  //               description1 = ?, 
  //               description2 = ?, 
  //               description3 = ?, 
  //               description4 = ?, 
  //               description5 = ?,  
  //               created_time = ?`;

  //     let inserts = [
  //       admin.customer, 
  //       admin.internet_id,
  //       admin.main_problem, 
  //       admin.unit_pic, 
  //       admin.status, 
  //       admin.churn_prob, 
  //       admin.action,
  //       admin.description1, 
  //       admin.description2, 
  //       admin.description3, 
  //       admin.description4, 
  //       admin.description5,
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