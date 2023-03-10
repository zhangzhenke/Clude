import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../components/Login.vue'
import success from '../components/Success.vue'
import Home from '../components/Home.vue'
import Welcome from '../components/Welcome.vue'
import User from '../components/admin/User.vue'
import Admin from '../components/admin/Admin.vue'
import flowblog from '../components/blog/flowblog.vue'
import checkblog from '../components/blog/checkblog.vue'
import safeblog from '../components/blog/safeblog.vue'
import decxblog from '../components/blog/decxblog.vue'
import showblog from '../components/mydata/showblog.vue'
import cloudblog from '../components/mydata/cloudblog.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/success',
    component: success
  },
  {
    path: '/login',
    component: Login
  },
  {
    path: '/home',
    component: Home,
    redirect: '/welcome',
    children: [
      { path:'/welcome', component: Welcome},
      { path:'/user', component: User},
      { path:'/admintest', component: Admin}
    ],
  },
  {
    path: '/home',
    component: Home,
    redirect: '/welcome',
    children: [
      { path:'/welcome', component: Welcome},
      { path:'/flowblog', component: flowblog}
    ],
  },

  {
    path: '/home',
    component: Home,
    redirect: '/welcome',
    children: [
      { path:'/welcome', component: Welcome},
      { path:'/checkblog', component: checkblog}
    ],
  },


  {
    path: '/home',
    component: Home,
    redirect: '/welcome',
    children: [
      { path:'/welcome', component: Welcome},
      { path:'/safeblog', component: safeblog}
    ],
  },

  {
    path: '/home',
    component: Home,
    redirect: '/welcome',
    children: [
      { path:'/welcome', component: Welcome},
      { path:'/decxblog', component:decxblog}
    ],
  },

  {
    path: '/home',
    component: Home,
    redirect: '/welcome',
    children: [
      { path:'/welcome', component: Welcome},
      { path:'/showblog', component:showblog}
    ],
  },
  {
    path: '/home',
    component: Home,
    redirect: '/welcome',
    children: [
      { path:'/welcome', component: Welcome},
      { path:'/cloudblog', component:cloudblog}
    ],
  },
]

const router = new VueRouter({
  routes
})
// ????????????????????????
router.beforeEach((to, from, next) => {
  // to:?????????????????????
  // from:????????????????????????
  // next:???????????????????????????????????????
  //    next??????????????? next???'/URL'???????????????????????????
  if (to.path == '/login') return next();// ?????????????????????
  // ??????flag
  const flagStr = window.sessionStorage.getItem("flag");// session??????
  if (!flagStr) return next('/login');// ??????????????????
  next();
})

export default router// ????????????
