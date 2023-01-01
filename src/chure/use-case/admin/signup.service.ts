export default function signupAdminService({adminDb,makeUserAdmin,cryptr}) {
  return async function signupAdmin(body){
    try {
    
      const checkEmailId = await adminDb.checkEmailId(body.email)
     
      switch (checkEmailId) {
        case false:
          const checkName = await adminDb.checkName(body.name)
          
          switch (checkName) {
            case false:

              const checkNikTele = await adminDb.checkNikTele(body.nikPortal, body.idTelegram)
              
              if(checkNikTele == false){
                const checkUserId = await adminDb.getUserIdLast()
                
                let userId = 'adm001'
                
                if(checkUserId.length > 0){
                  const no = checkUserId.length-3
                  const str = checkUserId.substr(3,no)
                  const int = parseInt(str)+1
                  
                  if(int>9 && int<99){
                    userId = 'adm0'+int
                  }else if(int>99){
                    userId = 'adm'+int
                  }else{
                    userId = 'adm00'+int
                  }
                }

                const password = cryptr.encrypt(body.password);
                
                const user = await makeUserAdmin({...body, userId: userId, password: password})
                
                const insertNewUser = await adminDb.insertNewUser(user)
                console.log('insertNewUser', insertNewUser);
                
                return {status: true, message: 'Register Success'}
              }

              return {status: false, message: 'Nik or Id Telegram already exist'}
          
            default:
              return {status: false, message: 'username already exist'}
          }
          
        default:
          return {status: false, message: 'Email Id already exist'}
      }

    } catch (error:any) {
      throw new Error(error)
    }

  } 
}