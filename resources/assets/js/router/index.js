import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

import Chat from '../components/Chat'
import Contact from '../components/Contact'

const router= new Router({
    mode: 'history',
    routes: [
        {
            path: '/chat',
            name: 'Chat',
            component: Chat
        },
        {
            path: '/contact',
            name: 'Contact',
            component: Contact
        }
    ]
})

export default router