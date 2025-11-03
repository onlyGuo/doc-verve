import {createRouter, createWebHashHistory} from 'vue-router'
import Login from "../views/Login.vue";
import Index from "../views/admin/Index.vue";
import Article from "../views/admin/Article.vue";


const routes = [
    {
        path: '/',
        redirect: '/admin',
    },
    {
        path: '/admin/login',
        name: 'Login',
        component: Login
    },
    {
        path: '/admin',
        component: Index,
        redirect: '/admin/articles',
        children: [
            {
                path: '/admin/articles',
                component: Article
            }
        ]
    },
]

export const router = createRouter({
    history: createWebHashHistory(),
    routes,
})
