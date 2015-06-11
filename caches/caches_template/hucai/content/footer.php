<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><div class="f1">
    <div class="f2">
      <div class="footNav">
        <dl>
          <dt><a href="#">关于虎彩</a></dt>
          <dd><a href="#">发展历程</a></dd>
          <dd><a href="#">品牌战略</a></dd>
          <dd><a href="#">企业文化</a></dd>
          <dd><a href="#">公益&责任</a></dd>
          <dd><a href="#">荣誉&资质</a></dd>
          <dd><a href="#">创新基因</a></dd>
        </dl>
        <dl>
          <dt><a href="#">按访问者</a></dt>
          <dd><a href="#">发展历程</a></dd>
          <dd><a href="#">品牌战略</a></dd>
          <dd><a href="#">企业文化</a></dd>
          <dd><a href="#">公益&责任</a></dd>
          <dd><a href="#">荣誉&资质</a></dd>
          <dd><a href="#">创新基因</a></dd>
        </dl>
        <dl>
          <dt><a href="#">新闻&活动</a></dt>
          <dd><a href="#">发展历程</a></dd>
          <dd><a href="#">品牌战略</a></dd>
          <dd><a href="#">企业文化</a></dd>
          <dd><a href="#">公益&责任</a></dd>
          <dd><a href="#">荣誉&资质</a></dd>
          <dd><a href="#">创新基因</a></dd>
        </dl>
        <dl>
          <dt><a href="#">快捷链接</a></dt>
          <dd><a href="#">发展历程</a></dd>
          <dd><a href="#">品牌战略</a></dd>
          <dd><a href="#">企业文化</a></dd>
          <dd><a href="#">公益&责任</a></dd>
          <dd><a href="#">荣誉&资质</a></dd>
          <dd><a href="#">创新基因</a></dd>
        </dl>
      </div>
      <div class="share"> <img src="<?php echo IMG_PATH;?>hucai/bg/bg18.gif" />
        <ul>
          <li><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png5.png" /></a></li>
          <li><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png6.png" /></a></li>
          <li><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png7.png" /></a></li>
          <li><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png8.png" /></a></li>
          <li><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png9.png" /></a></li>
        </ul>
        <div class="clear"></div>
        <img src="<?php echo IMG_PATH;?>hucai/bg/png10.png" style="margin:10px 0 0 30px;" /> </div>
      <div class="clear"></div>
      <div class="f3">
        <div class="brand"><span>服务品牌</span><i>红塔山</i><i>红塔山</i><i>红塔山</i><i>红塔山</i><i>红塔山</i><i>红塔山</i><i>红塔山</i><i>红塔山</i></div>
        <div class="site"><a href="#">申请友情链接</a><cite>|</cite><a href="#">法律声明</a><cite>|</cite><a href="#">隐私保护</a><cite>|</cite><a href="#">网站地图</a><cite></cite><b class="qy">旗下企业
          <div><a href="#">企业1</a><a href="#">企业1</a><a href="#">企业1</a></div>
          </b></div>
        <div class="clear"></div>
      </div>
      <div class="copy">Copyright © 1988-2015 虎彩印艺股份有限公司 版权所有© 粤ICP备06001687号</div>
    </div>
  </div>
</div>
<div class="rightBar"> <a class="close"><img src="<?php echo IMG_PATH;?>hucai/bg/mobile_menu_closes.png" /></a>
  <ul class="rightMenu">
    <li><a class="r">首页</a></li>
    <li><a class="r">新闻中心</a>
      <div>
        <dl>
          <dd><a href="#">新闻中心</a></dd>
          <dd><a href="#">新闻中心</a></dd>
          <dd><a href="#">新闻中心</a></dd>
          <dd><a href="#">新闻中心</a></dd>
        </dl>
      </div>
    </li>
    <li><a class="r">印艺产品</a>
      <div>
        <dl>
          <dd><a href="#">新闻中心</a></dd>
          <dd><a href="#">新闻中心</a></dd>
          <dd><a href="#">新闻中心</a></dd>
          <dd><a href="#">新闻中心</a></dd>
        </dl>
      </div>
    </li>
    <li><a class="r">解决方案</a>
      <div>
        <dl>
          <dd><a href="#">新闻中心</a></dd>
          <dd><a href="#">新闻中心</a></dd>
          <dd><a href="#">新闻中心</a></dd>
          <dd><a href="#">新闻中心</a></dd>
        </dl>
      </div>
    </li>
    <li><a class="r">线上定制</a></li>
    <li><a class="r">服务支持</a></li>
    <li><a class="r">品牌活动</a></li>
  </ul>
  <script type="text/javascript">

$(function(){
	$(".menu").click(function(){
		$(this).parents("html").addClass("overflow");
		$(this).parents().find(".leftCon").stop().animate({left:"-50%"},500);
		$(this).parents().find(".rightBar").stop().animate({right:"0"},500);
		$(window).resize(function() { resizeleft();});
		function resizeleft(){
		var bodyW=$(window).width();
		if(bodyW>980){
			$(".leftCon").stop().animate({left:"0"},500)
			$(".rightBar").stop().animate({right:"-50%"},500);
			$("html").removeClass("overflow");
			$(".serch").css("height","0");
		}
	}
	resizeleft();
	})
	$(".close").click(function(){
		$(this).parents("html").removeClass("overflow");
		$(this).parents().find(".leftCon").stop().animate({left:"0"},500);
		$(this).parents().find(".rightBar").stop().animate({right:"-50%"},500);
	})
	$(".rightMenu li a.r").click(function(){
		$(this).parent().find("div").slideToggle("slow");
		$(this).toggleClass("active");
		$(this).parent().siblings().find("div").slideUp();
		$(this).parent().siblings().find("a.r").removeClass("active");
	})
	
	//$(".rightMenu li a.r").click(function(){
//		$(this).parent().find("div").stop().animate({height:$(this).parent().find("dd").size()*50+4},500);
//		$(this).parent().siblings().find("div").stop().animate({height:0},500)
//	})
	//$(".rightMenu li a.r").toggle(function(){
//    $(this).parent().find("div").stop().animate({height:$(this).parent().find("dd").size()*51+4},500);
//	$(this).parent().siblings().find("div").stop().animate({height:0},500)},
//    function(){
//    $(this).parent().find("div").stop().animate({height:0},500)}
 // );
})

</script> 
</div>
</body>
</html>
