import recipesService from '../../api/xhr'

const Recipes = {
  namespaced: true,
  state() {
    return {
      recipes: [],
    }
  },
  mutations: {
    setRecipes(state, recipes) {
      state.recipes = recipes
    }
  },
  actions: {
    fetchRecipes({ commit }) {
      recipesService.fetch('/recipes').then(data => {
        commit('setRecipes', data)
      })
    }
  }
}

export default Recipes
