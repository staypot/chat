<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="https://cdn.socket.io/socket.io-1.3.4.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<script src="{{url('js/js.js')}}"></script>
<script src="https://cdn.jsdelivr.net/emojione/2.2.7/lib/js/emojione.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/emojione/2.2.7/assets/css/emojione.min.css"/>
<link rel="stylesheet" href="path/to/emojione.sprites.css"/>
<input type="hidden" id="id" value="{{Auth::user()->id }}">
<input type="hidden" id="token" value="{{csrf_token() }}">
<style>
    body{font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; margin: 0;}
    ul{padding-left: 0; margin: 0;}
    #onliners li{
        list-style: none;
        padding: 5px;
        background: lightgray;
        border-bottom: 1px solid gray;
        cursor: pointer;
    }
    .name{
        width: 80px;
        display: inline-block;
        height: 35px;
        line-height: 35px;
        vertical-align: top;
        color: #122b40;
    }
    .image img{width: 100%}
    .image{
        display: inline-block;
        height: 35px;
        width: 35px;
        border-radius: 50%;
        border: 1px solid #fff;
        overflow: hidden;
    }
    .status{
        position: relative;
        display: inline-block;
        height: 35px;
        width: 35px;
        vertical-align: top;
    }
    .status:before{
        margin: auto;
        border-radius: 50%;
        position: absolute;
        left: 0;
        right: 0;
        height: 10px;
        width: 10px;
        content: '';
        top: 0;
        bottom: 0;
        background: gray;
    }

    .users.active .status:before{
        background: green;
    }

    .chat-bottom{
        text-align: left;
        position: absolute;
        width: 100%;
        height: 30px;
        bottom: 0;
        box-sizing: border-box;
    }
    .chat-wan{
        cursor: pointer;
        padding: 0 5px;
        text-align: left;
        max-width: 200px;
        box-sizing: border-box;
        border: 1px solid gray;
        height: 30px;
        line-height: 29px;
        background: rgba(0,0,0,0.08);
    }
    .list-users{text-align: right}
    .list-users li {
        max-width: 200px;
        display: inline-block;
        width: 100%;
    }
    .chat-wan.open {
        cursor: default;
        position: absolute;
        width: 100%;
        height: 300px;
        bottom: 0;
    }
textarea{
    width: 100%;
    resize: none;
    height: 40px;
    padding-right: 25px;
    border-radius: 5px;
}
    .actions button{
        position: absolute;
        top: 0;
        bottom: 0;
        margin: auto;
        height: 20px;
        right: 8px;
        width: 20px;
    }
    .actions {
        position: absolute;
        bottom: 10px;
    }
    .messages{
        overflow: hidden;
        position: absolute;
        height: 100%;
        top: 0;
        bottom: 0;
    }
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family:"Arial"
    }

    body {
        background-color: #fff;
    }

    ul.ChatLog {
        list-style: none;
    }

    .ChatLog {
        /* max-width: 20em; */
        margin: 0 auto;
        height:300px;
        overflow:auto;
    }
    .ChatLog .ChatLog__entry {
        position: relative;
        margin: .5em;
    }

    .ChatLog__entry {
        display: flex;
        flex-direction: row;
        align-items: flex-end;
        max-width: 100%;
    }

    .ChatLog__entry.ChatLog__entry_mine {
        flex-direction: row-reverse;
    }

    .ChatLog__avatar {
        flex-shrink: 0;
        flex-grow: 0;
        z-index: 1;
        height: 50px;
        width: 50px;
        border-radius: 25px;

    }

    .ChatLog__entry.ChatLog__entry_mine
    .ChatLog__avatar {
        display: none;
    }

    .ChatLog__entry .ChatLog__message {
        position: relative;
        margin: 0 12px;
    }

    .ChatLog__entry .ChatLog__message::before {
        position: absolute;
        right: auto;
        bottom: .6em;
        left: -12px;
        height: 0;
        content: '';
        border: 6px solid transparent;
        border-right-color: #ddd;
        z-index: 2;
    }

    .ChatLog__entry.ChatLog__entry_mine .ChatLog__message::before {
        right: -12px;
        bottom: .6em;
        left: auto;
        border: 6px solid transparent;
        border-left-color: #08f;
    }

    .ChatLog__message {
        background-color: #ddd;
        padding: .5em;
        border-radius: 4px;
        font-weight: lighter;
        max-width: 70%;
    }

    .ChatLog__entry.ChatLog__entry_mine .ChatLog__message {
        border-top: 1px solid #07f;
        border-bottom: 1px solid #07f;
        background-color: #08f;
        color: #fff;
    }

    .ChatLog__message .ChatLog__timestamp {
        display: none;
    }
    .titlename{

        display: block;
        position: absolute;
        top: -5px;
        left: 59px;
        font-weight: bold;
        font-size: 12px;
        font-style: italic;
    }

    #onliners{
        max-width: 362px;
        max-height: 366px;
        overflow: auto;
        background: lightgray;
        height: 100%;
    }
    #chatbot{
        float: left;
        max-width: 1000px;
        border: 1px solid gray;
        padding: 0 20px 30px;
    }
    #name{
        font-size: 22px;
        padding-left: 30px;
        margin-bottom: 17px;
    }
</style>
        <h1 id="name" data-id="{{ Auth::user()->id }}">Name : <strong>{{ Auth::user()->name }}</strong></h1>


<div id="chatbot">
    <div class="arrow"></div>
    <ul class="ChatLog" id="chatbot-message">
        <li class="ChatLog__entry">
            <img class="ChatLog__avatar" src="//placekitten.com/g/50/50" />
            <p class="ChatLog__message">
                Hello!
                <time class="ChatLog__timestamp">6 minutes ago</time>
            </p>
        </li>
    </ul>

    <form action="" onsubmit="return false;">
        <div class="input-group">
            <input id="chatbot-input" type="text" class="form-control" placeholder="message..." autocomplete="off">
            <div class="input-group-btn">
                <button id="chatbot-submit" class="btn btn-default" type="submit">Send</button>
            </div>
        </div>
    </form>
</div>
        <div class="onlinesxad2">
            <ul id="onliners">
                @foreach (App\User::all() as $user)
                    <li class="users plc-{{$user->id}}u">
                        <div class="username">
                            <div class="image">
                                <img src="data:image/png;base64,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">
                            </div>
                            <div class="name">{{ $user->name }}</div>
                            <div class="status"></div>
                        </div>
                    </li>
                @endforeach
            </ul>
        </div>


<ul class="emojies list-inline">

</ul>