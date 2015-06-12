<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><div class="f1">
  <div class="f2">
    <div class="footNav"> <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=c2c44a51096f00fae228848d891198e0&sql=SELECT+%2A+FROM+hc_category+WHERE+ishelp+%3D+1+AND+ismenu+%3D+1+&num=4&siteid=%24siteid&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM hc_category WHERE ishelp = 1 AND ismenu = 1  LIMIT 4");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
      <?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>
      <dl>
        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=9fa20c7dedffe8b51d3d683cfefcce48&action=category&catid=%24val%5Bcatid%5D&num=6&siteid=%24siteid&order=listorder+ASC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$data = $content_tag->category(array('catid'=>$val[catid],'siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'6',));}?>
        <dt><a href="<?php echo $val['url'];?>"><?php echo $val['catname'];?></a></dt>
        <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
        <dd><a href="<?php echo $r['url'];?>"><?php echo $r['catname'];?></a></dd>
        <?php $n++;}unset($n); ?>
      </dl>
      <?php $n++;}unset($n); ?>
      <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
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
      <div class="brand"><span>服务品牌</span> <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"link\" data=\"op=link&tag_md5=ced1590002b9a1e2720d9481a92e5567&action=type_list&typeid=55&siteid=%24siteid&order=listorder+DESC&num=8&return=pic_link\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$link_tag = pc_base::load_app_class("link_tag", "link");if (method_exists($link_tag, 'type_list')) {$pic_link = $link_tag->type_list(array('typeid'=>'55','siteid'=>$siteid,'order'=>'listorder DESC','limit'=>'8',));}?>
        <?php $n=1;if(is_array($pic_link)) foreach($pic_link AS $v) { ?> <i><?php echo $v['name'];?></i> <?php $n++;}unset($n); ?>
        <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?> </div>
      <div class="site"><a href="#">申请友情链接</a><cite>|</cite><a href="#">法律声明</a><cite>|</cite><a href="#">隐私保护</a><cite>|</cite><a href="#">网站地图</a><cite></cite><b class="qy">旗下企业
        <div><?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"link\" data=\"op=link&tag_md5=5256959eae2b4e7de54b568f7dedf83c&action=type_list&typeid=56&siteid=%24siteid&order=listorder+DESC&num=10&return=pic_link\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$link_tag = pc_base::load_app_class("link_tag", "link");if (method_exists($link_tag, 'type_list')) {$pic_link = $link_tag->type_list(array('typeid'=>'56','siteid'=>$siteid,'order'=>'listorder DESC','limit'=>'10',));}?>
        <?php $n=1;if(is_array($pic_link)) foreach($pic_link AS $v) { ?><a  href="<?php echo $v['url'];?>" title="<?php echo $v['name'];?>" target="_blank"><?php echo $v['name'];?></a> <?php $n++;}unset($n); ?>
        <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?></div>
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
</body></html>