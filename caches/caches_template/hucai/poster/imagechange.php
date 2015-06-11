<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?>$(function () {
	
	$('#home_slider').flexslider({
		animation : 'slide',
		controlNav : true,
		directionNav : true,
		animationLoop : true,
		slideshow : true,
		slideshowSpeed:10000,
		useCSS : false
	});
	
});

var str = "";
str += "<ul class='slides'>";
<?php $n=1; if(is_array($pinfo)) foreach($pinfo AS $k => $p) { ?>
str += "<li><a href='<?php echo APP_PATH;?>index.php?m=poster&c=index&a=poster_click&siteid=<?php echo $siteid;?>&id=<?php echo $p['id'];?>'><img src='<?php echo $p['setting']['1']['imageurl'];?>' /><img src='<?php echo IMG_PATH;?>hucai/bg/10.jpg' class='other' /></a></li>"; 
<?php $n++;}unset($n); ?>     
str += "</ul>";
$('#flex_viewport').html(str);
