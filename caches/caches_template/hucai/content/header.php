<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title><?php if(isset($SEO['title']) && !empty($SEO['title'])) { ?><?php echo $SEO['title'];?><?php } ?><?php echo $SEO['site_title'];?></title>
<meta name="keywords" content="<?php echo $SEO['keyword'];?>">
<meta name="description" content="<?php echo $SEO['description'];?>">
<link href="<?php echo CSS_PATH;?>hucai/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<?php echo JS_PATH;?>hucai/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>hucai/slider.js"></script>
</head>
<body>
<div class="leftCon">
<div class="topbg">
  <div class="top"><a href="<?php echo siteurl($siteid);?>/" class="active">首页</a><a href="#">微信</a><a href="#">微博</a><a href="#">邮箱登陆</a></div>
</div>
<div class="head">
  <h1><a href="<?php echo siteurl($siteid);?>/"><img src="<?php echo IMG_PATH;?>hucai/bg/logo.gif" /></a></h1>
  <div class="smallIco"><a href="#">虎彩</a><em>|</em><a href="#">让印刷走进千家万户</a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/bg10.gif" /></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/bg11.gif" /></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/bg12.gif" /></a></div>
  <div class="closeNav"><span class="click"></span><i class="menu"></i></div>
  <div class="clear"></div>
</div>
<div class="serch">
  <form>
    <input type="text" class="text" value="" />
    <input type="submit" value="" class="sub" />
  </form>
</div>
<div class="navi">
  <div class="nav">
    <ul>
      <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=0abeb9912004474879e777dd9e6b6af6&action=category&catid=0&num=6&siteid=%24siteid&order=listorder+ASC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$data = $content_tag->category(array('catid'=>'0','siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'6',));}?>
      <li class="first"><a href="#"><i>我想</i></a></li>
      <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
      <li><a href="<?php echo $r['url'];?>" class="n"><?php echo $r['catname'];?></a></li>
      <?php $n++;}unset($n); ?>
      <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
    </ul>
    <form action="<?php echo APP_PATH;?>index.php" method="get" target="_blank">
      <input type="hidden" name="m" value="search"/>
      <input type="hidden" name="c" value="index"/>
      <input type="hidden" name="a" value="init"/>
      <input type="hidden" name="typeid" value="<?php echo $typeid;?>" id="typeid"/>
      <input type="hidden" name="siteid" value="<?php echo $siteid;?>" id="siteid"/>
      <input type="text" class="text" name="q" id="q"/>
      <input type="submit" value="" class="sub" />
    </form>
  </div>
  <div class="openNav">
    <div class="openNavi"></div>
    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=0abeb9912004474879e777dd9e6b6af6&action=category&catid=0&num=6&siteid=%24siteid&order=listorder+ASC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$data = $content_tag->category(array('catid'=>'0','siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'6',));}?>
    <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=2c5796102fc450f9052b61ce2eb23536&action=category&catid=%24r%5Bcatid%5D&num=25&siteid=%24siteid&order=listorder+ASC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$data = $content_tag->category(array('catid'=>$r[catid],'siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'25',));}?>
    <div class="openNavi" <?php if(!$data) { ?> style="display:none;"<?php } ?>>
      <div class="leftNav"> <?php $n=1;if(is_array($data)) foreach($data AS $r1) { ?>
        <dl>
          <dt><a href="<?php echo $r1['url'];?>"><?php echo $r1['catname'];?></a></dt>
          <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=2d0eaae8bb4c80af5495b34f38d533a8&action=category&catid=%24r1%5Bcatid%5D&num=25&siteid=%24siteid&order=listorder+ASC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$data = $content_tag->category(array('catid'=>$r1[catid],'siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'25',));}?>
          <?php $n=1;if(is_array($data)) foreach($data AS $r2) { ?>
          <dd><a href="<?php echo $r2['url'];?>"><?php echo $r2['catname'];?></a></dd>
          <?php $n++;}unset($n); ?>
          <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        </dl>
        <?php $n++;}unset($n); ?>
        <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?> </div>
      <div class="rightImg"><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/5.jpg" /></a></div>
      <div class="clear"></div>
    </div>
    <?php $n++;}unset($n); ?>
    <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?> 
    <script>

$(function(){
	$(".nav ul li").not($(".nav ul li:eq(0)")).hover(function(){
		var navNum = $(this).index();
		$(this).parents().find(".openNavi:eq("+navNum+")").stop().animate({height:$(".openNavi:eq("+navNum+")").find(".leftNav").height()+60},500);
		$(this).parents().find(".openNavi:eq("+navNum+")").siblings(".openNavi").stop().animate({height:"0"},500);
		$(".openNavi:eq("+navNum+")").hover(function(){
			$(this).stop().animate({height:"auto"});
	    },function(){
			$(this).stop().animate({height:"0"});
		})
	},function(){
		$(this).parents().find(".openNavi").stop().animate({height:0},500)
	})
	$(".click").toggle(function(){
    $(this).parents().find(".serch").stop().animate({height:"60px"},500)},
    function(){
    $(this).parents().find(".serch").stop().animate({height:"0"},500)}
  );
  $(".qy").toggle(function(){
    $(this).find("div").fadeIn()},
    function(){
    $(this).find("div").fadeOut()}
  );
})

</script> 
  </div>
</div>
