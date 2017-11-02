<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
        <style>
        textarea {
        width : 200px;
        height : 500px;
        }
        </style>
    </head>
    <body>
        <h3>웹 소켓 페이지</h3>
        <!-- 액션이 없다. -->
        <form>
            대화명 : <input id="nick" type="text"/>
            <br/>
            메시지창 : <textarea id="monitor"></textarea>
            <br/>
            메시지 : <input id="msg" type="text"/>
            <input type="button" value="전송" onClick="sendMsg()"/>
            <input type="button" value="나가기" onClick="disConn()"/>
        </form>
    </body>
    <script>
        //접속 URL
        var url = "ws://localhost/websocket2"         
        var webSocket = new WebSocket(url);//웹 소켓 객체 생성    
        var content = document.getElementById("monitor");
        //웹소켓 연결됐을 때
        webSocket.onopen = function(e){
            console.log(e);            
            content.value += "웹소켓 연결...\n";
        }        
        //웹소켓 끊겼을 때
        webSocket.onclose = function(e){
            console.log(e);
            content.value += "웹소켓 끊김...\n";
        }        
        //메시지 수신
        webSocket.onmessage = function(e){
            console.log(e);
            content.value += e.data+"\n";
        }    
        //서버에 메시지 전송
        function sendMsg(){
            var obj = {};
            obj.nick = $("#nick").val();
            obj.msg = $("#msg").val();    
            content.value +="나> "+obj.msg+"\n";
            webSocket.send(JSON.stringify(obj));
            $("#msg").val("");
        }        
        //웹소켓 종료
        function disConn(){
            webSocket.close();
        }
    </script>
</html>

