import jwt from 'jsonwebtoken'
const Cryptr = require('cryptr');
const cryptr = new Cryptr('myTotalySecretKey');

export default function loginAdminService({adminDb}) {
  return async function loginAdmin(body){
    try {
      
      const user = await adminDb.getUser(body)
      
      if(user != undefined){
        const password = cryptr.decrypt(user.password);
        console.log('pass', password);
        
        switch (password) {
          case body.password:
            //send jwt
            const payload = {id: user.user_id, email: user.email, name: user.fullname, role: user.role}
            const token = jwt.sign({...payload}, 'chure-auth', { expiresIn: 60 * 60 });
            
            return {status: true, data: token, message: 'login success'}

          default:
            //send error pass not same
            return {status: false, message: 'password you entered is not correct'}
          
        }
      }

      return {status: false, message: 'email you entered is not correct'}

    } catch (error:any) {
      throw new Error(error)
    }

  } 
}