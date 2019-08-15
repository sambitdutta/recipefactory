<template>
  <div class="row">
    <div class="col-md-4" v-for="recipe in recipes">
      <div class="card mb-4 shadow-sm">
        <img class="card-img-top" :src="recipe.image.file.url" :alt="recipe.image.file.fileName">
        <div class="card-body">
          <p class="card-text">{{ recipe.title }}</p>
          <div class="d-flex justify-content-center">
            <button type="button" class="btn btn-sm btn-outline-secondary" @click="toDetailPage(recipe.id)">View</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex';

export default {
  computed: {
    ...mapState('recipes', {
      recipes: state => state.recipes,
    })
  },
  methods: {
    toDetailPage(recipeId) {
      // console.log(recipeId)
      this.$router.push({ name: 'recipe', params: { id: recipeId } })
    }
  }
}
</script>

<style scoped>
</style>
