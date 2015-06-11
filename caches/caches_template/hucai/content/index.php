<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<!--main-->
<div id="home_slider" class="flexslider block_home_slider">
    <script language="javascript" src="<?php echo APP_PATH;?>index.php?m=poster&c=index&a=show_poster&id=11"></script>
  </div>
  <div class="p1">
    <div class="indexNews"> <span>新闻</span>
      <div class="newsDemo">
        <ul>
          <li><a href="#">虎彩引爆按需出版市场，致力将数字印刷做到极致，引爆市场结出累累硕果。</a></li>
          <li><a href="#">虎彩引爆按需出版市场，致力将数字印刷做到极致，引爆市场结出累累硕果。</a></li>
          <li><a href="#">虎彩引爆按需出版市场，致力将数字印刷做到极致，引爆市场结出累累硕果。</a></li>
        </ul>
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
      <ul>
        <li>
          <div class="opacity"><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png2.png"></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png3.png"></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png4s.png"/></a></div>
          <a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/8.jpg" class="opacity" />
          <p><span>互联网思维给虎彩带来了什么</span><b>虎彩印艺股份有限公司总裁陈成稳先生在互联网思维集训上的总结发言...<i>查看更多</i></b></p>
          </a></li>
        <li>
          <div class="opacity"><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png2.png"></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png3.png"></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png4s.png"/></a></div>
          <a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/6.jpg" class="opacity" />
          <p><span>互联网思维给虎彩带来了什么</span><b>虎彩印艺股份有限公司总裁陈成稳先生在互联网思维集训上的总结发言...<i>查看更多</i></b></p>
          </a></li>
        <li>
          <div class="opacity"><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png2.png"></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png3.png"></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png4s.png"/></a></div>
          <a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/7.jpg" class="opacity" />
          <p><span>互联网思维给虎彩带来了什么</span><b>虎彩印艺股份有限公司总裁陈成稳先生在互联网思维集训上的总结发言...<i>查看更多</i></b></p>
          </a></li>
      </ul>
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
    <ul>
      <li>
        <div class="opacity"><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png2.png"></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png3.png"></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png4s.png"/></a></div>
        <a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/8.jpg" class="opacity" />
        <p><span>互联网思维给虎彩带来了什么</span><b>虎彩印艺股份有限公司总裁陈成稳先生在互联网思维集训上的总结发言...<i>查看更多</i></b></p>
        </a></li>
      <li>
        <div class="opacity"><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png2.png"></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png3.png"></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png4s.png"/></a></div>
        <a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/6.jpg" class="opacity" />
        <p><span>互联网思维给虎彩带来了什么</span><b>虎彩印艺股份有限公司总裁陈成稳先生在互联网思维集训上的总结发言...<i>查看更多</i></b></p>
        </a></li>
      <li>
        <div class="opacity"><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png2.png"></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png3.png"></a><a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/png4s.png"/></a></div>
        <a href="#"><img src="<?php echo IMG_PATH;?>hucai/bg/7.jpg" class="opacity" />
        <p><span>互联网思维给虎彩带来了什么</span><b>虎彩印艺股份有限公司总裁陈成稳先生在互联网思维集训上的总结发言...<i>查看更多</i></b></p>
        </a></li>
    </ul>
    <div class="clear"></div>
  </div>
  <div class="p3">
    <div class="p4">
      <ul>
        <li>
          <div class="a1"><b><i>虎彩介绍</i></b>
            <div class="a2">
              <div class="a3"><img src="<?php echo IMG_PATH;?>hucai/bg/3.jpg" /><span>虎彩印艺股份有限公司成立于1988年，是一家以包装产品的开发、设计、印刷为核心的高新技术企业，中国最优秀的高端奢侈品纸包装供应商，名列中国印刷百强第九名。</span></div>
              <a href="#" class="more">查看更多</a></div>
          </div>
        </li>
        <li>
          <div class="a1"><b><i>新闻中心</i></b>
            <div class="a2">
              <dl class="newsCenter">
                <dd><a href="#"><i>冰超干原浆 新妆领鲜上市</i>
                  <div class="innerNews"><em>2015-2-15</em>
                    <p>虎彩集团新春团拜会在虎门龙泉国际大酒店如约而至。从子公司相聚而来的厂长们、东莞区虎彩人...</p>
                  </div>
                  </a></dd>
                <dd><a href="#"><i>冰超干原浆 新妆领鲜上市</i>
                  <div class="innerNews"><em>2015-2-15</em>
                    <p>虎彩集团新春团拜会在虎门龙泉国际大酒店如约而至。从子公司相聚而来的厂长们、东莞区虎彩人...</p>
                  </div>
                  </a></dd>
                <dd><a href="#"><i>冰超干原浆 新妆领鲜上市</i>
                  <div class="innerNews"><em>2015-2-15</em>
                    <p>虎彩集团新春团拜会在虎门龙泉国际大酒店如约而至。从子公司相聚而来的厂长们、东莞区虎彩人...</p>
                  </div>
                  </a></dd>
                <dd><a href="#"><i>冰超干原浆 新妆领鲜上市</i>
                  <div class="innerNews"><em>2015-2-15</em>
                    <p>虎彩集团新春团拜会在虎门龙泉国际大酒店如约而至。从子公司相聚而来的厂长们、东莞区虎彩人...</p>
                  </div>
                  </a></dd>
                <dd><a href="#"><i>冰超干原浆 新妆领鲜上市</i>
                  <div class="innerNews"><em>2015-2-15</em>
                    <p>虎彩集团新春团拜会在虎门龙泉国际大酒店如约而至。从子公司相聚而来的厂长们、东莞区虎彩人...</p>
                  </div>
                  </a></dd>
              </dl>
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