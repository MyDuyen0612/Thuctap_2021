import Vue from 'vue'
import VueRouter from 'vue-router'

//User
import User from '../views/Home.vue'
import Login from '../user/Login.vue'
import Home from '../user/Index.vue'
import Register from '../user/Register.vue'
import Productdetail from '../user/Productdetail.vue'
import CategoryUser from '../user/Category.vue'
import Cart from '../user/Cart.vue'
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
const ProductDetial = ()=>
    import ('../admin/product/ProductDetail.vue')
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
                path: '/category/:idCategory',
                name: 'CategoryUser',
                component: CategoryUser
                    
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
            },
            {
                path: 'cart',
                name: "cart",
                component: Cart
            },
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
                name: 'Categoryadmin',
                component: Category,
            },
            {
                path: 'detail/:url',
                name: 'productdetail',
                component: ProductDetial,
            },
            {
                path: 'update/:url',
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