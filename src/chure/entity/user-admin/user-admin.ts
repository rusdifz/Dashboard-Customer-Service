export default function buildMakeUserAdmin(moment){
  return function makeUser({
    userId = '', 
    email = '',
    password = '',
    name = '',
    nikPortal = '',
    idTelegram = '',
    role = 'admin',
    createdTime = moment().format('YYYY-MM-DD HH:mm:ss')
  } = {}) {

    if (!email){
      throw new Error('email must be exist')
    }

    if (!password){
      throw new Error('password must be exist')
    }

    if (!name){
      throw new Error('name must be exist')
    }

    if (!nikPortal){
      throw new Error('NIK Portal must be exist')
    }

    if (!idTelegram){
      throw new Error('Id Telegram must be exist')
    }

    return Object.freeze({
      getUserId : () => userId, 
      getEmail : () => email, 
      getPassword : () => password,
      getName : () => name, 
      getNikPortal : () => nikPortal,
      getIdTelegram : () => idTelegram, 
      getRole : () => role, 
      getCreatedTime : () => createdTime
    })
  
  }        
}    