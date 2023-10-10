/**
 * 
 */
 $(function(){
 	$("#myimg").attr("src","../image/02.png");
 	
 	$("#myimg").hover(function(){
 		$(this).attr("src","../image/11.png");
 	},function(){
 		$(this).attr("src","../image/02.png");
 	});
 });