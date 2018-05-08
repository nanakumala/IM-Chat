<template>
   <div class="panel panel-default">
      <div class="panel-heading">Chats</div>

        <div class="panel-body">
            <chat-messages :messages="messages"></chat-messages>
        </div>
        <div class="panel-footer">
            <chat-form
                v-on:messagesent="addMessage"
                :user="user"
            ></chat-form>
        </div>
  </div>
</template>
<script>
    import ChatForm from './ChatForm.vue'
    import ChatMessages from './ChatMessages.vue'
    export default {
        components:{
            'chat-form':ChatForm,
            'chat-messages':ChatMessages
        },
        data(){
            return{
                messages: [
                    {
                        message:'hy nana',
                        user:{
                            name:'Urip'
                        }
                    }
                ],
                user:{}
            }
            
        },

        created() {
            // this.fetchMessages();
            // Echo.private('chat')
            // .listen('MessageSent', (e) => {
            //     this.messages.push({
            //     message: e.message.message,
            //     user: e.user
            //     });
            // });
        },

        methods: {
            fetchMessages() {
                axios.get('/messages').then(response => {
                    this.messages = response.data;
                });
            },

            addMessage(message) {
                this.messages.push(message);

                axios.post('/messages', message).then(response => {
                console.log(response.data);
                });
            }
        }
    }
</script>
