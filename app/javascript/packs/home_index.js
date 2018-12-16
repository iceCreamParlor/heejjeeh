import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'

Vue.use(TurbolinksAdapter)

document.addEventListener('DOMContentLoaded', () => {
  
  const app = new Vue({
    el: '#portfolio',
    data: function(){
      return {
        title: "TILTE",
        content: "CONTENT"
      }
    }
  })

})