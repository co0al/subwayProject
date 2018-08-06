<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>SUBWAY 써브웨이 관리자</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/subwayadmin.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2O/jquery.min.js"></script>-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<link href="images/common/subway_favicon.ico?v=1" rel="shortcut icon" type="image/x-icon">
<script src="js/subwayadmin.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
<header>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="/">
          <img alt="Brand" src="images/logo_sub_header.png">
        </a>
      </div>
    </div>
  </nav>
</header>
<section>
  <div id="container" class="content-wrap">
    <div class="container">
      <div class="row">
        <div class="page-header">
          <h1>관리자등록</h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form id="adminform" action="/manager/manInsert.do" method="get" role="form">
            <div class="form-group">
              <label for="InputID">아이디</label>
              <input type="text" class="form-control" id="InputID" name="id" value="" placeholder="아이디" required>
            </div>
            <div class="form-group">
              <label for="InputPassword1">비밀번호</label>
              <input type="password" class="form-control" id="InputPassword1" name="pw" value="" placeholder="비밀번호" required>
            </div>
            <div class="form-group">
              <label for="InputPassword2">비밀번호 확인</label>
              <input type="password" class="form-control" id="InputPassword2" name="pw2" value="" placeholder="비밀번호 확인" required>
              <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
            </div>
            <div class="form-group">
              <label for="username">이름</label>
              <input type="text" class="form-control" id="username" name="name" value="" placeholder="이름을 입력해 주세요" required>
            </div>
            <div class="form-group">
              <label for="phnum">휴대폰번호</label>
              <input type="text" class="form-control" id="phnum" name="hpnum" value="" maxlength="13" placeholder="휴대폰을 입력해 주세요" required>
            </div>
            <div class="form-group">
              <label for="address">지점명</label>
              <input type="text" class="form-control" id="shop" name="shop" value="" placeholder="지점명을 입력해 주세요" required>
           
            </div>
            <div class="form-group">
            	<label for="address">주소</label>
            		<div class="form-inline">
             			<input type="text" class="form-control" id="sample6_postcode" name="zipcode" value="" placeholder="우편번호" required>
			 			<input type="button" class="btn btn-default form-inline" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
            		</div>
            		<div class="form-inline">
            			<input type="text" class="form-control" id="sample6_address" name="address" value="" placeholder="주소" required>
						<input type="text" class="form-control" id="sample6_address2" name="address2" value="" placeholder="상세주소" required>
            		</div>
            </div>
            <div class="form-group text-center">
              <button type="button" onclick="location.href='/manager/manMain.do'" class="btn btn-warning">취소<i class="fa fa-times spaceLeft"></i></button>
              <button type="submit" class="btn btn-info">등록<i class="fa fa-check spaceLeft"></i></button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
<footer>

</footer>
</body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
</html>