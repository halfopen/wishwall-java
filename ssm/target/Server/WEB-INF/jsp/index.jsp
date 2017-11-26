<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="./base/header.jsp" />

<div id="container" style="height:520px;max-width: 100%">

</div>
<input id="input" type="text" placeholder="随便说说吧...按回车发布" />

<script>
    (function ($) {

        var container;

        // 可选颜色
        var colors = ['#96C2F1', '#BBE1F1', '#E3E197', '#F8B3D0', '#FFCC00'];

        //创建许愿页
        var createItem = function(name, text, id){
            var color = colors[parseInt(Math.random() * 5, 10)]
            if($("#islogin").attr("islogin")!="true"){
                $('<div class="item rotateIn animated"><p>'+name+':'+ text +'</p></div>').css({ 'background': color }).appendTo(container).drag();
            }else{
                $('<div class="item rotateIn animated"><p>'+name+':'+ text +'</p><a id="'+id+'"  href="javascript:void(0);">关闭</a></div>').css({ 'background': color }).appendTo(container).drag();
            }
        };

        // 定义拖拽函数
        $.fn.drag = function () {

            var $this = $(this);
            var parent = $this.parent();

            var pw = parent.width();
            var ph = parent.height();
            var thisWidth = $this.width() + parseInt($this.css('padding-left'), 10) + parseInt($this.css('padding-right'), 10);
            var thisHeight = $this.height() + parseInt($this.css('padding-top'), 10) + parseInt($this.css('padding-bottom'), 10);

            var x, y, positionX, positionY;
            var isDown = false;

            var randY = parseInt(Math.random() * (ph - thisHeight), 10);
            var randX = parseInt(Math.random() * (pw - thisWidth), 10);


            parent.css({
                "position": "relative",
                "overflow": "hidden"
            });

            $this.css({
                "cursor": "move",
                "position": "absolute"
            }).css({
                top: randY,
                left: randX
            }).mousedown(function (e) {
                parent.children().css({
                    "zIndex": "0"
                });
                $this.css({
                    "zIndex": "1"
                });
                isDown = true;
                x = e.pageX;
                y = e.pageY;
                positionX = $this.position().left;
                positionY = $this.position().top;
                return false;
            });


            $(document).mouseup(function (e) {
                isDown = false;
            }).mousemove(function (e) {
                var xPage = e.pageX;
                var moveX = positionX + xPage - x;

                var yPage = e.pageY;
                var moveY = positionY + yPage - y;

                if (isDown == true) {
                    $this.css({
                        "left": moveX,
                        "top": moveY
                    });
                } else {
                    return;
                }
                if (moveX < 0) {
                    $this.css({
                        "left": "0"
                    });
                }
                if (moveX > (pw - thisWidth)) {
                    $this.css({
                        "left": pw - thisWidth
                    });
                }
                if (moveY < 0) {
                    $this.css({
                        "top": "0"
                    });
                }
                if (moveY > (ph - thisHeight)) {
                    $this.css({
                        "top": ph - thisHeight
                    });
                }
            });
        };

        // 初始化
        var init = function () {

            container = $('#container');

            // 绑定关闭事件
            container.on('click','a',function () {

                $(this).parent().remove();
                console.log($(this).attr("id"));
                $.ajax({
                    type: "GET",
                    url: "deleteMessage?id="+$(this).attr("id"),
                    success: function (data) {
                        console.log(data);
                    }
                });
            }).height($(window).height() -204);


            $.ajax({
                type: "GET",
                url: "getMessages",
                success: function (data) {
                    //alert(data);
                    data = JSON.parse(data);
                    $.each(data, function (i,v) {
                        createItem(v.username, v.content, v.id);
                    });
                }
            });

//            var tests = ['道友，还处在凝气期吗？', 'I have a dream...', '路漫漫其修远兮。。。', '与自己为敌，与自己为友', '脚本源码下载', '脚本之家', '既然选择了远方，便只顾风雨兼程！'];
//            $.each(tests, function (i,v) {
//                createItem(v);
//            });

            // 绑定输入框
            $('#input').keydown(function (e) {
                var $this = $(this);
                if(e.keyCode == '13') {
                    var value = $this.val();
                    if(value) {

                        $this.val('');
                        $.ajax({
                            type: "GET",
                            url: "addMessage?content="+value,
                            success: function (data) {
                                console.log(data);
                                data = JSON.parse(data);
                                createItem(data.username, data.content, data.id);
                            }

                        });
                    }
                }
            });

        };

        $(function() {
            init();
        });

    })(jQuery);
</script>

<jsp:include page="./base/footer.jsp"/>