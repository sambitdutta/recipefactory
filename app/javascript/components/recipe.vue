<template>
  <div class="row">
    <div class="col">
      <div class="card mb-4 shadow-sm" v-if="recipe">
        <div class="card-header">
          <h5>{{ recipe.title }}</h5>
        </div>
        <img class="card-img-top" :src="recipe.image.file.url" :alt="recipe.image.file.fileName">
        <div class="card-body">
          <p class="card-text">{{ recipe.description }}</p>
          <div class="d-flex justify-content-between align-items-center">
            <small class="text-muted"><strong v-if="recipe.chef">Chef:</strong> {{ recipe.chef }}</small>
            <small class="text-muted"><strong v-if="recipe.tags.length">Tags:</strong> {{ recipe.tags.join(', ') }}</small>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      id: this.$route.params.id,
    }
  },
  computed: {
    recipe() {
      return this.$store.state.recipes.recipes.find(recipe => recipe.id === this.id)
    }
  }
}
</script>

<style scoped>
</style>
