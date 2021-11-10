<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#icon {
position: fixed;


}

</style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<h1>Chating</h1>


<div align="center">
	<table border="1">
	<col width="200px"><col width="500px">
	<tr>
		<th>대화명</th>
		<td style="text-align: left;">
			<input type="text" id="name">
			<input type="button" id="enterBtn" value="입장" onclick="connect()">
			<input type="button" id="exitBtn" value="나가기" onclick="disconnect()">
		</td>
	</tr>
	
	<tr>
		<th>아이디</th>
		<td style="text-align: left;">
			<input type="text" id="id">
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<textarea rows="10" cols="70" id="MessageArea"></textarea>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="text" id="message" size="50">
			<input type="button" id="sendBtn" value="전송" onclick="send()">
		</td>
	</tr>
	
	</table>
</div>

<script type="text/javascript">

	let wsocket;

	function connect(){
		
		if(wsocket != undefined && wsocket.readyState != WebSocket.CLOSED){
			alert("이미 입장하셨습니다.");
			return;
		}
		
		wsocket = new WebSocket("ws://192.168.0.19:8090/flenda/echo.do");
		
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	
	function onOpen(evt){

		appendMessage("서버에 연결 되었습니다");
	}
	function onClose(evt){
		appendMessage("서버에 연결이 끊겼습니다");
	}
	
	function send(){
		
		let id = $("#name").val();
		let msg = $("#message").val();
		
		let check = {
				id : id,
				content : msg,
				stat : 1
					}
		
		$.ajax({
			url:"chatingAf.do",
			type: "post",
			data:check,
			success:function(data){
			},
			error:function(){
				alert("error");
			}
		});
		
		
		wsocket.send(id + ":" + msg);  // msg: aaa:안녕   <-이런 형태 
		$("#message").val("");
	}
	
	function onMessage(evt){
		
		let data = evt.data;
		appendMessage(data);
	}
	
	function disconnect() {
		wsocket.close();
		location.href = "chating.do";    //통신을 끊었을땐 다시 처음으로
	}
	
	function appendMessage(d){
		$("#MessageArea").append(d + "\n");
		
		const top = $("#MessageArea").prop("scrollHeight");
		$("#MessageArea").scrollTop(top);
	}

</script>


</body>
</html>