<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


    <h1>List of All ô Pizzas</h1>
    <ul>
        <c:forEach var="p" items="${pizzas}">
            <li>${p.id} - ${p.name} - ${p.price}</li>
        </c:forEach>
    </ul>
