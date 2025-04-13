import axios from "axios";
import {router} from "../router/index.js";
import {ElMessage} from "element-plus";
import 'element-plus/theme-chalk/el-message.css'
import 'element-plus/theme-chalk/el-message-box.css'


axios.defaults.timeout = 10000
axios.defaults.headers.post['Content-Type'] = 'application/json;charset=UTF-8'

axios.interceptors.request.use(
    config => {
        let loginInfoStr = localStorage.getItem('login-info');
        if(loginInfoStr){
            try{
                let loginInfo = JSON.parse(loginInfoStr);
                config.headers['X-User-Name'] = loginInfo.user.username;
                config.headers['X-User-Nick'] = loginInfo.user.nickname;
                let token = loginInfo.token;
                if (token){
                    config.headers['Authorization'] = 'Bearer ' + token
                }
            }catch (e){
                localStorage.removeItem('login-info')
            }
        }
        return config
    }
)
axios.interceptors.response.use(
    response => {
        if (response.status === 200) {
            return Promise.resolve(response.data)
        } else {
            console.log(response.data.message)
            return Promise.reject(response.data)
        }
    },
    // 服务器状态码不是200的情况
    error => {
        if (error.response){
            if (error.response.status) {
                // error.response.data = JSON.parse(error.response.data)
                if (error.response.status === 401) {
                    // 跳到登录页
                    router.replace({name: 'Login'})
                    return Promise.reject(error.response.data)
                } else if (error.response.status === 400) {
                    const msg = error.response.data.message;
                    ElMessage.error(msg);
                    console.error(msg)
                } else if (error.response.status === 403){
                    console.error('您无权访问该内容')
                } else {
                    console.error('网络错误，请稍后再试')
                }
                return Promise.reject(error.response.data)
            }
        }
    }
)

export default axios
