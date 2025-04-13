<script setup>
import {ref, watch} from "vue";
import api from "../../libs/api.js";

const classifyTree = ref([])
const defaultActive = ref('0');
const selectClassify = ref()
const articleList = ref([])
const selectArticle = ref()


api.get('/api/v1/classify').then(res => {
  classifyTree.value = res;
  if (res[0].children){
    defaultActive.value = res[0].children[0].id + ''
    selectClassify.value = res[0].children[0];
  }else{
    defaultActive.value = res[0].id + ''
    selectClassify.value = res[0];
  }
})

const newClassify = () => {
  api.post('/api/v1/classify', {
    name: 'New Classify'
  }).then(res => {
    classifyTree.value.push(res);
  })
}
const newSubClassify = () => {
  api.post('/api/v1/classify', {
    name: 'New Classify',
    parentId: selectClassify.value.id
  }).then(res => {
    if(selectClassify.value.children){
      selectClassify.value.children.push(res);
    }else{
      selectClassify.value.children = [res];
    }
  })
}

const newArticle = () => {
  api.post('/api/v1/article', {
    classifyId: selectClassify.value.id,
    title: 'New Article',
    content: ''
  }).then(res => {
    articleList.value.push(res);
    selectArticle.value = res;
  })
}

watch(selectClassify, () => {
  api.get(`/api/v1/article/${selectClassify.value.id}-0`).then(res => {
    articleList.value = res;
  })
})
</script>

<template>
<el-container>
  <el-aside>
    <el-button @click="newClassify">New Classify</el-button>
    <el-button @click="newSubClassify">New Sub Classify</el-button>
    <el-menu
        :default-active="defaultActive"
        class="el-menu-vertical-demo"
    >
      <el-scrollbar style="height: 100%">
        <div v-for="classify in classifyTree" :key="classify.id">
          <el-sub-menu v-if="classify.children" :index="classify.id + ''">
            <template #title>
              <span>{{classify.name}}</span>
            </template>
            <el-menu-item :index="subClassify.id + ''" v-for="subClassify in classify.children">{{subClassify.name}}</el-menu-item>
          </el-sub-menu>
          <el-menu-item v-else :index="classify.id + ''">
            {{classify.name}}
          </el-menu-item>
        </div>
      </el-scrollbar>
    </el-menu>
  </el-aside>
  <el-main v-if="selectClassify" style="height: 100%">
    <el-form inline>
      <el-form-item style="width: calc(100% - 100px)">
        <el-input placeholder="请输入分类名称" v-model="selectClassify.name"/>
      </el-form-item>
      <el-form-item style="margin-right: 0">
        <el-button>保存</el-button>
      </el-form-item>
    </el-form>
    <el-container style="height: calc(100% - 52px)">
      <el-aside width="200px">
        <el-button @click="newArticle">New Article</el-button>
        <el-scrollbar style="height: calc(100% - 40px)">
          <div class="article-title" v-for="article in articleList" :key="article.id">{{article.title}}</div>
        </el-scrollbar>
      </el-aside>
      <el-main>
        <el-form inline>
          <el-input placeholder="文章标题" style="width: calc(100% - 150px)"/>
          <el-input placeholder="作者" style="width: 85px"/>
          <el-button>Save</el-button>
        </el-form>

      </el-main>
    </el-container>
  </el-main>
</el-container>
</template>

<style scoped>
.el-menu-vertical-demo{
  height: calc(100% - 40px);
}
.article-title{
  border: solid 1px #ddd;
  padding: 5px 10px;
  border-radius: 5px;
  cursor: pointer;
}
</style>