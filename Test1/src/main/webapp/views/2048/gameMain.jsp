<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<link rel="stylesheet" href="views/2048/style.css">
		<link rel="stylesheet" href="css/gameMainStyle.css">
		<link rel="stylesheet" href="css/imsi.css"><!-- 임시 css 나중에 삭제 -->
		<link rel="stylesheet" href="css/style.css">
		<script type="text/javascript" src="views/2048/script.js"></script>
		<title>Insert title here</title>
	</head>
	<body>
		<div class="wrap">
			<jsp:include page="/views/common/header.jsp"/>
			<jsp:include page="/views/2048/main.jsp"/>
			<jsp:include page="/views/common/footer.jsp"/>
		</div>
	</body>
</html>