export default function signupObcService({obcDb,makeUserObc,cryptr}) {
  return async function signupObc(body){
    try {
    
      const checkEmailId = await obcDb.checkEmailId(body.email)
     
      switch (checkEmailId) {
        case false:
          
          const checkUserId = await obcDb.getUserIdLast()
                
          let userId = 'obc001'
          
          if(checkUserId.length > 0){
            const no = checkUserId.length-3
            const str = checkUserId.substr(3,no)
            const int = parseInt(str)+1
            
            if(int>9 && int<99){
              userId = 'obc0'+int
            }else if(int>99){
              userId = 'obc'+int
            }else{
              userId = 'obc00'+int
            }
          }

          const password = cryptr.encrypt(body.password);
          
          const user = await makeUserObc({...body, userId: userId, password: password})
          
          const insertNewUser = await obcDb.insertNewUser(user)
          console.log('insertNewUser', insertNewUser);
          
          return {status: true, message: 'Register Success'}
          
        default:
          return {status: false, message: 'Email Id already exist'}
      }

    } catch (error:any) {
      throw new Error(error)
    }

  } 
}

// const checkName = await obcDb.checkName(body.name)
// switch (checkName) {
//   case false:

//     const checkUserId = obcDb.getUserIdLast()
      
//       let userId = 'obc001'
      
//       if(checkUserId.length > 0){
//         const no = checkUserId.length-3
//         const str = checkUserId.substr(3,no)
//         const int = parseInt(str)+1
        
//         if(int>9 && int<99){
//           userId = 'obc0'+int
//         }else if(int>99){
//           userId = 'obc'+int
//         }else{
//           userId = 'obc00'+int
//         }
//       }

//       const password = cryptr.encrypt(body.password);
//       console.log('pass', password);
      
//       const user = await makeUserObc({...body, userId: userId, password: password})
//       console.log('user', user.getPassword());
      
//       // const insertNewUser = await obcDb.insertNewUser(user)
//       return {status: true, data: userId, message: 'register success'}

//   default:
//     return {status: false, message: 'Name already exist'}
// }
          
          