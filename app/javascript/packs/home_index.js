import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  
  let el = document.getElementById('portfolio');
  if(el){
    const app = new Vue({
      el: '#portfolio',
      data: function(){
        return {
          title: "TILTE",
          content: "CONTENT"
        }
      }
    })
  }
})