<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="index" value="${index}" />
<html>
<head>
<link href="${ctx}/static/css/company.css" type="text/css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
<script>
$(document).ready(function(){
$("#monitor-welcome").addClass("active");

    /** 表单验证    */
    $("#fenye").validate({
        rules: {
            id: {
            	digits:true
            }
        }
    });
});
function toSubmit(){
	$("#tname").val("1");
	return true;
}
</script>
</head>

<body>
	<form:form id="fenye" name="fenye" modelAttribute="company"
		action="${ctx}/monitor/main" onsubmit="toSubmit()"
	    method="post">
		<input type="hidden" value="${index}" name="tname" id="tname"/>
		<div id="content_top">
			<table class="jymf_table">
				<tr class="table_1_tr">
					<td>企业名称&nbsp; <input name="name" type="text" class="texts" value="${company.name}"
						 />
					</td>
					<td>企业ID&nbsp;&nbsp; <input name="id" type="text" value="${company.id}"
						class="texts"/>
					</td>
					<td>开始日期&nbsp; <input name="startDate" type="text"
						class="Wdate" onclick="WdatePicker()" value="${company.startDate}"
						style="width: 190px; height: 25px;" />
					<td>
					<td>结束日期&nbsp; <input name="endDate" type="text" class="Wdate"
						onclick="WdatePicker()" value="${company.endDate}"
						style="width: 190px; height: 25px;" />
					<td>
					<td><input class="center_btn cx_btn" type="submit"  value="查 询" /></td>
				</tr>
			</table>
		</div>
		<table id="table_1" class="jymf_table table_border">
 			<c:if test="${index eq '0' || index eq '2'}">
				<tr id="table_1_titlebar">
					<td class="jymf_td row_3" rowspan="1" colspan="1">监管单位名称</td>
					<td class="jymf_td row_1" rowspan="1" colspan="1">用户名</td>
					<td class="jymf_td row_1" rowspan="1" colspan="1">创建时间</td>
					<td class="jymf_td row_5" rowspan="1" colspan="1">下属单位</td>
				</tr>
				<c:forEach var="monitor" items="${pageView.records}">
					<tr class="jymf_tr table_1_tr">
						<td>${monitor.name}</td>
						<td>${monitor.account}</td>
						<td>${monitor.createTime}</td>
						<td align="center">
							<div class="small_btn">
								<c:if test="${monitor.level ne '3' }">
									<a class="linke"
										href="${ctx}/monitor/moreMonitor/${monitor.areaCode}/${monitor.level}"
										id="editLink-${monitor.id}">查看</a>
								</c:if>
								<c:if test="${monitor.level eq '3' }">
									<a class="linke"
										href="${ctx}/monitor/campanyList/${monitor.id}"
										id="editLink-${monitor.id}">查看</a>
								</c:if>
							</div>
						</td>
					</tr>
				</c:forEach>
				<c:if test="${pageView.pageNum < pageView.pageSize }">
					<c:forEach begin="${pageView.pageNum}"
						end="${pageView.pageSize -1 }" step="1">
						<tr class="jymf_tr table_1_tr">
							<td>&nbsp;</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
				</c:if>
			</c:if>
			<c:if test="${index eq '1' || index eq '3'}">
				<tr id="table_1_titlebar">
					<td class="jymf_td row_3" rowspan="1" colspan="1">企业名称</td>
					<td class="jymf_td row_1" rowspan="1" colspan="1">企业代码</td>
					<td class="jymf_td row_1" rowspan="1" colspan="1">合同数量</td>
					<td class="jymf_td row_1" rowspan="1" colspan="1">标签使用量</td>
					<td class="jymf_td row_1" rowspan="1" colspan="1">总评分</td>
					<td class="jymf_td row_1" rowspan="1" colspan="1">当前状态</td>
					<td class="jymf_td row_5" rowspan="1" colspan="1">产品详细</td>
				</tr>
				<c:forEach var="company" items="${pageView.records}">
					<tr class="jymf_tr table_1_tr">
						<td class="jymf_td row_3">
							<div class="td_name">
								<a title="${company.name}">${company.name}</a>
							</div>
						</td>
						<td>${company.id}</td>
						<td>${company.packageCnt}</td>
						<td>${company.activeCnt}</td>
						<td><c:if test="${company.rate ne 0}">
								<fmt:formatNumber type="number" value="${company.rate}"
									maxFractionDigits="1" />
							</c:if></td>
						<td><c:if test="${company.status eq '0'}">正常</c:if> <c:if
								test="${company.status eq '1'}">挂起</c:if></td>
						<td align="center"><c:if test="${company.workMode ne '1' }">
								<div class="small_btn">
									<a class="linke" href="${ctx}/monitor/company/${company.id}"
										id="editLink-${company.id}">详细</a>
								</div>
							</c:if></td>
					</tr>
				</c:forEach>
				<c:if test="${pageView.pageNum < pageView.pageSize }">
					<c:forEach begin="${pageView.pageNum}"
						end="${pageView.pageSize -1 }" step="1">
						<tr class="jymf_tr table_1_tr">
							<td>&nbsp;</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
				</c:if>
			</c:if>

		</table>
		<div><%@include file="../common/webfenye.jsp"%></div>
	</form:form>
</body>
</html>