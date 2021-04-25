import Vue from 'vue'
import VueRouter from 'vue-router'

//User
import User from '../views/Home.vue'
import Login from '../user/Login.vue'
import Home from '../user/Index.vue'
import Register from '../user/Register.vue'
import Productdetail from '../user/Productdetail.vue'

//Admin
const Admin = () =>
    import ('../views/Admin.vue')
const Productpage = () =>
    import ('../admin/product/Productpage.vue')
const ListUser = () =>
    import ('../admin/ListUser.vue')
const Category = () =>
    import ('../admin/category/Category.vue')
const Addproduct = () =>
    import ("../admin/product/Addproduct.vue")
const Updateproduct = () =>
    import ('../admin/product/Updateproduct.vue')
const Updatecategory = () =>
    import ('../admin/category/UpdateCategory.vue')
Vue.use(VueRouter)

const routes = [
    //User
    {
        path: '/',
        name: 'Home',
        component: User,
        children: [{
                path: '',
                name: 'index',
                component: Home
            },       
            {
                path: 'login',
                name: 'Login',
                component: Login
            },
            {
                path: 'register',
                name: 'Register',
                component: Register

            },
            {
                path: 'sanpham/:url',
                name: 'ProductDetail',
                component: Productdetail
            },
            {
                path: 'search/:search',
                name: "search",
                component: () =>
                    import ('../user/SearchProduct.vue')
            }

        ]
    },


    //Admin
    {
        path: '/admin',
        name: 'Admin',
        component: Admin,
        redirect: '/admin/category',
        children: [{
                path: 'sanpham',
                name: 'Productpage',
                component: Productpage,
            },
            {
                path: 'addproduct',
                name: 'addproduct',
                component: Addproduct,
            },
            {
                path: 'user',
                name: 'User',
                component: ListUser
            },
            {
                path: 'category',
                name: 'category',
                component: Category,
            },
            {
                path: ':id',
                name: 'updatecategory',
                component: Updatecategory,
            },
            {
                path: ':url',
                name: 'updateproduct',
                component: Updateproduct,
            },
        ]
    }
]
const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

export default router