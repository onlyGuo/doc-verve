<script setup>
import {ref, watch} from "vue";
import api from "../../libs/api.js";
import { MdEditor } from 'md-editor-v3';
import 'md-editor-v3/lib/style.css';
import {ElMessage} from "element-plus";

const classifyTree = ref([])
const defaultActive = ref('0');
const selectClassify = ref()
const articleList = ref([])
const selectArticle = ref()

api.get('classify').then(res => {
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
  api.post('classify', {
    name: 'New Classify'
  }).then(res => {
    classifyTree.value.push(res);
  })
}
const newSubClassify = () => {
  api.post('classify', {
    name: 'New Classify',
    parentId: selectClassify.value.parentId ? selectClassify.value.parentId : selectClassify.value.id
  }).then(res => {
    if(selectClassify.value.children){
      selectClassify.value.children.push(res);
    }else{
      selectClassify.value.children = [res];
    }
  })
}

const newArticle = () => {
  api.post('article', {
    classifyId: selectClassify.value.id,
    title: 'New Article',
    content: ''
  }).then(res => {
    articleList.value.push(res);
    selectArticle.value = res;
  })
}

watch(selectClassify, () => {
  api.get(`article/${selectClassify.value.id}-0`).then(res => {
    articleList.value = res;
  })
})

const onUploadImg = async (files, callback) => {
  const res = await Promise.all(
      files.map((file) => {
        return new Promise((rev, rej) => {
          const form = new FormData();
          form.append('file', file);

          api
              .post('img/upload', form, {
                headers: {
                  'Content-Type': 'multipart/form-data',
                },
              })
              .then((res) => rev(res))
              .catch((error) => rej(error));
        });
      })
  );

  callback(res.map((item) => item.url));
};

const saveArticle = () => {
  api.put('article', selectArticle.value).then(res => {
    ElMessage({
      message: '保存成功',
      type: 'success'
    })
  })
}

const useSelectedClassify = (list, index) => {
  const classify = list.find(item => (item.id + '') === (index + ''));
  if (classify) {
    selectClassify.value = classify;
  }else{
    const subClassify = [];
    list.forEach(item => {
      if (item.children) {
        subClassify.push(...item.children);
      }
    })
    if (subClassify.length === 0) {
      return;
    }
    useSelectedClassify(subClassify, index);
  }
}
</script>

<template>
<el-container>
  <el-aside>
    <el-button @click="newClassify">New Classify</el-button>
    <el-button @click="newSubClassify">New Sub Classify</el-button>
    <el-menu
        :default-active="defaultActive"
        class="el-menu-vertical-demo"
        @select="useSelectedClassify(classifyTree, $event)"
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
          <div class="article-title" :class="{active: selectArticle === article}"
               @click="selectArticle = article" v-for="article in articleList" :key="article.id">{{article.title}}</div>
        </el-scrollbar>
      </el-aside>
      <el-main v-if="selectArticle">
        <el-form inline>
          <el-input placeholder="文章标题" style="width: calc(100% - 150px)" v-model="selectArticle.title"/>
          <el-input placeholder="作者" style="width: 85px" v-model="selectArticle.author"/>
          <el-button @click="saveArticle">Save</el-button>
        </el-form>
        <md-editor
            style="height: calc(100% - 40px)"
            v-model="selectArticle.content"
            :preview="true"
            :toolbar="['bold', 'italic', 'underline', 'h1', 'h2', 'h3', 'quote', 'code', 'ul', 'ol']"
            @onUploadImg="onUploadImg"
            ></md-editor>
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
  &:hover{
    background-color: #f5f5f5;
  }
  &.active{
    background-color: #f5f5f5;
    border: solid 1px #409eff;
  }
}
</style>
