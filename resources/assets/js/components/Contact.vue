<template>
  <div class="panel panel-default">
      <div class="panel-heading">Chats</div>

        <div class="panel-body">
            <table class="table">
                <tr v-for="(user,key) in contacts" :key="key">
                    <td>{{user.name}}</td>
                </tr>
            </table>
        </div>
  </div>
</template>
<script>
     export default {
        data(){
            return{
                contacts: []
            }
            
        },

        created() {
            this.fetchContacts();
            // Echo.private('chat')
            // .listen('MessageSent', (e) => {
            //     this.messages.push({
            //     message: e.message.message,
            //     user: e.user
            //     });
            // });
        },

        methods: {
            fetchContacts() {
                var vm=this
                axios.get('/api/user').then(response => {
                    vm.contacts = response.data;
                    console.log(response.data)
                });
            },
        }
    }
</script>
