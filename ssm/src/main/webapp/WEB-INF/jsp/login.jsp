<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="./base/header.jsp" />
<link rel="stylesheet" href="css/signin.css"/>
<div class="container">

    <div class="form-signin">
        <h2 style="color:white" class="form-signin-heading">请先登录</h2>
        <label for="inputName" class="sr-only">用户名</label>
        <input type="text" id="inputName" class="form-control" placeholder="请输入用户名" required="" autofocus="">
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="请输入密码" required="">
        <button id="btn-login" class=" btn btn-lg btn-primary btn-block" type="submit">登录</button>
    </div>
</div>
<script>
    $(document).ready(function(){
        console.log(1);
        $("#btn-login").click(function () {
            console.log(2);

            var name = $("#inputName").val();
            var password = $("#inputPassword").val();

            console.info(name+" "+password);

            $.ajax({
                url:"./user/login",
                method:"get",
                data:{"name":name, "password":password},
                success:function(data){
                    console.info(JSON.parse(data));
                    data = JSON.parse(data);
                    if(data.result=="1"){
                        window.location.href = "./";
                    }else{
                        alert("用户名或密码错误");
                    }
                },
                error:function(e){
                    alert("登录失败");
                }
            });
        });
    });
</script>
<jsp:include page="./base/footer.jsp"/>
