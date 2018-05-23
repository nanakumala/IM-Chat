<template>
   <div class="panel panel-default">
      <div class="panel-heading">Chats</div>

        <div class="panel-body">
            <chat-messages :messages="messages"></chat-messages>
        </div>
        <div class="panel-footer">
                <div class="input-group">
                    <input id="btn-input" type="text" name="message" class="form-control input-sm" placeholder="Type your message here..." v-model="newMessage" @keyup.enter="addMessage">

                    <span class="input-group-btn">
                        <button class="btn btn-primary btn-sm" id="btn-chat" @click="addMessage">
                            Send
                        </button>
                    </span>
                    <span class="input-group-btn" style="padding-left: 5px">
                        <button class="btn btn-danger btn-sm" id="btn-chat" @click="clearMessage">
                            Delete
                        </button>
                    </span>
                </div>
        </div>
  </div>
</template>
<script>
    import ChatMessages from './ChatMessages.vue'
    import router from '../router'
    export default {
        components:{
            'chat-messages':ChatMessages
        },
        data(){
            return{
                newMessage:'',
                messages: [],
                user:{}
            }
            
        },

        created() {
            this.fetchMessages();
            Echo.private('chat')
            .listen('MessageSent', (e) => {
                console.log(e)
                this.messages.push({
                    messages: e.message.messages,
                    name: e.user.name,
                    senderName: e.userReceiver.name,
                    flag: e.message.flag
                });
            });
        },

        methods: {
            fetchMessages() {
                // console.log(this.messages)
                let chat_id = {
                    sender : localStorage.getItem(this.$route.params.id),
                    chat_id : this.$route.params.id
                }
                axios.post('/api/getMessages',chat_id).then(response => {
                    // console.log(response.data.name)
                    this.messages = response.data;
                });
            },

            addMessage() {
                let message = {
                    messages : this.newMessage,
                    chat_id: this.$route.params.id,
                    user2 : localStorage.getItem(this.$route.params.id),
                    name : localStorage.getItem('user_name'),
                    senderName : localStorage.getItem('user_name')
                }
                this.messages.push(message);
                axios.post('/api/messages', message).then(response => {
                    this.newMessage = ''
                    console.log(response.data);
                });
            },

            clearMessage() {
                let chat_id = {
                    chatid :this.$route.params.id
                };
                axios.post('/api/endchat',chat_id).then(response => {
                    console.log(response)
                    router.push('/')
                })
            }
        }
    }
</script>
