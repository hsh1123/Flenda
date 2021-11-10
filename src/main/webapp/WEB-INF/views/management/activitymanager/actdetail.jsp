<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
<!-- datepicker 사용 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
td{
	text-align: left;
	padding: 5px;
}
</style>
</head>
<body>
<div style="margin-top: 50px;">
	<div align="left" style="float: left;">
		<strong style="font-size: 25px">판매정보</strong>
	</div>
	<div align="right" style="margin-right: 220px; ">
		<button class="btn btn-outline-primary" onclick="location.href='actupdate.do?seq=${act.sellSeq}'">수정</button>
		<button class="btn btn-outline-danger" onclick="deleteAct()">삭제</button>
	</div>
	<hr width="80%">
	<table style="margin: 20px; margin-bottom: 70px;">
		<col width="400"><col width="400">
		<tr>
			<td>
				사업자명:홍길동<!-- 회원정보 연결되면 바꿀것 -->
			</td>
			<td>
				사업자등록증: ${act.businessNumber }
			</td>
		</tr>
		<tr>
			<td>
				카테고리: ${act.category}
			</td>
			<td>
				주소: ${act.address }
			</td>
		</tr>
		<tr>
			<td>
				등록일: ${act.regidate}
			</td>
			<td>
				판매자아이디: ${act.hostId }
			</td>
		</tr>
		<tr>
			<td>
				판매제목: ${act.title}
			</td>
			<td>
				연락처: ${act.businessPhoneNum }
			</td>
		</tr>
		<tr>
			<td colspan="2">
				판매자설명: ${act.hostintro }
				<a href="#">(자세히 보기)</a>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				상품설명: <a href="#">(자세히 보기)</a>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				이용안내: <a href="#">(자세히 보기)</a>
			</td>
		</tr>
	</table>
	<div align="left" style="float: left;">
		<strong style="font-size: 25px">옵션정보</strong>
	</div>
	<div align="right" style="margin-right: 220px; ">
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">옵션등록</button>
	</div>
	<hr width="80%">
</div>

<table class="table table-hover" style="width: 80%;" id="option_table">
</table>

<!-- 옵션등록 모달 -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">옵션등록</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table>
        	<tr>
        		<th>옵션설명</th>
        		<td>
        			<textarea rows="10" cols="10" id="content" class="form-control"></textarea>
        		</td>
        	</tr>
        	<tr>
        		<th>가격(원)</th>
        		<td>
        			<input type="text" id="price" class="form-control w-50" placeholder="숫자입력">
        		</td>
        	</tr>
        	<tr>
        		<th>하루최대판매인원(명)</th>
        		<td>
        			<input type="text" id="maxPpl" class="form-control w-50" placeholder="숫자입력">
        		</td>
        	</tr>
        	<tr>
        		<th>유효기간</th>
        		<td>
        			<input type="text" id="datepicker1" name="startdate" style="padding:auto; width: 100px; height: 35px">&nbsp;&nbsp; ~ &nbsp;&nbsp;
					 <input type="text" id="datepicker2" name="enddate" style="padding:auto; width: 100px; height: 35px">
        		</td>
        	</tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">이전</button>
        <button type="button" class="btn btn-primary" onclick="addOption()">등록</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$('#option_table').empty();
	let sellseq = '${act.sellSeq}';
	$.ajax({
		url:"getOptionList.do",
		type:"post",
		data:{ seq:sellseq },
		success:function(olist){
			/* 게시판 셋팅 */
			let setting = '<colgroup><col style="width: 50px"><col style="width: 80px"><col style="width: 150px;"><col style="width: 150px;">' +
							'<col style="width: 90px"><col style="width: 80px"><col style="width: 70px"></colgroup>' +
						  '<tr><th>번호</th><th>옵션코드</th><th>옵션설명</th><th>유효기간</th><th>가격(원)</th><th>최대판매개수(일)</th><th>관리</th></tr>';
			
			$('#option_table').append(setting);	
			
			if(olist == null && olist[0].sellSeq == ""){
				let add = '<tr><td colspan="9" style="text-align: center;">등록된 판매옵션이 없습니다</td></tr>'
				$('#option_table').append(add);	
			}
			/* 게시판리스트 추가 */
			$.each(olist, function(index,dto){
				let str = '<tr>' +
							'<td style="text-align: center;">' + (index+1) + '</td>' +
							'<td style="text-align: center;">' + dto.optionSeq + '</td>' +
							'<td style="text-align: center;">' + dto.opcontent +'</td>' +
							'<td style="text-align: center;">' + dto.startDate + ' ~ ' + dto.endDate + '</td>' +
							'<td style="text-align: center;">' + dto.opPrice + '</td>'+
							'<td style="text-align: center;">' + dto.maxPeople + '</td>'+
							'<td style="text-align: center;">' +
								'<button type="button" class="btn btn-outline-danger" onclick="deleteBtn('+ dto.optionSeq +')" style="width: 78px; height: 30px; font-size: 9pt">삭제</button>' +
							'</td>'+
						   '</tr';
				$('#option_table').append(str);
			});
		},
		error:function(){
			alert('error');	
		}
	});
});

function deleteAct() {
	let sellseq = '${act.sellSeq}';
	$.ajax({
		url:"deleteAct.do",
		type:"post",
		data: { seq:sellseq },
		success:function(msg){
			if(msg == 'success'){
				alert('성공적으로 판매정보를 삭제하였습니다');
				location.href = "activity.do";
			}else{
				alert('판매정보삭제 실패하셨습니다');
				location.href = "actdetail.do?seq=" + seq;
			}
		},
		error:function(){
			alert('error');
		}
	});
}

function addOption() {
	let seq = '${act.sellSeq}';
	$.ajax({
		url:"addOption.do",
		type:"post",
		data: { sellSeq:seq, opcontent:$('#content').val(), maxPeople:$('#maxPpl').val(), opPrice:$('#price').val(), startDate:$('#datepicker1').val(),  endDate:$('#datepicker2').val()},
		success:function(msg){
			if(msg == 'success'){
				alert('성공적으로 옵션등록하였습니다');
				location.href = "actdetail.do?seq=" + seq;
			}else{
				alert('옵션등록 실패하셨습니다');
				location.href = "actdetail.do?seq=" + seq;
			}
		},
		error:function(){
			alert('error');
		}
	});
}

function deleteBtn(optionSeq) {
	let seq = '${act.sellSeq}';
	$.ajax({
		url:"deleteOption.do",
		type:"post",
		data: { seq:optionSeq },
		success:function(msg){
			if(msg == 'success'){
				alert('성공적으로 옵션삭제하였습니다');
				location.href = "actdetail.do?seq=" + seq;
			}else{
				alert('옵션삭제 실패하셨습니다');
				location.href = "actdetail.do?seq=" + seq;
			}
		},
		error:function(){
			alert('error');
		}
	});
}
/* widget calendar */
$("#datepicker1,#datepicker2").datepicker({
     showMonthAfterYear:true,
     showOn:"both",
     buttonImage:"./image/calendar.png",
     buttonImageOnly:true,
     buttonText: "Select date",
     dateFormat:'yy-mm-dd',
     nextText:'다음 달',
     prevText:'이전 달',
     dayNamesMin:['일','월','화','수','목','금','토'],
     monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
});
</script>
</body>
</html>