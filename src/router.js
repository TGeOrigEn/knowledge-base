import { createRouter, createWebHashHistory } from 'vue-router';
import AdminPage from './pages/AdminPage.vue'
import TablePage from './pages/TablePage.vue'
import AboutPage from './pages/AboutPage.vue'

export default createRouter({
    history: createWebHashHistory(),
    routes: [
        { path: '/admin', component: AdminPage },
        { path: '/table', component: TablePage },
        { path: '/', component: AboutPage }
    ]
});