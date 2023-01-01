import jwt from 'jsonwebtoken'
const Cryptr = require('cryptr');
const cryptr = new Cryptr('myTotalySecretKey');
 
export default function loginObcService({obcDb}) {
  return async function loginObc(body){
    try {
      
      const user = await obcDb.getUser(body)

      if(user != undefined){
        const password = cryptr.decrypt(user.password);
        switch (password) {
          case body.password:
            //send jwt
            const payload = {username: user.username, email: user.email, role: user.role}
            const token = jwt.sign({...payload}, 'chure-auth', { expiresIn: 60 * 60 });
            
            return {status: true, data: token, message: 'login success'}

          default:
            //send error pass not same
            return {status: false, message: 'password you entered is not correct'}
          
        }
      }

      return {status: false, message: 'email/username you entered is not correct'}
     
    } catch (error:any) {
      throw new Error(error)
    }

  } 
}