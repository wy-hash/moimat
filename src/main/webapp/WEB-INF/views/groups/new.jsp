<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.css" rel="stylesheet" type="text/css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.css.map"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.js"></script>
<title>Insert title here</title>

</head>
<body>
	<div class="container">
		<h1>정모등록</h1>
		<hr>
		<form action="/groups/${groupId}/meetings/new" method="post">
		<input type="hidden" name="teamSeq" value="${groupId }">
		<input type="hidden" name="memberSeq" value="${id }">
		<div class="input-group mb-3">
			<input type="text" class="form-control" name="title" placeholder="정모이름">
		</div>
		<div class="input-group mb-3">
			<input type="text" class="form-control" id="getmap"
				name="area" placeholder="정모장소" readonly="readonly">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button"
					id="selectmap">지역선택</button>
			</div>
		</div>
		<div class="input-group mb-3">
			<input type="date" class="form-control" placeholder="만나는날"> 
			<input type="text" class="form-control" id="setTime" value="" placeholder="시간">
			<input type="hidden" id="meetDate" name="meetDate" value="">
		</div>
		<div class="input-group mb-3">
			<input type="text" name="content" class="form-control" placeholder="정모내용">
		</div>
		<div class="input-group mb-3">
			<input type="text" name="payment" class="form-control" placeholder="정모회비">
		</div>
		<div class="input-group mb-3">
			<input type="text" name="maxPerson" class="form-control" placeholder="정모최대인원">
		</div>
		<button type="submit" class="btn btn-Secondary" id="subbtn">등록하기</button>
		</form>



	</div>

	<script type="text/javascript">
		
		$(document).ready(function(){
			var openWin;
			$('#selectmap').on('click',function(){
				window.name = "/group/${groupId}/meetings/new";
				// window.open("open할 window", "자식창 이름", "팝업창 옵션");
				openWin = window.open("/groups/map", "childForm",
						"width=1200, height=600");
			});
			
			$("#setTime").timepicker({
				timeFormat: 'H:i'
			});
			
			$('#subbtn').on('click',function(e){
				e.preventDefault();
			})

			
		})
	</script>
</body>
</html>