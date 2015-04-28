<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><link href="<?php echo CSS_PATH;?>video_store.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 9]><link href="<?php echo CSS_PATH;?>ielt9.css" rel="stylesheet" type="text/css" /><![endif]-->
<script type="text/javascript" src="<?php echo JS_PATH;?>/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>video/swfobject.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>video/swfobject2.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
var js4swf = {
    onInit: function(list){
        // 初始化时调用, 若 list.length > 0 代表有可续传文件
        // [{file}, {file}]
		if(list.length > 0) {
		    var length = list.length-1;
			$('#list_name').html("文件：《"+list[length].name+"》未上传完成，如需续传，请重新选择该文件");
		}
        this.showMessage('init', list);
    },
    onSelect: function(files){
        // 选中文件后调用, 返回文件列表
        // [{file}, {file}]
        this.showMessage('select', files);
    },
    onSid: function(evt){
        // 获得 sid 后返回, 更新 sid 用 (key, sid, name, type, size)
		if ($('#title').val()==''){
			$('#title').val(evt.name);
		}
		var ku6vid = evt.vid;
		$.get('index.php', {m:'video', c:'vid', a:'check', vid:ku6vid});
        this.showMessage('sid', evt);
    },
    onStart: function(){
        // 开始上传 (选择文件后自动开始)
        this.showMessage('start');
    },
    onCancel: function(){
        // 上传取消事件

        this.showMessage('cancel');
    },
    onProgress: function(evt){
        // 上传进度事件 (bytesLoaded, bytesTotal, speed) m=1 时没有这事件
        this.showMessage('progress', evt);
    },
    onComplete: function(evt){
        // 上传完成事件 (包含文件信息和完成后返回数据(data))
		$('#vid').val(evt.vid);
		var title = $('#title').val();
		var description = $('#description').val();
		var vid = $('#vid').val();
		$.get('index.php', {m:'video', c:'video_for_ck', a:'add_f_ckeditor', title:title, userupload:'1', description:description, vid:vid}, function(data){
			if (data==1) {
				alert('操作失败，您没有选择视频或者视频正在上传中...');
				return false;
			} else if(data==2) {
				alert('视频标题不能为空！');
				return false;
			} else if(data==3) {
				alert('视频上传出现错误，请重试！');
				return false;
			} else {
				$('#video_url').val(data);
			}
		});
        this.showMessage('complete', evt);
        
    },
    onWarn: function(evt){
        // 报错事件 (key, message)
        //this.showMessage('warn', evt);
		alert(evt.msg);
    },
    showMessage: function(){
        console.log(arguments);
    }
};
function checkform() {
	if($('#vid').val()=='0') {
		alert('您没有选择视频，或者视频正在上传中...');
		return false;
	}
	if($('#title').val()=='') {
		alert('请填写标题');
		$('#title').focus();
		return false;
	}
}
//-->
</SCRIPT>
<script type="text/javascript">
var flashvars = { m: "1", u: "<?php echo $flash_info['userid'];?>", ctime: "<?php echo $flash_info['passport_ctime'];?>", sig:"<?php echo $flash_info['passport_sig'];?>", c: "vms", t: "1", n: "js4swf", k: "190000" ,ms:"39",s: "8000000"};
var params = { allowScriptAccess: "always" , wmode: "transparent"};
var attributes = { };
swfobject.embedSWF("<?php echo $flash_info['flashurl'];?>", "ku6uploader", "450", "45", "10.0.0", null, flashvars, params, attributes);
</script>
<input type="hidden" name="video_url" id="video_url" value="">
<div class="m_box">
	<div class="clr h_box">
		<ul class="clr">
			<li><a href="#" title="#ct2" >上传视频</a></li>
			<li><a href="#" title="#ct1" class="ac">从视频库选择</a></li>
		</ul>
	</div>
    <div class="clr ct" id="ct1">
    	<div class="l">
        	<div class="r1">
           	  <form action="" method="get">
                	<label style="font-size: 12px;" title="本站上传视频">原创<input type="checkbox" id="userupload" name="userupload" title="本站上传视频"></label> <input name="title" id="title_s" type="text" class="s_ipt"/><input type="button" id="search" value="搜索" class="s_btn" onclick="get_videoes(1);"/>
                </form>
          </div>
        	<div class="r2">
            	<ul class="clr col3" id="ulic">
				<?php if(!empty($infos)) { ?>
				<?php $n=1;if(is_array($infos)) foreach($infos AS $info) { ?>
                    <li><div class="w9"><a href="javascript:void(0);" title="<?php echo $info['title'];?>" data-vid="<?php echo $info['vid'];?>" onclick="a_click(this);"><span></span><img src="<?php if($info['picpath']) { ?><?php echo $info['picpath'];?><?php } else { ?><?php echo IMG_PATH;?>admin_img/bfqicon1.jpg<?php } ?>" width="90" height="51" /></a><p><?php echo str_cut($info['title'], 18);?></p></div></li>
				<?php $n++;}unset($n); ?>
				<?php } else { ?>
					&nbsp;&nbsp;&nbsp;&nbsp;视频库中没有您的视频，请先上传视频！
				<?php } ?>
                </ul>
            </div>
        	<div class="r3">
            	<div class="ipages">
                	<?php echo $pages;?>
                </div>
            </div>
        </div>
    	<div class="r" id="video_view"><img src="<?php echo IMG_PATH;?>spyl.jpg" width="300" height="225" /></div>
    </div>
  <div class="clr ct ctc2" id="ct2">
    	<div class="r1">
		<form action="index.php?m=video&c=video_for_ck&a=add_f_ckeditor" onsubmit="return checkform()" id="myvideo" method="post">
			<input type="hidden" name="userupload" value="1">
        	<div class="content pad-6">
  <table width="100%" cellspacing="0" class="table_form frm_tb">
    <tbody>
      <tr>
        <th width="80" class="tbb"> 视频上传 </th>
        <td class="tbb">
          <div id="ku6uploader"></div><BR><span id="list_name" style="color:red"></span></td>
      </tr>
      <tr>
        <th width="80">标题 </th>
        <td><input type="text" name="title" size="40" value="" id="title"><span id="balance"><span></td>
      </tr>
      <tr>
        <th width="80"> 摘要 </th>
        <td><textarea name="description" id="description" style="width:98%;height:46px;"></textarea><input type="hidden" name="vid" id="vid" value="">
          </td>
      </tr>
    </tbody>
  </table>
</div>
</form>
        </div>
  </div>
</div>
<?php $player_url = pc_base::load_config('ku6server', 'player_url');$video_setting = getcache('video', 'video');?>
<script type="text/javascript">
	
function get_videoes(page) {
			var title = $('#title_s').val();
			var userupload = 0;
			if ($('#userupload').attr('checked')=='checked') {
				userupload = 1;
			}
			$.get('index.php', {m:'video', c:'video_for_ck', a:'search', title:title, page:page, userupload:userupload}, function(data){
				var obj = eval('(' + data + ')');
				$('.ipages').html(obj.pages);
				$('#ulic').html(obj.html);
			});
		}
	
var CKEDITOR = window.parent.CKEDITOR;

var okListener = function(event){
	var video_url = document.getElementById("video_url").value;
	if (video_url=='') {
	} else {
		video_url = $('#video_view').html();
		this._.editor.insertHtml(video_url);
		CKEDITOR.dialog.getCurrent().removeListener("ok", okListener);
	}
};
CKEDITOR.dialog.getCurrent().on("ok", okListener);

function set_video(vname) {
	document.getElementById("video_url").value = vname;
}
$.ajaxSetup({ 
    async : false 
}); 
function a_click(obj) {
	var vid = $(obj).attr('data-vid');
	var vid_msg = '';
	var d = '';
	$.get('index.php', {m:'video', c:'video_for_ck', a:'check_vid', vid:vid}, function(data){
		if (data==1) {
			alert('视频地址错误！');
			vid_msg = false;
		} else {
			d = data;
			vid_msg = true;	
		}
	});
	if (vid_msg) {
		$("#ulic div.w9 a").removeClass("ac");
		$(obj).addClass("ac");
		$('#video_url').val(vid);
		$('#video_view').html(d);
	}
}
$('#ct2').hide();
$('.h_box ul a').click(function(e){
	$('.h_box ul li a').removeClass('ac');
	$(this).addClass('ac');
	$('.ct').hide();
	$($(this).attr("title")).show();
});
</script>
