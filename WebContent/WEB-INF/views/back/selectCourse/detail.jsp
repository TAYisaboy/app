<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<%@ include file="/commons/basejs.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css"
	href="${staticPath }/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${staticPath }/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${staticPath }/static/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${staticPath }/static/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css"
	href="${staticPath }/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="${staticPath }/static/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${staticPath }/static/css/style.css" />
<style type="text/css">
.table-sort tr td {
	text-align: center;
}
</style>
</head>
<body>
	<nav class="breadcrumb">
	<i class="Hui-iconfont" style="color: #000;">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>实验管理
	<span class="c-gray en">&gt;</span> 实验查看
	 <a class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新">
			<i class="Hui-iconfont">&#xe68f;</i>
			<input type="hidden" name ="id">
	</a>
	</nav>
	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> 
				<%--  <shiro:hasPermission name="/back/report/selectCourseAdd">
					<a class="btn btn-primary radius" data-title="添加" id="add"
						href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加选课</a>
				</shiro:hasPermission> 
				<shiro:hasPermission name="/back/report/selectCourseDeleteIDs">
					<a data-href="javascript:;" id="delete"
						class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
						批量删除</a>
				</shiro:hasPermission> --%>
				<shiro:hasPermission name="/back/report/score/exportAll">
					<a class="btn btn-primary radius" title="导出所有实验成绩" class="exportAll" onclick="exportAll();"
						href="javascript:;"  ><i class="icon Hui-iconfont" style="color: #000;">&#xe644;</i>导出所有实验成绩</a>
					<a class="btn btn-primary radius" title="导出一次成绩" class="exportAll" onclick="exportOne();"
						href="javascript:;"  ><i class="icon Hui-iconfont" style="color: #000;">&#xe644;</i>导出一次成绩</a>
				</shiro:hasPermission> 
				<a class="btn btn-primary radius" title="返回" class="back" onclick="javascript:history.back(-1);"
						href="javascript:;"  ><i class="icon Hui-iconfont" style="color: #000;">&#xe6d4;</i>返回上一页</a>
				<input type="hidden" value="${id }" id="courseId"/>
			</span>
		</div>
		<br> 
		<div class="mt_right" style="float: right;">
			<form action="${staticPath}/back/report/search/${id}" id="pageForm" style="float: right;" method="get">
				<%-- <label class="mt_label">编码：</label> <input name="code"
					value="${department.code}" class="mt_select mt_input" type="text"
					placeholder="请输入..." /> <label class="mt_label">名称：</label> <input
					name="name" value="${department.name}" class="mt_select mt_input"
					type="text" placeholder="请输入关键字..." />
				<button class="mt_button" id="submitButton">
					<i class="Hui-iconfont">&#xe665;</i>
				</button> --%>
				<%-- <label class="mt_label"></span>学校：</label>
					<select class="mt_select"    id="schoolId" name="schoolId">
						<option value="">--请选择--</option>
						<c:forEach var="delist" items="${schoolList}">
									<option value="${delist.id}" ${delist.id==schoolId?"selected":"" } >${delist.name}</option>
						</c:forEach>
					</select> --%>
				<label class="mt_label"></span>实验名称：</label>
					<select class="mt_select"    id="experimentId" name="experimentId">
						<option value="">--请选择--</option>
						<c:forEach var="experiment" items="${experimentListof}">
							<option value="${experiment.id}" ${experiment.id==experimentId?"selected":"" }>${experiment.experimentName}</option>
						</c:forEach>
					</select>
				<c:if test="${user.adminType != 0}">
				<label class="mt_label"></span>院系：</label>
					<select class="mt_select"    id="departId" name="departId">
						<option value="">--请选择--</option>
						<c:forEach var="delist" items="${departmentList}">
							<option value="${delist.id}" ${delist.id==departId?"selected":"" }>${delist.name}</option>
						</c:forEach>
					</select>
				<label class="mt_label"></span>专业：</label>
					<select class="mt_select"  name="majorId" id="majorId">
						<option value="">--请选择--</option>
					</select>
				 <label class="mt_label"></span>班级：</label>
					<select class="mt_select"  name="classId" id="classId">
						<option value="">--请选择--</option>
					</select>
				</c:if>
				<button class="mt_button" id="submitButton">
					<i class="Hui-iconfont">&#xe665;</i>
				</button>
			</form>
		</div>
		<br>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th style="width:60px;"><input type="checkbox" name="" value=""></th>
						<th>实验编号</th>
						<th>实验名称</th>
						<c:if test="${user.adminType != 0}">
							<th>系部</th>
							<th>专业</th>
							<th>班级</th>
							<th>学号</th>
							<th>姓名</th>
						</c:if>
						<th>提交状态</th>
						<th>批阅状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:if
						test="${experimentList == null or experimentList.size() == 0 }">
						<c:if test="${user.adminType != 0}">
							<tr>
								<td colspan="11">没有记录</td>
							</tr>
						</c:if>
						<c:if test="${user.adminType == 0}">
							<tr>
								<td colspan="6">没有记录</td>
							</tr>
						</c:if>
					</c:if>
					<c:if
						test="${experimentList != null and experimentList.size() > 0 }">
						<c:forEach items="${experimentList }" var="experiment">
							<tr class="text-c">
								<td><input type="checkbox" value="${experiment.id }"
									class="ids" name=""></td>
								<td>${experiment.experimentCode }</td>
								<td title="${experiment.experimentName }">${experiment.experimentName }</td>
								<c:if test="${user.adminType != 0}">
									<td>${experiment.departName }</td>
									<td>${experiment.majorName }</td>
									<td>${experiment.className }</td>
									<td>${experiment.studentCode }</td>
									<td>${experiment.studentName }</td>
								</c:if>
								<td>${experiment.status==0?"未提交":"已提交" }</td>
								<td>${experiment.score > 0 ?"已批阅":"未批阅" }</td>
								<td class="f-14 td-manage">
									<c:if test="${experiment.score > 0}">
										<shiro:hasPermission name="/back/report/experimentSearch">
											<%-- <a href="${staticPath}/back/report/experimentSearch/${experiment.id}"
												class="tablelink experimentSearch" title="查看"><i class="icon Hui-iconfont" style="color: #000;">&#xe665;</i></a> --%>
											<a href="javascript:void(0);" idVal="${experiment.id}" class="tablelink experimentSearch" title="查看">
												<i class="icon Hui-iconfont" style="color: #000;">&#xe665;</i></a>
										</shiro:hasPermission> 
									</c:if>
									<c:if test="${experiment.score==null and experiment.status==1}">
										<shiro:hasPermission name="/back/report/update">
											<%-- <a href="${staticPath}/back/report/update/${experiment.id}"
												class="tablelink update" title="修改"><i class="icon Hui-iconfont" style="color: #000;">&#xe6df;</i></a> --%>
												<a href="javascript:void(0);" idVal="${experiment.id}" class="tablelink update" title="修改">
												<i class="icon Hui-iconfont" style="color: #000;">&#xe6df;</i></a>
										</shiro:hasPermission> 
										<%-- <shiro:hasPermission name="/back/report/delete">
											<a href="${staticPath}/back/report/delete/${experiment.id}"
												class="tablelink delete" title="删除"><i class="icon Hui-iconfont" style="color: #000;">&#xe609;</i></a>
										</shiro:hasPermission> --%>
									</c:if>
									<c:if test="${experiment.status==0}">
										<shiro:hasPermission name="/back/report/submit">
											<a href="javascript:void(0);" idVal="${experiment.id}" class="tablelink submit" title="提交">
												<i class="icon Hui-iconfont" style="color: #000;">&#xe642;</i></a>
											<%-- <a href="${staticPath}/back/report/submit/${experiment.id}"
												class="tablelink submit" title="提交"><i class="icon Hui-iconfont" style="color: #000;">&#xe642;</i></a> --%>
										</shiro:hasPermission>
									</c:if>
									<c:if test="${experiment.score==null and experiment.status==1}">
										<shiro:hasPermission name="/back/report/check">
											<a href="javascript:void(0);" idVal="${experiment.id}" class="tablelink check" title="批阅">
												<i class="icon Hui-iconfont" style="color: #000;">&#xe6e1;</i></a>
											<%-- <a href="${staticPath}/back/report/check/${experiment.id}"
												class="tablelink check" title="批阅"><i class="icon Hui-iconfont" style="color: #000;">&#xe6e1;</i></a> --%>
										</shiro:hasPermission> 
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<jsp:include page="../../common/page.jsp" />
		</div>
	</div>
	<script type="text/javascript"
		src="${staticPath }/static/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${staticPath }/static/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="${staticPath }/static/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="${staticPath }/static/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${staticPath }/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="${staticPath }/static/h-ui.admin/js/H-ui.admin.js"></script>
	<script type="text/javascript">
		function jumpUrl() {
			top.layer.closeAll();
			window.location.href = "${staticPath}/back/department/manager";
		}
		
		function exportAll(){
			var cid =$("#courseId").val();
			var classId = $("#classId").val();
			if(classId==null||classId==""){
				layer.alert("请先选择班级！");
				return ;
			}
			top.layer.confirm('将会导出该班级所有学生该门课程的所有实验成绩，是否继续？', {
				btn: ['是','否'] //按钮
			},function(){
				 window.location.href = '${staticPath}/back/report/score/exportAll/'+cid+'/'+classId;
				 top.layer.closeAll();
				}
			)
		}
		function exportOne(){
			var cid =$("#courseId").val();
			var classId = $("#classId").val();
			var experimentId = $("#experimentId").val();
			if(classId==null||classId==""){
				layer.alert("请先选择班级！");
				return ;
			}
			if(experimentId==null||experimentId==""){
				layer.alert("请选择实验名称！");
				return ;
			}
			top.layer.confirm('将会导出该班级所有学生该门课程的所有实验成绩，是否继续？', {
				btn: ['是','否'] //按钮
			},function(){
				 window.location.href = '${staticPath}/back/report/score/exportOne/'+cid+'/'+classId+'/'+experimentId;
				 top.layer.closeAll();
				}
			)
		}
		
		var index;
		$("#add").click(function() {
				top.layer.open({
					title: false,
					type: 2,shadeClose: true,shade: 0.3,area: ['800px', '50%'],
					content : rootPath + "/back/department/departmentAddUI",btn: ['保存','取消'],
					yes:function(index, layero){
						//提交iframe中的表单
						var frameName="layui-layer-iframe"+index;//获得layer层的名字
						var formdata = parent.frames[frameName].getFormData();
						if(formdata!=0){
							subAddForm(formdata);
						}
					}
				});
			});
			 function subAddForm(addFormData){
					top.layer.closeAll();
					$.ajax({  
						type:'post',
						url:rootPath+"/back/department/departmentAdd",
						data:addFormData,  
					    cache:false,
					    dataType:'json', 
					    success:function(data){
					    	if(data.success==true){
					    		top.layer.alert("保存成功！", {icon: 1},function(){jumpUrl();});
					    	}else{
					    		top.layer.alert(data.msg, {icon: 2},function(){jumpUrl();});}
					    }, 
					    error:function(){
					    	top.layer.alert("保存失败，系统内部错误!", {icon: 5},function(){jumpUrl();});
					    }
					});
				}			

			/*批量删除  */
			$("#delete")
					.click(
							function() {
								var idChecks = $(".ids:checked");
								if (idChecks.length == 0) {
									top.layer.alert("请选择需要删除的记录！");
									return false;
								}
								top.layer
										.confirm(
												'您确认删除选中的记录吗?',
												{
													icon : 3,
													title : '提示'
												},
												function() {

													var id = "";
													var ids = new Array();
													for (var i = 0; i < idChecks.length; i++) {
														id += idChecks[i].value
																+ ",";
														ids[i] = idChecks[i].value;
													}
													$
															.ajax({
																url : "${staticPath }/back/department/departmentDeleteIDs",
																type : "post",
																data : "ids="
																		+ ids,
																dataType : "json",
																success : function(
																		data) {
																	if (data.success == true) {
																		top.layer
																				.alert(
																						data.msg,
																						{
																							icon : 1
																						},
																						function() {
																							jumpUrl();
																						});
																	} else {
																		top.layer
																				.open(
																						{
																							title : '删除',
																							content : "删除失败！有关联信息！",
																							icon : 2
																						},
																						function(
																								index) {
																							top.layer
																									.close(index);
																						});
																	}
																},
																error : function() {
																	top.layer
																			.alert(
																					"删除失败，系统内部错误!",
																					{
																						icon : 5
																					},
																					function() {
																						jumpUrl();
																					});
																}
															});
												});

							});
		
		/*修改*/
		$(".departmentUpdate").click(
				function() {
					var id = $(this).attr("idVal");
					top.layer.open({
						title : false,
						type : 2,
						shadeClose : true,
						shade : 0.3,
						area : [ '800px', '50%' ],
						content : rootPath
								+ '/back/department/departmentUpdateUI/' + id,
						btn : [ '修改', '取消' ],
						yes : function(index, layero) { //提交iframe中的表单
							var frameName = "layui-layer-iframe" + index;//获得layer层的名字
							var formdata = parent.frames[frameName]
									.getFormData();
							if (formdata != 0) {
								subEditForm(formdata);
							}
						}
					});
				});
		function subEditForm(addFormData) {
			top.layer.closeAll();
			$.ajax({
				type : 'post',
				url : rootPath + "/back/department/departmentUpdate",
				data : addFormData,
				cache : false,
				dataType : 'json',
				success : function(data) {
					if (data.success == true) {
						top.layer.alert(data.msg, {
							icon : 1
						}, function() {
							jumpUrl();
						});
					} else {
						top.layer.alert(data.msg, {
							icon : 2
						}, function() {
							jumpUrl();
						});
					}
				},
				error : function() {
					top.layer.alert("修改失败，系统内部错误!", {
						icon : 5
					}, function() {
						jumpUrl();
					});
				}
			});
		}

		/* 删除 */
		$(".departmentDelete").click(function() {
			var id = $(this).attr("idVal");
			top.layer.confirm('将会执行删除，是否继续？', {
				btn : [ '是', '否' ]
			//按钮
			}, function() {
				$.ajax({
					type : 'get',
					url : rootPath + "/back/department/departmentDelete/" + id,
					cache : false,
					dataType : 'json',
					success : function(data) {
						if (data.success == true) {
							top.layer.alert(data.msg, {
								icon : 1
							}, function() {
								jumpUrl();
							});
						} else {
							top.layer.alert(data.msg, {
								icon : 2
							}, function() {
								jumpUrl();
							});
						}
					},
					error : function() {
						top.layer.alert("删除失败，系统内部错误!", {
							icon : 5
						}, function() {
							jumpUrl();
						});
					}
				});
			});
		});
		
		$(".submit").click(function() {
			var id = $(this).attr("idVal");
			top.layer.open({
				title: false,
				type: 2, shadeClose: true, shade: 0.3, area: ['800px', '60%'],
				content: rootPath+'/back/report/submitUI/'+ id, 
				btn: ['取消'],/* , yes:function(index, layero){ //提交iframe中的表单
					var frameName="layui-layer-iframe"+index;//获得layer层的名字
					var formdata = parent.frames[frameName].getFormData();
					if(formdata!=0){
						subForm(formdata);
					}
				} */
				 end: function () {
				        location.reload();
				      }
			});
		});
		$(".update").click(function() {
			var id = $(this).attr("idVal");
			top.layer.open({
				title: false,
				type: 2, shadeClose: true, shade: 0.3, area: ['800px', '60%'],
				content: rootPath+'/back/report/updateUI/'+ id, 
				btn: ['取消'],/* , yes:function(index, layero){ //提交iframe中的表单
					var frameName="layui-layer-iframe"+index;//获得layer层的名字
					var formdata = parent.frames[frameName].getFormData();
					if(formdata!=0){
						subForm(formdata);
					}
				} */
				 end: function () {
				        location.reload();
				      }
			});
		});
		/* function subForm(addFormData){
			top.layer.closeAll();
			$.ajax({ type:'post', url:rootPath+"/back/report/submit", data:addFormData,  
			    cache:false, dataType:'json', success:function(data){
			    	if(data.success==true){ 
			    		top.layer.alert(data.msg, {icon: 1},function(){ jumpUrl(); });
			    	} else { top.layer.alert(data.msg, {icon: 2},function() { jumpUrl(); }); }
			    },
			    error:function(){ top.layer.alert("提交失败，系统内部错误!", {icon: 5});
			    }
			});
		} */
		
		$(".check").click(function() {
			var id = $(this).attr("idVal");
			top.layer.open({
				title: false,
				type: 2, shadeClose: true, shade: 0.3, area: ['800px', '90%'],
				content: rootPath+'/back/report/checkUI/'+ id, 
				btn: ['取消'],/* , yes:function(index, layero){ //提交iframe中的表单
					var frameName="layui-layer-iframe"+index;//获得layer层的名字
					var formdata = parent.frames[frameName].getFormData();
					if(formdata!=0){
						subForm(formdata);
					}
				} */
				 end: function () {
				        location.reload();
				      }
			});
		});
		$(".experimentSearch").click(function() {
			var id = $(this).attr("idVal");
			top.layer.open({
				title: false,
				type: 2, shadeClose: true, shade: 0.3, area: ['800px', '90%'],
				content: rootPath+'/back/report/scoreDetail/'+ id, 
				btn: ['取消'],/* , yes:function(index, layero){ //提交iframe中的表单
					var frameName="layui-layer-iframe"+index;//获得layer层的名字
					var formdata = parent.frames[frameName].getFormData();
					if(formdata!=0){
						subForm(formdata);
					}
				} */
				 end: function () {
				        location.reload();
				      }
			});
		});
		$("#departId").blur(function(){
			var departmentId = document.getElementById("departId").value;
			$.ajax({
				url:"${staticPath }/back/report/seletMajor",
				type:"post",
				dataType : "json",
				data:{departmentId:departmentId},
				success:function(data){
					var types=data.obj;
					if(types!=null && types.length>0){
						$("#majorId").empty();
						for(var i=0;i<types.length;i++){
							$("#majorId").append(
									'<option value="' + types[i].id + '" ' + (majorId ==types[i].id   ? 'selected=selected':'') + '>' + types[i].name + '</option>');
						}
					}else{
						$("#majorId").empty();//清空
						$("#majorId").append(
							"<option value=''>--所属专业--</option>"
						);
					}
				}
			});
		});
		$("#majorId").blur(function(){
			var majorId = document.getElementById("majorId").value;
			$.ajax({
				url:"${staticPath }/back/report/selectStudentClass",
				type:"post",
				dataType : "json",
				data:{majorId:majorId},
				success:function(data){
					var types=data.obj;
					if(types!=null && types.length>0){
						$("#classId").empty();
						for(var i=0;i<types.length;i++){
							$("#classId").append(
								'<option value="'+types[i].id+'"'+ (classId ==types[i].id   ? 'selected=selected':'')+'>'
							+types[i].year+'级'+types[i].name+"</option>");
						}
					}else{
						$("#classId").empty();//清空
						$("#classId").append(
							"<option value=''>--所属班级--</option>"
						);
					}
				}
			});
		});
	</script>
</body>
</html>