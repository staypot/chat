
var socket = io.connect('http://192.168.1.102:8890');

$(document).ready(function(){

 var uid =   $("#name").data('id');
 var nme =   $("#name").text();
 var emoji = [
    ':grinning:',':grin:' ,':joy:', ':rofl:', ':sweat_smile:', ':middle_finger:', ':thumbsdown:', ':heart_eyes:', ':sunglasses:',
      ':rage:',  ':cry:', ':sob:', ':cry:', ':angry:', ':alien:', ':poop:', ':muscle:',
 ];


    $.each(emoji, function(key,val){
        $(".emojies").append('<li data-code="'+val+'">'+emojione.shortnameToImage(val)+'</li>')
    });

    $('body').delegate('.emojies li','click',function(){
        $("#chatbot-input").val( $("#chatbot-input").val() + $(this).data('code') );

    });

    $("#chatbot-submit").on('click',function(){

        var msg = $("#chatbot-input").val();
        var d = [uid,nme,msg];
        socket.emit('chat message', d);
        $("#chatbot-input").val('');
        var ht = $('.ChatLog__entry:last-child').offset().top;

        $("#chatbot-message").append(botMessage);
        $('#chatbot-message').animate({
                scrollTop:ht},
            'slow');

    });


    socket.on('chat message', function(msg){
        var botMessage = '';
        if (msg[0] != uid){
             botMessage =
                '<li class="ChatLog__entry">'+
                    '<img class="ChatLog__avatar" src="//placekitten.com/g/50/50" />'+
                    '<div class="titlename">'+msg[1]+'</div>'+
                    '<p class="ChatLog__message">'+emojione.shortnameToImage(msg[2])+
                    '<time class="ChatLog__timestamp">5 minutes ago</time>'+
                    '</p>'+
                    '</li>';
        }else{
           botMessage =
                '<li class="ChatLog__entry ChatLog__entry_mine">'+
                    '<img class="ChatLog__avatar" src="//placekitten.com/56/56" />'+
                    '<p class="ChatLog__message">'+
                    emojione.shortnameToImage(msg[2]) +
                    '<time class="ChatLog__timestamp">4 minutes ago</time>'+
                    '</p>'+
                    '</li>';
        }
        var ht = $('.ChatLog__entry:last-child').offset().top;

        $("#chatbot-message").append(botMessage);
        $('#chatbot-message').animate({
                scrollTop:ht},
            'slow');
    });


    socket.emit('online',$("#id").val());

    socket.on('online', function (data) {
        $('.users').removeClass('active');
        $.each( JSON.parse(data),function(key, val){
           $('.'+val).addClass('active');
        });
    });


});
