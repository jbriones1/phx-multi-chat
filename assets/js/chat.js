const Chat = {
  init(socket) {
    const path = window.location.pathname.split('/');
    const room = path[path.length -1];
    const channel = socket.channel('chat:' + room, {});
    channel.join();

    console.log(socket);

    this.listenForChats(channel);
  },

  listenForChats(channel) {
    const submitForm = () => {
    const userName = document.getElementById('user-name').value;
    const message = document.getElementById('user-msg').value;

    channel.push('shout', {name: userName, body: message});
    document.getElementById('user-msg').value = '';
    }

    document.getElementById('chat-form').addEventListener('submit', e => {
      e.preventDefault();
      submitForm();
    });

    channel.on('shout', payload => {
      const chatBox = document.getElementById('chat-box');
      const msgBlock = document.createElement('p');
      msgBlock.classList.add('chat-text');

      msgBlock.innerHTML = `<b>${payload.name}</b>: ${payload.body}`;
      chatBox.appendChild(msgBlock);
    });

    channel.on('joined', payload => {
      console.log(payload.message);
    });
  }
}

export default Chat;