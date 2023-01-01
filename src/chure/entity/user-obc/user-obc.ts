export default function buildMakeUserObc(moment){
  return function makeUserObc({
    userId = '', 
    email = '',
    password = '',
    name = '',
    lokasi = '',
    jabatanKerja = '',
    pic = '',
    role = 'obc',
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

    if (!lokasi){
      throw new Error('Lokasi must be exist')
    }

    if (!jabatanKerja){
      throw new Error('Jabatan Kerja must be exist')
    }

    if (!pic){
      throw new Error('PIC must be exist')
    }

    return Object.freeze({
      getUserId : () => userId, 
      getEmail : () => email, 
      getPassword : () => password,
      getName : () => name, 
      getLokasi : () => lokasi, 
      getJabatanKerja : () => jabatanKerja, 
      getPic : () => pic, 
      getRole : () => role, 
      getCreatedTime : () => createdTime
    })
  
  }        
}    