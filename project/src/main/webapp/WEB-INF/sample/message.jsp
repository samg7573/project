<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
</head>
	<script type="text/javascript">
		var message = "${data.message}";
		var url = "${data.href}";
		alert(message);
		document.location.href = url;
	</script>
</html>