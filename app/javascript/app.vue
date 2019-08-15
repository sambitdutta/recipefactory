<template>
  <div id="app">
    <Header></Header>
    <main role="main">
      <section class="jumbotron text-center">
        <div class="container">
          <h1 class="jumbotron-heading">RecipeFactory</h1>
          <p class="lead text-muted">Cooking is one of the strongest ceremonies for life. When recipes are put together, the kitchen is a chemical laboratory involving air, fire, water and the earth. This is what gives value to humans and elevates their spiritual qualities. If you take a frozen box and stick it in the microwave, you become connected to the factory.</p>
        </div>
      </section>

      <div class="album py-5 bg-light">
        <div class="container">
          <router-view/>
        </div>
      </div>
    </main>
    <Footer></Footer>
  </div>
</template>

<script>
import Header from './components/header.vue';
import Footer from './components/footer.vue';
import { mapActions } from 'vuex';

export default {
  data: function () {
    return {}
  },
  components: { Footer, Header },
  methods: {
    ...mapActions('recipes', [
      'fetchRecipes'
    ])
  },
  mounted() {
    this.fetchRecipes()
  }
}
</script>

<style scoped>
</style>
