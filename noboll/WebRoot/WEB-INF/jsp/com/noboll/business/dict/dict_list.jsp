<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <spring:message code="jsp.include.charset"/>
    <spring:message code="jsp.include.equiv"/>
    <spring:message code="jsp.include.viewport"/>
    
    <base href="<%=basePath%>">
    
    <title>数据字典</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">  
	
	<spring:message code="jsp.include.basecss"/>
	<spring:message code="jsp.include.listcssforback"/>
	<link rel="stylesheet" href="http/business/login/css/public.css">
	
  </head>
  
  <body>
  	<div class="container tab-form1">
	  		 <div class="table-responsive">
				<div class="panel-heading-choose">数据字典列表</div>
			  	<div id="searchDiv"></div>
				<table id="table-javascript" ></table>
	    	</div>
    	</div>
    	<spring:message code="jsp.include.basejs"/>
    	<spring:message code="jsp.include.listjsforback"/>
    	
    	<script type="text/javascript">
    		
    		$(document).ready(function () {
		       	$("#table-javascript").initBootTable({
		       		method: 'post',
		       		searchDiv:"searchDiv",
	                url: 'business/dict/list.do?typeId=<c:out value="${typeId}" />',
	                addUrl:"",
	                striped: true,
	                pagination: true,
	                sidePagination:"server",
	                pageSize: 10,
	                minimumCountColumns: 2,
	                rowButtons:[ // select 表示选择规则，1表示多选，0表示单选，空表示不选
	                	{name:'新增',position:'top',select:"",css:"add",dialog:{url:"business/dict/toAdd.do?typeId=<c:out value='${typeId}' />",width:"500px"}},//新增
	                	{name:'修改',position:'row',css:"edit",a:'',dialog:{url:"business/dict/toEdit.do",width:"500px"}},//修改	         	
	                	{name:'删除',position:'row',css:"remove",type:"ajax",url:"business/dict/remove.do"}//删除
	                ],
	                clickToSelect: true,
	                columns: [
				                	//{field: 'statu_msb',checkbox: true},   //复选框
				                	{field: 'id',title:'id',visible:false}, 
				                    {field: 'name',title: '名称',align: 'center',valign: 'middle',sortable: false,searchable:true}, //名称
				                    {field: 'typeName',title: '类型',align: 'center',valign: 'middle',sortable: false}, //类型
				                    {field: 'code',index:'login_id',title: '编码',align: 'left',valign: 'top',searchable:true},	//描述
				                    {field: 'description',index:'login_id',title: '描述',align: 'left',valign: 'top'}	//描述	
				                   		                    
				                  ]
	            	});
		    	});
		    	
    	</script>
  </body>
</html>
