
// 모듈을 변수에 저장합니다.
var http = require('http');
var fs = require('fs');
var socketio = require('socket.io');
var cors = require('cors')
const hostname = '127.0.0.1';


var jsdom = require("jsdom");
const { JSDOM } = jsdom;
const { window } = new JSDOM();
const { document } = (new JSDOM('')).window;
global.document = document;

var $ = jQuery = require('jquery')(window);

// 웹 서버를 만듭니다.
var server = http.createServer(function (request, response) {
    // HTMLPage.html 파일을 읽습니다.
    fs.readFile('HTMLPage.html', function (error, data) {
        response.writeHead(200, { 'Content-Type': 'text/html' });
        response.end(data);
    });
}).listen(52273,hostname,() => {
	
	console.log('Server Running at http://127.0.0.1:52273');
});



// 소켓 서버를 만듭니다.
var io = socketio.listen(server);


const roomlist=new Map();	//방장 정보 저장
const roomtest=new Set();   // 중복되는값이 있는지 확인

io.sockets.on('connection', function (socket) {
	
	var user=new Map(); 	// 자신의 유저이름을 담을 정보
	var userlist=new Set(); // 현재 접속한사람들의 유저 목록
	var room=null; 			// 방번호
	// join 이벤트
    socket.on('join', function(data){
        socket.join(data.room);
        room=data.room;
        user.set("'"+socket.id+"'",data.name);
    });
	// message 이벤트
    socket.on('message', function (data) {
    	user.set("'"+socket.id+"'",data.name);
    	
    	  if(roomlist.get("'"+socket.id+"'")==null){
          	if(roomtest.has("'"+data.room+"'")==false){
          		roomtest.add("'"+data.room+"'");
          		roomlist.set("'"+socket.id+"'",data.room);
          	}
    	  }
    	if(data.status==1){    		
    		io.sockets.in(data.room).emit('message', {
    			status:data.status,
                name: data.name,
                message: data.message,
                room:data.room,
                userlist:roomlist.get("'"+socket.id+"'")
            });	
    	}
    	else{
        // 클라이언트의 message 이벤트를 발생시킵니다.     
    	 io.sockets.in(data.room).emit('message', {
 			status:data.status,
            name: data.name,
            message: data.message,
            room:data.room,
            userlist:roomlist.get("'"+socket.id+"'")
        });
    	}
    });
//    userlist,room
    socket.on('userlist',function(data){
    	io.sockets.in(data.room).emit('userstatus',data.userlist);
    });
    
  
    
     socket.on('disconnect', () => {
    	 if(roomlist.get("'"+socket.id+"'")!=null){
    		 // ajax 사용    		 
    		 io.sockets.in(roomlist.get("'"+socket.id+"'")).emit('message',{
    			 message:"방장님이 나가셨습니다",
    			 status:3
    			
    		 });
    		 $.ajax({
				 url : "http:127.0.0.1:10000/chat/test",
				 type : "POST",
				 data : JSON.stringify({"cno":roomlist.get("'"+socket.id+"'")}),
				 dataType: "json",
				 contentType:'application/json; charset=utf-8',
				 success : function(data){
					 
				 }
			 });
    		 
    		 
    		 
    		 $.ajax({
					url : "http:127.0.0.1:10000/chat/deletechat",
					type : "POST",
					data : {"cno":roomlist.get("'"+socket.id+"'")},
					dataType: "json",
					success : function(data){
						roomlist.remove("'"+roomlist.get("'"+socket.id+"'")+"'");
						roomtest.delete("'"+roomlist.get("'"+socket.id+"'")+"'");
						
	
					}
			
    		 });
			
    	 }
    	 io.sockets.in(room).emit('message',{
    		 name:user.get("'"+socket.id+"'"),
			 message:"님이 나가셨습니다",
			 status:4
		 });
    	 
    	 socket.disconnect();
     });
     
     
   
});
