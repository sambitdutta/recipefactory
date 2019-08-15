import axios from 'axios';

export default {
  fetch(url) {
    return axios.get(url, { headers: { Accept: 'application/json' } }).then(response => {
      return response.data
    }).catch(error => {
      console.log(error)
    })
  }
}
