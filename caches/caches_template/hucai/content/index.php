<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<!--main-->
<div id="home_slider" class="flexslider block_home_slider">
    <div class="flex-viewport" id="flex_viewport">
    	<script language="javascript" src="<?php echo APP_PATH;?>index.php?m=poster&c=index&a=show_poster&id=11"></script>
    </div>
  </div>
  <div class="p1">
    <div class="indexNews"> <span>新闻</span>
      <div class="newsDemo">
      <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=9dfe6cdb0280164f7be60f54edad2518&action=position&posid=5&order=id&num=10\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'position')) {$data = $content_tag->position(array('posid'=>'5','order'=>'id','limit'=>'10',));}?>
        <ul>
        	<?php $n=1; if(is_array($data)) foreach($data AS $k => $v) { ?>
          <li><a href="<?php echo $v['url'];?>"><?php echo $v['title'];?></a></li>
           <?php $n++;}unset($n); ?>
        </ul>
        <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
      </div>
      <div class="icon"> <a class="up"></a> <a class="dowm"></a> </div>
      <script type="text/javascript">

var d = 0;
var e = $(".newsDemo ul li").size();

function newsDemo(){
	if(d<e-1){
		d++;
	}else{
		d=0;
	}
	$(".newsDemo ul").stop().animate({top:-60*d},1000);
}

var newsD = setInterval(newsDemo,5000);

$("a.dowm").click(function(){
	newsDemo();
})

$("a.up").click(function(){
	if(d>0){
		d--;
	}else{
		d=0;
	}
	$(".newsDemo ul").stop().animate({top:-60*d},1000);
})

$(".indexNews").hover(function(){
	clearInterval(newsD)
},function(){
	newsD = setInterval(newsDemo,5000);
})

</script> 
    </div>
    <div class="p2">
    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=e293260bb058dbf36da3301de91f1839&action=position&posid=1&order=listorder+DESC&num=3\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'position')) {$data = $content_tag->position(array('posid'=>'1','order'=>'listorder DESC','limit'=>'3',));}?>
      <ul>
      <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
        <li>
          <div class="opacity"><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png2.png"></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png3.png"></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png4s.png"/></a></div>
          <a href="<?php echo $r['url'];?>" title="<?php echo $r['title'];?>"><img src="<?php echo thumb($r[thumb],370,280);?>" class="opacity" width="370" height="280" />
          <p><span><?php echo str_cut($r[title],36,'');?></span><b><?php echo str_cut($r[description],112);?><i>查看更多</i></b></p>
          </a></li>
        <?php $n++;}unset($n); ?>  
      </ul>
      <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
      <div class="clear"></div>
    </div>
  </div>
  <div class="mv">
    <video poster="<?php echo IMG_PATH;?>hucai/bg/4.jpg" preload="none" controls="" id="myVideo" width="100%">
      <source type="video/mp4" src="http://media.w3.org/2010/05/sintel/trailer.mp4" id="mp4"></source>
      <source type="video/webm" src="http://media.w3.org/2010/05/sintel/trailer.webm" id="webm"></source>
      <source type="video/ogg" src="http://media.w3.org/2010/05/sintel/trailer.ogv" id="ogv"></source>
      <div style="height:342px;line-height:342px;text-align:center;font-size:18px;">您的浏览器不支持HTML5视频</div>
    </video>
    
    <!--<script>
var myVideo = document.getElementById('myVideo')//获取video元素
    ,tol = 0 //总时长
;
myVideo.addEventListener("loadedmetadata", function(){
    tol = myVideo.duration;//获取总时长
});

//播放
function play(){ 
    myVideo.play();
}

//暂停
function pause(){ 
    myVideo.pause();
}

//播放时间点更新时
myVideo.addEventListener("timeupdate", function(){
    var currentTime = myVideo.currentTime;//获取当前播放时间
    console.log(currentTime);//在调试器中打印
});

//设置播放点
function playBySeconds(num){ 
    myVideo.currentTime = num;
}

//音量改变时
myVideo.addEventListener("volumechange", function(){
    var volume = myVideo.volume;//获取当前音量
    console.log(volume);//在调试器中打印
});

//设置音量
function setVol(num){ 
    myVideo.volume = num;
}
</script>--> 
    
  </div>
  <div class="p2">
    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=7a7a0e753182bcf4d42b038435e627ed&action=position&posid=2&order=listorder+DESC&num=3\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'position')) {$data = $content_tag->position(array('posid'=>'2','order'=>'listorder DESC','limit'=>'3',));}?>
      <ul>
      <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
        <li>
          <div class="opacity"><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png2.png"></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png3.png"></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png4s.png"/></a></div>
          <a href="<?php echo $r['url'];?>" title="<?php echo $r['title'];?>"><img src="<?php echo thumb($r[thumb],370,280);?>" class="opacity" width="370" height="280" />
          <p><span><?php echo str_cut($r[title],36,'');?></span><b><?php echo str_cut($r[description],112);?><i>查看更多</i></b></p>
          </a></li>
        <?php $n++;}unset($n); ?>  
      </ul>
      <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
    <div class="clear"></div>
  </div>
  <div class="p3">
    <div class="p4">
      <ul>
        <li>
        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=2f8e628a51fed984bb0fc86e3bafd8b4&action=position&posid=9&order=listorder+DESC&num=1\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'position')) {$data = $content_tag->position(array('posid'=>'9','order'=>'listorder DESC','limit'=>'1',));}?>
          <div class="a1"><b><i>虎彩介绍</i></b>
          <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
            <div class="a2">
              <div class="a3"><img src="<?php echo thumb($r[thumb],320,120);?>" /><span><?php echo str_cut($r[description],230);?></span></div>
              <a href="<?php echo $r['url'];?>" class="more"  title="<?php echo $r['title'];?>">查看更多</a></div><?php $n++;}unset($n); ?>
          </div>
          <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        </li>
        <li>
          <div class="a1"><b><i>新闻中心</i></b>
            <div class="a2">
            <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=7d25d783e3ab7b8d0090a04c3b8faeae&action=position&posid=1&order=listorder+DESC&num=5\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'position')) {$data = $content_tag->position(array('posid'=>'1','order'=>'listorder DESC','limit'=>'5',));}?>
              <dl class="newsCenter">
              <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
                <dd> <a href="<?php echo $r['url'];?>" title="<?php echo $r['title'];?>"><i><?php echo str_cut($r[title],36,'');?></i>
                  <div class="innerNews"><em><?php echo date('Y-m-d',$r[inputtime]);?></em>
                    <p><?php echo str_cut($r[description],112);?></p>
                  </div>
                  </a></dd>
               <?php $n++;}unset($n); ?>
              </dl>
              <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
              <a href="#" class="more">查看更多</a></div>
          </div>
        </li>
        <li>
          <div class="a1"><b><i>服务支持</i></b>
            <div class="a2">
              <dl class="icon1">
                <dd><a href="#"><span><img src="<?php echo IMG_PATH;?>hucai/bg/bg14.gif" /></span><i>下载中心 </i></a></dd>
                <dd><a href="#"><span><img src="<?php echo IMG_PATH;?>hucai/bg/bg15.gif" /></span><i>影像连锁门店查询 </i></a></dd>
                <dd><a href="#"><span><img src="<?php echo IMG_PATH;?>hucai/bg/bg16.gif" /></span><i>意见反馈</i></a></dd>
                <dd><a href="#"><span><img src="<?php echo IMG_PATH;?>hucai/bg/bg17.gif" /></span><i>联系我们 </i></a></dd>
                <div class="clear"></div>
              </dl>
              <a href="#" class="more">查看更多</a></div>
          </div>
        </li>
      </ul>
      <script>

$(function(){
	$(".innerNews").not($(".innerNews").eq(0)).hide();
	$(".p4 ul li dl dd a").hover(function(){
		$(this).find(".innerNews").show();
		$(this).parent().siblings().find(".innerNews").hide();
	})
})

</script>
      <div class="clear"></div>
    </div>
  </div>
<?php include template("content","footer"); ?>