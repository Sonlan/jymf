<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<script>
    $().ready(function() {
    	$("#monitor-product").addClass("active");
               
        /** 表单验证    */
        $("#fenye").validate({
            rules: {
                id: {
                    digits:true
                }
            }
        });
    });
    
</script>
</head>

<body>
<form:form id="fenye" name="fenye" action="${ctx}/monitor/company/product/query" method="post">
    <div id="content_top">
        <table class="jymf_table" >
            <tr class="table_1_tr">
                <td>产品名称&nbsp;&nbsp;&nbsp;
                    <input name="name" type="text" class="texts" value="${product.name}"/>
                </td>
                <td><div style="margin-left: 20px;">&nbsp;</div></td>
                <td>产品ID&nbsp;&nbsp;&nbsp;
                    <input name="id" type="text" class="texts" value="${product.id}"/>
                </td>
                <td><input class="center_btn cx_btn" type="submit" value="查 询"/></td>
            </tr>
        </table>
    </div> 
    <div style="margin: 10px;">公司名称&nbsp;&nbsp;&nbsp;&nbsp; ${companybase.name}</div>
    
    <table id="table_1" class="jymf_table table_border">
        <tr id="table_1_titlebar">           
        	<td class="jymf_td row_1" rowspan="1" colspan="1">产品ID</td>
            <td class="jymf_td row_6" rowspan="1" colspan="1">产品名称</td>
            <td class="jymf_td row_1" rowspan="1" colspan="1">生产商</td>
            <td class="jymf_td row_1" rowspan="1" colspan="1">激活数量</td>
            <td class="jymf_td row_1" rowspan="1" colspan="1">消费查询数量</td>
            <td class="jymf_td row_6" rowspan="1" colspan="1">创建时间</td>
            <td class="jymf_td row_6" rowspan="1" colspan="1">最终更新时间</td>
            <td class="jymf_td row_1" rowspan="1" colspan="1">操作</td>
        </tr>
        <c:forEach var="product" items="${pageView.records}">
        <tr class="jymf_tr table_1_tr">
        	<td>${product.id}</td>
            <td>${product.name}</td>
            <td>
                <div class="td_name_1">
                    <a title="${product.producer}">${product.producer}</a>
                </div>
            </td>
            <td>${product.labelCnt}</td>
            <c:if test="${product.consNum eq ''}">
            	<td>${product.consNum}</td>
            </c:if>
            <c:if test="${product.consNum ne ''}">
            	<td>0</td>
            </c:if>
             <td><fmt:formatDate value="${product.createDate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/></td>
            <td><fmt:formatDate value="${product.updateDate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/></td>
            <td align="center">
                <div class="small_btn">
                    <a class="linke" href="${ctx}/monitor/company/product/view/${product.id}" 
                       id="editLink-${product.id}">查看</a>
                </div>
            </td>
        </tr>
        </c:forEach>
        <c:if test="${pageView.pageNum < pageView.pageSize }">
            <c:forEach begin="${pageView.pageNum}" end="${pageView.pageSize -1 }" step="1"> 
                <tr class="jymf_tr table_1_tr">
                    <td>&nbsp;</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr> 
            </c:forEach> 
        </c:if>
    </table>
    <div><%@include file="../../../../common/webfenye.jsp" %></div>
</form:form>
</body>
</html>