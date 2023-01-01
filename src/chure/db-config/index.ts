import mysql from 'mysql'
import makeAdminDb from './admin-db'
import makeObcDb from './obc-db'
require('dotenv').config();

let host = process.env.DB_HOST
let user = process.env.DB_USER
let pass = process.env.DB_PASS
let database = process.env.DB_DATABASE
let port = process.env.DB_PORT

let mysqlConnectionMaster = mysql.createPool ({
    connectionLimit : 10,
    host :  host,
    user : user,
    password: pass,
    database : database,
    port: 3306,
    multipleStatements : true,
    dateStrings: true,
    max: 1000, 
    min: 1
});

  mysqlConnectionMaster.getConnection((err) => {
    if (!err)
      console.log('DB koneksi master sukses');
    else
      console.log('DB koneksi master error : ' + JSON.stringify(err,undefined, 2));
  });

function Query(sql, insert) {
  return new Promise(async (resolve, reject) => {
    const db = mysqlConnectionMaster;
    db.getConnection(async function(error, conn) {
      if (error) {
        return reject(new Error(error));
      }
      var query = await conn.query(sql, insert, (err, results, fields) => {
        if (err) {
          return reject(new Error("querry master error " + err));
        } else {
          resolve(results);
          conn.release();
        }
      });
      console.log('query ', query.sql);
      
    });
  });
}

const adminDb = makeAdminDb({Query})
const obcDb = makeObcDb({Query})

const model = Object.freeze({
  adminDb, 
  obcDb  
})

export default (model)
export {
  adminDb,
  obcDb
}