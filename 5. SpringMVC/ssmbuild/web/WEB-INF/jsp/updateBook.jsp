<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改书籍</title>

    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/allBook">返回全部书籍</a>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/book/updateBook" method="post">
        <%--与新增书籍不同，此时需要传递书籍ID--%>
        <%--方式1：将此域设置为只读--%>
<%--        <div class="form-group">--%>
<%--            <label>书籍ID</label>--%>
<%--            <input type="text" name="bookID" class="form-control" value="${QBooks.bookID}" readonly>--%>
<%--        </div>--%>
        <%--方式2：隐藏域--%>
        <input type="hidden" name="bookID" value="${QBooks.bookID}">

        <div class="form-group">
            <label>书籍名称</label>
            <input type="text" name="bookName" class="form-control" value="${QBooks.bookName}" required>
        </div>
        <div class="form-group">
            <label>书籍数量</label>
            <input type="text" name="bookCounts" class="form-control" value="${QBooks.bookCounts}" required>
        </div>
        <div class="form-group">
            <label>书籍描述</label>
            <input type="text" name="detail" class="form-control" value="${QBooks.detail}" required>
        </div>
        <div class="form-group">
            <input type="submit" class="form-control btn btn-primary" value="修改">
        </div>
    </form>

</div>
</body>
</html>
