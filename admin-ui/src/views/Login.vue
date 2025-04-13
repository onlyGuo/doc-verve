<script setup>
import {ref} from "vue";
import api from "../libs/api.js";
import {router} from "../router/index.js";

const fromData = ref({
  username: '',
  password: ''
})
const login = () => {
  api.post('/api/v1/user/login', fromData.value).then(res => {
    localStorage.setItem('login-info', res)
    router.replace({
      path: '/admin'
    })
  })
}
</script>

<template>
<div class="login-box">
  <el-form label-width="auto">
    <el-form-item label="用户名">
      <el-input placeholder="请输入用户名" v-model="fromData.username"/>
    </el-form-item>
    <el-form-item label="密码">
      <el-input placeholder="请输入密码" type="password" v-model="fromData.password"/>
    </el-form-item>
    <el-form-item>
      <el-button @click="login">登录</el-button>
    </el-form-item>
  </el-form>
</div>
</template>

<style scoped lang="less">
.login-box{
  width: 300px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 10px;
  margin: auto;
}
</style>