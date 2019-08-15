import Vue from 'vue';
import Router from 'vue-router';
import Home from '../components/home.vue';
import Recipe from '../components/recipe.vue';

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/recipes/:id',
      name: 'recipe',
      component: Recipe,
    }
  ]
})
