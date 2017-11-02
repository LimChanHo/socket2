<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
</head>
<style>
textarea {
	width: 200px;
	height: 600px;
}
</style>
<body>
	<h3>웹 소켓 페이지</h3>
	<!-- 액션이 없다. -->
	<form>
		대화명 : <input id="nick" type="text" /> <br /> 메시지창 :
		<textarea id="monitor"></textarea>
		<br /> 메시지 : <input id="msg" type="text" /> <input type="button"
			value="전송" onClick="sendMsg()" /> <input type="button" value="나가기"
			onClick="disConn()" /> <input type="button" value="confirm"
			onClick="disConn()" /> <input type="button" value="test"
			onClick="disConn()" />
	</form>
</body>
<script>
	//접속 URL
	var url = "ws://${pageContext.request.contextPath}/localhost/websocket"
	var webSocket = new WebSocket(url);//웹 소켓 객체 생성    
	var content = document.getElementById("monitor");
	//웹소켓 연결됐을 때
	webSocket.onopen = function(e) {
		console.log(e);
		content.value += "웹소켓 연결...\n";
	}
	//웹소켓 끊겼을 때
	webSocket.onclose = function(e) {
		console.log(e);
		content.value += "웹소켓 끊김...\n";
	}
	//메시지 수신
	webSocket.onmessage = function(e) {
		if (confirm(e.data+"님과 정말 연결하시겠습니까???") == true) { //확인
			location.href = "naver.com";
		}
	}
	//서버에 메시지 전송
	function sendMsg() {
		var obj = {};
		obj.nick = $("#nick").val();
		obj.msg = $("#msg").val();
		content.value += "나> " + obj.msg + "\n";
		webSocket.send(JSON.stringify(obj));
		$("#msg").val("");
	}
	//웹소켓 종료
	function disConn() {
		webSocket.close();
	}
</script>
<script>
	function button_event() {
		if (confirm("정말 삭제하시겠습니까??") == true) { //확인
			document.form.submit();
		} else { //취소
			return;
		}
	}
//-->
</script>


</html>
