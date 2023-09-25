<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/bootstrap5.jsp"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<style type="text/css">
.container {
	margin: 10px;
}

#backButton {
	margin: auto;
}

.emoticon {
	text-decoration: none;
}
</style>
<style type="text/css">
/* 댓글들을 위한 스타일 지정 */
* {
	padding: 0;
	margin: 0;
	color: #333;

	font-family: 'Jua', sans-serif;
}

ul {
	list-style: none;
}

#container {
	padding: 30px 20px;
}

#insertComment {
	
  border: 2px solid #000; /* 테두리 색상을 원하는 색상으로 변경 */
    border-radius: 15px; /* 테두리 모서리를 둥글게 만듭니다. */
    background-color: #F5F5F5; /* 배경색을 원하는 색상으로 변경 */
   
     margin-left: 200px;
	margin-right: 200px;
	font-family: 'Jua', sans-serif;
}

#insertComment label {
	display: inline-block;
	width: 80px;
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 10px;
}

#insertComment input[type='text'], #insertComment textarea {
	border: 1px solid #ccc;
	vertical-align: middle;
	padding: 3px 10px;
	font-size: 12px;
  	margin-right: 200px;
	font-family: 'Jua', sans-serif;
}

#insertComment textarea {
	width: 450px;
	height: 120px;
	font-family: 'Jua', sans-serif;
}

.commentItem {
	font-size: 13px;
	color: #333;
	padding: 15px;
	border-bottom: 1px dotted #ccc;
	line-height: 150%;
}

.commentItem .id {
	color: #555;
	line-height: 200%;
}

.commentItem .id input {
	vertical-align: middle;
	
}

.commentItem .id .name {
	color: #222;
	font-weight: bold;
	font-size: 14px;
}

.form-group {
	margin-bottom: 3px;
}

.form-control {
	height: 25px;
}

.btn-primary {
	opacity: 0.8;
}

<
style type ="text /css "> <style type ="text /css "> /* 게시판 컨테이너 스타일 */
	.container {
	margin: 10px;
	
}

/* 돌아가기 버튼 스타일 */
#backButton {
	margin: 15px;

	font-family: 'Jua', sans-serif;

}

/* 이모티콘 스타일 */
.emoticon {
	text-decoration: none;
}

/* 게시판 테이블 스타일 */
.table {
	margin-top: 20px;
	width: 100%;
}

.table td, .table th {
	padding: 8px;
}

.table th {
	background-color: #f2f2f2;
}

/* 댓글 영역 스타일 */
#comment_list {
	padding: 20px 0;
	border-top: 1px solid #ccc;
}

.commentItem {
	font-size: 13px;
	color: #333;
	padding: 15px;
	border-bottom: 1px dotted #ccc;
	line-height: 150%;
}

.commentItem .id {
	color: #555;
	line-height: 200%;
}

.commentItem .id input {
	vertical-align: middle;
}

.commentItem .id .name {
	color: #222;
	font-weight: bold;
	font-size: 14px;
}

.form-group {
	margin-bottom: 3px;
}

.form-control {
	height: 25px;
}

.btn-primary {
	opacity: 0.8;
}

.td-length {
	width: 50px;
	text-align: center;
}
/* 게시글 섹션에 박스 테두리 스타일 적용 */
#postSection {
    border: 2px solid #000; /* 테두리 색상을 원하는 색상으로 변경 */
    border-radius: 10px; /* 테두리 모서리를 둥글게 만듭니다. */
    background-color: #FFFFFF; /* 배경색을 원하는 색상으로 변경 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
    padding: 3px; /* 내용과 테두리 사이 여백 추가 */
     margin-left: 200px;
	margin-right: 200px;
	font-family: 'Jua', sans-serif;
}
#tablSection{
   border: 2px solid #000; /* 테두리 색상을 원하는 색상으로 변경 */
    border-radius: 15px; /* 테두리 모서리를 둥글게 만듭니다. */
    background-color: #F5F5F5; /* 배경색을 원하는 색상으로 변경 */
    margin-bottom: 15px;
}

</style>

<script type="text/javascript">
		/* 삭제버튼 클릭 */
		/* on() 메소드는 선택된 요소에 이벤트 핸들러 함수를 연결시켜 주는 기능을 합니다. */
		/* cnum이라는 속성을 개발자가 지정해 두었습니다. */
		$(document).on('click', '.delete_btn', function(){
			if(confirm('선택하신 항목을 삭제하시겠습니까?')){
				$.ajax({
					url:'<%=notWithFormTag%>cmDelete', 
					data:'cnum=' + $(this).attr('cnum') ,
					type:'get', 
					dataType:'text',
					success:function(result, status){
						console.log(result);	
						console.log(status);
						getListComment() ; 
					}
				});
			}
		});
		
		function getListComment(){
			$('#comment_list').empty();			
			/* $.ajax() 함수를 이용하여 데이터 보여 주기 */
			$.ajax({
				url:'<%=notWithFormTag%>cmList', 
				data:'no=' + '${requestScope.bean.no}',
				type:'get', 
				dataType:'json',
				success:function(result, status){
					/* console.log('result는 넘어온 데이터 결과 값') ; */
					/* console.log(result) ; */
					
					$.each(result, function(idx){ /* idx는 색인 번호 */
						var cnum = result[idx].cnum ;
						var id = result[idx].id ;
						var content = result[idx].content ;
						var regdate = result[idx].regdate ;
						addNewItem(cnum, id, content, regdate);
					})
				},
				error:function(result, status){
					console.log(result) ;
					console.log(status) ;
				}
			});
		}
		
		function addNewItem(cnum, id, content, regdate){
			/* 댓글 1개를 추가해주는 함수입니다. */
			var litag = $('<li>') ; /* 댓글의 외곽 li 태그  */
			litag.addClass('commentItem') ;
			
			var ptag = $('<p>') ; /* 작성자 정보가 들어갈 태그  */
			ptag.addClass('id') ;

			var spantag = $('<span>') ; /* 작성자 이름이 들어갈 태그  */
			spantag.addClass('name') ;
			spantag.html(id + "님") ;
			
			var spandate = $('<span>') ;  /* 작성 일자가 들어갈 태그  */
			spandate.html("&nbsp;&nbsp;/&nbsp;&nbsp;" + regdate + '&nbsp;&nbsp;&nbsp;') ;
			
			/* 로그인한 사람이 작성한 댓글이면 삭제 가능 */
			if(id == '${sessionScope.loginfo.id}'){ 
				var inputtag = $('<input>') ; /* 삭제 버튼 */
				var attrlist = {'id':id, 'type':'button', 'value':'삭제', 'class':'btn btn-xs btn-outline-primary', 'cnum':cnum};
				inputtag.attr(attrlist);
				inputtag.addClass('delete_btn');
			}else{
				var inputtag = '' ;
			}
			
			var content_p = $('<p>') ; /* 작성한 댓글 내용 */
			content_p.html(content) ; 
			
			/* 조립하기(compose up) */
			ptag.append(spantag).append(spandate).append(inputtag);
			litag.append(ptag).append(content_p) ; 
			
			$('#comment_list').append(litag) ;
		}
	
		 
		
		$(document).ready(function(){
			getListComment();
			
			/* 사용자가 댓글을 입력하고, 전송 버튼을 눌렀습니다. */
			$('#comment_form').submit(function(){				
				/* 댓글 입력 없이 전송 버튼을 누른 경우 */
				if(!$('#content').val()){
					alert('댓글을 입력해 주셔야 합니다.');
					$('#content').focus() ;
					return false ;
				}
				
				/* post 방식으로 데이터를 전송합니다. */
				var URL = '<%=notWithFormTag%>
	cmInsert';
			var parameters = $('#comment_form').serialize();
			/* alert(parameters); */
			$.post(URL, parameters, function(data) {
				getListComment(); /* 목록 갱신하기 */
				$('#content').val('');
				return true;

			}).fail(function() {
				alert('댓글 작성에 실패하였습니다.');
				return false;
			});
			return false;
		});
	});
</script>
</head>
<body>
	<div class="container" id="postSection">
		<h2 align="center" style="margin-bottom: 40px;">자유 게시판</h2>
		<br>
		<table class="table" id="tablSection">
			<thead></thead>
			<tbody>
				<tr>
					<td align="center" class="td-length">글제목 :</td>
					<td>${requestScope.bean.subject}</td>
				</tr>
				<tr>
					<td align="center" class="td-length">번호 :</td>
					<td>${requestScope.bean.no}</td>
				</tr>
				<tr>
					<td align="center" class="td-length">작성자 :</td>
					<td>${requestScope.bean.id}</td>
				</tr>

				<tr>
					<td align="center" style="text-align: center; width: 80px">카테고리
						:</td>
					<td>${requestScope.bean.category}</td>
				</tr>
				<tr>
					<td align="center" class="td-length">글내용 :</td>
					<td><textarea rows="10" cols="50" readonly
							style="width: 100%; border: none;  background-color: #F5F5F5;">${requestScope.bean.content}</textarea>
					</td>
				</tr>
				<tr>
					<td align="center" class="td-length">조회수 :</td>
					<td>${requestScope.bean.readhit}</td>
				</tr>
				<tr>

				</tr>
			</tbody>
		</table>
		<div id="backButton">
			<button type="button" class="btn btn-primary"
				onclick="history.back();">돌아 가기</button>
			&nbsp;&nbsp;&nbsp; <a class="emoticon"
				href="<%=notWithFormTag%>boEmoticon&mode=likes&no=${bean.no}"> <img
				src="<%=appName%>/assets/img/좋아요.png" width="30px" height="30px"
				alt="좋아요"> ${bean.likes}
			</a> &nbsp;&nbsp; <a class="emoticon"
				href="<%=notWithFormTag%>boEmoticon&mode=hates&no=${bean.no}"> <img
				src="<%=appName%>/assets/img/싫어요.png" width="30px" height="30px"
				alt="싫어요"> ${bean.hates}
			</a>
		</div>
	</div>

	<%-- 댓글 영역(Comment Zone) --%>
	<ul id="comment_list">
		<%-- 여기에 동적으로 댓글들을 추가합니다. --%>
	</ul>
	
	<div id="insertComment">
		<form id="comment_form" method="post" role="form"
			class="form-horizontal">
			<table class="table">
				<thead>
				</thead>
				<tbody>
					<tr>
						<td><label for="content"
							class="col-xs-3 col-lg-3 control-label">작성자</label></td>
						<td><input type="hidden" name="no" value="${bean.no}" /> <input
							type="text" name="fakeid" id="fakeid" class="form-control"
							size="10" disabled="disabled"
							value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님">
							<input type="hidden" name="id" id="id"
							value="${sessionScope.loginfo.id}"></td>
					</tr>
					<tr>
						<td><label for="content"
							class="col-xs-3 col-lg-3 control-label">댓글 내용</label></td>
						<td><textarea id="content" name="content" rows="3" cols="50"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" class="btn btn-info">글 쓰기</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	</div>
</body>
</html>