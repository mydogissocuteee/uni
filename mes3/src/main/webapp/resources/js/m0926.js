/**
 * 
 */
/** 사용자 관리 */
function show_user(){
	$.ajax({
	  		url:"userSelect.do",
	  		type:"get",
	  		async: false,
	  		success:ajaxHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
}



function ajaxHtml(data){
	var view="";
	var view2="";
         view2+='<thead> <tr> <th></th> <th>번호</th> <th>사용자 명</th> </tr> </thead>'; 
         view2+='<tbody>';  
	  $.each(data,function(index, obj){	//반복문
	     view+='<div class="list_bundle_data" name="'+obj.num+'" id="list_bundle_data">';
         view+='<div class="list_d_1">';
         view+='<input onclick="event.stopPropagation()" type="checkbox" id="list_bundle_data_checkbox01" name="userDeleteNum" value="'+obj.num+'"';
         view+='<label for="list_bundle_data_checkbox01"></label>';
         view+='</div>'; 
         view+='<div class="list_d_2">'+obj.userid+'</div>';
         view+='<div class="list_d_3">'+obj.username+'</div>';
         view+='<div class="list_d_4">'+obj.mainProcess+'</div>';
         view+='<div class="list_d_5">'+obj.userRight+'</div>';
         view+='<div class="list_d_6">'+obj.department+'</div>';
         view+='<div class="list_d_7">'+obj.contact+'</div>';
         view+='<div class="list_d_8">'+obj.email+'</div>';
         view+='</div>'; 

         view2+='<tr>';
         view2+='<td>'+index+'</td>';
         view2+='<td>'+obj.num+'</td>';
         view2+='<td>'+obj.username+'</td>';
         view2+='</tr>';
	  })
  view2+='</tbody>';
  $( '#list_Data' ).html(view);
  $( '#userSearch_content_tb' ).html(view2);
}

/** 사용자 관리 끝 */





 function userInsert() {
	/** $('.user_input_modal_window').fadeIn();
	*/
	var MemberVO = {
			company : "fourever",
			userid : $("#u_input_id").val(),
			username : $("#u_input_name").val(),
			userpw : $("#u_input_pw").val(),
			mainProcess : $("#m1_user_input_table_04_select_txt").text(),
			userRight : $("#m1_user_input_table_05_select_txt").text(),
			department : $("#m1_user_input_table_06_select_txt").text(),
			contact : $("#u_input_phonenum").val(),
			email : $("#u_input_email").val()
	};
	
		$.ajax({
			url : "userInsert.do",
			type : "GET",
			async:false,
			data : MemberVO,
			// dataType : "json",
			success : function(){
				console.log("success");},
			error : function(request, status, error){
			    console.log("회원가입 error");
				}
		});
		
	  	show_user();
	}
	
	/** 사용자입력 끝 */


 function userDelete() {
	var len = $("input[name='userDeleteNum']:checked").length;
	console.log($("input[name='userDeleteNum']:checked").parents('#list_bundle_data'));
	if(len == 1){
		var value = $("input[name='userDeleteNum']:checked").val();
		$.ajax({
			url : "userDelete.do",
			type : "GET",
			async:false,
			data : {"num":value},
			// dataType : "json",
			success : function(){
					$("input[name='userDeleteNum']:checked").parents('#list_bundle_data').remove();
				console.log(" 삭제 success");},
			error : function(request, status, error){
			    console.log("삭제 error");}
	});
	}else { //개수를 체크하고 2개부터는 each함수를 통해 각각 가져온다.
	    $("input[name='userDeleteNum']:checked").each(function(e){
	        var value = $(this).val();
			console.log(value);
			$.ajax({
				url : "userDelete.do",
				type : "GET",
				async:false,
				data : {"num":value},
				// dataType : "json",
				success : function(){
						$("input[name='userDeleteNum']:checked").parents('#list_bundle_data').remove();
					console.log(" 삭제 success");},
				error : function(request, status, error){
				    console.log("삭제 error");}
			});

	    })
	}
}
		
		
function show_user_group(){
	$.ajax({
  		url:"userGroupSelect.do",
  		type:"get",
  		async: false,
		data:{'company':'fourever'},
  		success:userGroupHtml,
  		error:function(data){ 
  			let str = JSON.stringify(data);
  			console.log(str);
  		}
  	});
}

function userGroupInsert(){
	$.ajax({
  		url:"userGroupInsert.do",
  		type:"get",
  		async: false,
		data:{'ug_name':$('#group_popup_search_input').val(),
			company : 'fourever'},
  		success:userGroupHtml,
  		error:function(data){ 
  			let str = JSON.stringify(data);
  			console.log(str);
  		}
  	});
	show_user_group();
	
	$.ajax({
  		url:"userGroupRightInsert.do",
  		type:"get",
  		async: false,
		data:{'group_name':$('#group_popup_search_input').val(),
			company : 'fourever',
			ugr_use : 0
			},
  		success:console.log("권한까지 들어감"),
  		error:function(data){ 
  			let str = JSON.stringify(data);
  			console.log(str);
  		}
  	});

}

function userGroupHtml(data){
	var view="";
	var view2="";
  $.each(data,function(index, obj){	//반복문
     view+='<div class="user_author" id="user_author">';
     view+='<div class="author_num">';
	 view+='<input autocomplete="off" type="checkbox" id="author_num_checkbox" name="userGroupNum" value="'+obj.ug_num+'">';
	 view+='<label for="author_num_checkbox">';
	 view+='</label>';
	 view+='</div>';
	 view+='<div class="author_name">'+obj.ug_name+'</div>';
	 view+='</div>'; 
	view2+='<li class="option">'+obj.ug_name+'</li>';
})
	$( '#user_group_body' ).html(view);
	$( '#m1_user_input_table_05_select_txt_list' ).html(view2);
}
		
		/** 설정관리 추가 모달 버튼 누름 */
 function m2_r_bot_bottom_modal_bot_bt_click(){
	console.log("설정관리 추가");
	
}



	/** 설정 관리 js */
function show_clsfc(){

}






	/** 공정 관리 */
function show_process(){
	$.ajax({
	  		url:"processSelect.do",
	  		type:"get",
	  		async: false,
	  		success:processHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
}

function processHtml(data){
	var view="";
	var view2="";
     	view+='<table class="processAdmin_tb_02">';
     	view+='<thead>';
     	view+='<tr>';
     	view+='<th></th>';
     	view+='<th>공정번호</th>';
     	view+='<th>공정명</th>';
     	view+='<th>공정구분</th>';
     	view+='</tr>';
		view+='</thead>';
		view+='<tbody>';
  	$.each(data,function(index, obj){	//반복문
		view+='<tr>';
		view+='<td><input autocomplete="off" type="checkbox" id="processAdmin_tb_02_checkbox" name="processNum" value="'+obj.pr_seq_num+'">';
		view+='<label for="processAdmin_tb_02_checkbox"></label></td>';
		view+='<td>'+obj.pr_num+'</td>';
		view+='<td>'+obj.pr_name+'</td>';
		view+='<td>'+obj.pr_sortation+'</td>';
		view+='</tr>';
		view2+='<tr>';
		view2+='<td>'+obj.pr_num+'</td>';
		view2+='<td>'+obj.pr_name+'</td>';
		view2+='</tr>';
})
		view+='</tbody>';
		view+='</table>';
  $( '.processAdmin_tb_02' ).html(view);
  $( '#routing_modal_body_bottom_l_table_tbody' ).html(view2);
}


function processInsert(){
	$('.process_input_modal_window').fadeIn();
	console.log("공정입력");
var processVO = {
			company : "fourever",
			pr_num : $("#processAdmin_tb_01_num").val(),
			pr_name : $("#processAdmin_tb_01_name").val(),
			pr_sortation : $("#mainbody_05_02_left_bott_tb_table_txt").text(),
			pr_facilities : $("#processAdmin_tb_01_system").text(),
			pr_reviewer : $("#processAdmin_tb_01_wrapp_01_01").text(),
			pr_approver : $("#processAdmin_tb_01_wrapp_02_01").text(),
			pr_memo : $("#processAdmin_tb_01_memo").val()
	};
	$.ajax({
			url : "processInsert.do",
			type : "GET",
			async:false,
			data : processVO,
			// dataType : "json",
			success : function(){
				console.log("공정 입력 success");},
			error : function(request, status, error){
			    console.log("공정 입력 error");}
		});
		
	  	show_process();
}



 function processDelete() {
	var len = $("input[name='processNum']:checked").length;
				console.log(len);
	if(len == 1){
		var value = $("input[name='processNum']:checked").val();
		var processVO = {"pr_seq_num":value,
				company:'fourever'}
		$.ajax({
			url : "processDelete.do",
			type : "GET",
			async:false,
			data : processVO,
			success : function(){
				$("input[name='processNum']:checked").parent().parent().remove();
				console.log(" 삭제 success");},
			error : function(request, status, error){
			    console.log("삭제 error");}
		});
		}else { //개수를 체크하고 2개부터는 each함수를 통해 각각 가져온다.
		    $("input[name='processNum']:checked").each(function(e){
	        var value = $(this).val();
			var processVO = {"pr_seq_num":value,
			company:'fourever'};
			console.log(value);
			$.ajax({
				url : "processDelete.do",
				type : "GET",
				async:false,
				data : processVO,
				success : function(){
					console.log(" 삭제 success");},
				error : function(request, status, error){
				    console.log("삭제 error");}
				});
		
		    })
		}	
	}



/** 거래처 관리 */
function show_client(){
	$.ajax({
	  		url:"clientSelect.do",
	  		type:"get",
	  		async: false,
	  		success:clientHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
}


function clientHtml(data){
	var view="";
     	view+='<table class="m06_cus_list_table">';
     	view+='<thead class="m06_cus_list_thead">';
     	view+='<tr>';
     	view+='<td></td>';
     	view+='<td>거래처명</td>';
     	view+='<td>거래처번호</td>';
     	view+='<td>사업자번호</td>';
     	view+='<td>대표자명</td>';
     	view+='</tr>';
		view+='</thead>';
		view+='<tbody>';
	var view2="";
	var clientindex=1;
  	$.each(data,function(index, obj){	//반복문
		view+='<tr>';
		view+='<td><input autocomplete="off" type="checkbox" id="processAdmin_tb_02_checkbox" name="clientNum" value="'+obj.ct_num+'">';
		view+='<label for="processAdmin_tb_02_checkbox"></label></td>';
		view+='<td>'+obj.ct_mutual+'</td>';
		view+='<td>'+obj.ct_contact+'</td>';
		view+='<td>'+obj.ct_businessNumber+'</td>';
		view+='<td>'+obj.ct_repName+'</td>';
		view+='</tr>';
		
		view2+='<tr>';
		view2+='<td class="goods_customer_num_Search_td_00">'+clientindex+'</td>';
		view2+='<td class="goods_customer_num_Search_td_00">'+obj.ct_num+'</td>';
		view2+='<td class="goods_customer_num_Search_td_00">'+obj.ct_mutual+'</td>';
		view2+='<td class="goods_customer_num_Search_td_00">'+obj.ct_sortation+'</td>';
		view2+='</tr>';
		
		clientindex=clientindex+1;
})
		view+='</tbody>';
		view+='</table>';
  $( '.m06_cus_list_table' ).html(view);
  $( '#customer_tbody' ).html(view2);
  $( '#goods_customer_num_tbody' ).html(view2);
  $( '#m51_Order_customer_num_tbody' ).html(view2);
}


function clientInsert(){
	console.log("durls")
var clientVO = {
			company : "fourever",
			ct_mutual : $("#m06_l_mutual_input").val(),
			ct_sortation : $("input[name=account]:checked").val(),
			ct_repName : $("#m06_l_name_input").val(),
			ct_businessNumber : $("#m06_l_bsnum_input").val(),
			ct_chrgName : $("#m06_l_person_name_input").val(),
			ct_postalCode : $("#m06_l_post_input").val(),
			ct_address : $("#m06_l_address_input").val(),
			ct_condition : $("#m06_l_bs01_input").val(),
			ct_industry : $("#m06_l_bs02_input").val(),
			ct_contact : $("#m06_l_phone_input").val(),
			ct_fax : $("#m06_l_fax_input").val(),
			ct_email : $("#m06_l_email_input").val()
	};
	$.ajax({
			url : "clientInsert.do",
			type : "GET",
			async:false,
			data : clientVO,
			// dataType : "json",
			success : function(){
				console.log("거래처 입력 success");},
			error : function(request, status, error){
			    console.log("거래처 입력 error");}
		});
		
	  	show_client();
}

 function clientDelete() {
	var len = $("input[name='clientNum']:checked").length;
	var checkArr = [];
	if(len = 1){
		var value = $("input[name='clientNum']:checked").val();
		$.ajax({
			url : "clientDelete.do",
			type : "GET",
			async:false,
			data : {"num":value},
			// dataType : "json",
			success : function(){
				console.log(" 삭제 success");},
			error : function(request, status, error){
			    console.log("삭제 error");}
		});
		}
	if(len > 1){ //개수를 체크하고 2개부터는 each함수를 통해 각각 가져온다.
	    $("input[name='clientNum']:checked").each(function(e){
	        var value = $(this).val();
	        checkArr.push(value); 
			console.log(value);
		$.ajax({
			url : "clientDelete.do",
			type : "GET",
			async:false,
			data : {"num":value},
			// dataType : "json",
			success : function(){
				console.log(" 삭제 success");},
			error : function(request, status, error){
			    console.log("삭제 error");}
			});

	    })
	console.log(checkArr);
	}

	show_client();
		
		}

	/** 제품 관리 */
	function show_goods(){
	$.ajax({
	  		url:"goodsSelect.do",
	  		type:"get",
	  		async: false,
	  		data: {company:'fourever'},
	  		success:goodsHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
	}
	
	function goodsHtml(data){
		var view="";
		var view2="";
		var view3="";
		var view4="";
		 view+='<thead><tr>';
	     view+='<td></td>';
	     view+='<td>품목번호</td>';
	     view+='<td>품목명</td>';
	     view+='<td>제품군</td>';
	     view+='<td>라우팅</td>';
	     view+='</tr>';
	     view+='</thead>';
	     view+='<tbody>';
	  $.each(data,function(index, obj){	//반복문
	     view+='<td class="product_admin_tb_line_01"><input autocomplete="off" type="checkbox" name="goodsNum" value="'+obj.gs_seq_num+'" class="productAdmin_check"></td>';
	     view+='<td class="product_admin_tb_line">'+obj.gs_num+'</td>';
	     view+='<td class="product_admin_tb_line">'+obj.gs_name+'</td>';
	     view+='<td class="product_admin_tb_line">'+obj.gs_family+'</td>';
	     view+='<td class="product_admin_tb_line">'+obj.gs_routing+'</td>';
	     view+='</tr>';
	     view2+='<tr>';
		 view2+='<td class="product_admin_tb_line">'+obj.gs_num+'</td>';
	     view2+='<td class="product_admin_tb_line">'+obj.gs_name+'</td>';
	     view2+='<td class="product_admin_tb_line">'+obj.gs_family+'</td>';
	     view2+='<td class="product_admin_tb_line">'+obj.gs_routing+'</td>';
	     view2+='<td>';
	     view2+='<div class="m07_bom_list_tbody_btn_01_01">';
	     view2+='<button class="m07_bom_list_tbody_btn_01_02">';
	     view2+='<img src="./resources/img/BOM/휴지통.png"> </button> </div>';
	     view2+='</td>';
	     view2+='</tr>';
		 view3+='<tr>';
		 view3+='<td><input autocomplete="off" type="checkbox" name="goodsOrderNum" value="'+obj.gs_seq_num+'"></td>';
	     view3+='<td class="product_admin_tb_line">'+obj.gs_name+'</td>';
	     view3+='<td class="product_admin_tb_line">'+obj.gs_unit+'</td>';
	     view3+='<td class="product_admin_tb_line">'+obj.gs_standard+'</td>';
	     view3+='<td class="product_admin_tb_line">'+obj.gs_price+'</td>';
	     view3+='<td><input type="text" autocomplete="off" class="go_goods_count" id="num1_'+obj.gs_seq_num+'" name="go_goods_count"></td>'; //주문수량
	     view3+='<td><input type="text" autocomplete="off" class="go_goods_discount" id="num2_'+obj.gs_seq_num+'" name=""></td>'; //할인율
	     view3+='<td><input type="text" autocomplete="off" class="goodsamount" id="total_'+obj.gs_seq_num+'" name="go_amount"></td>'; //금액
	     view3+='</tr>';
		 view4+='<tr>';
	     view4+='<td class="product_admin_tb_line">'+index+'</td>';
	     view4+='<td class="product_admin_tb_line">'+obj.gs_seq_num+'</td>';
	     view4+='<td class="product_admin_tb_line">'+obj.gs_name+'</td>';
	     view4+='</tr>';
	})
	     view+='</tbody>';
	  $( '#product_admin_tb_02' ).html(view);
	  $( '.m07_bom_list_tbody' ).html(view2);
	  $( '#mainbody_51_2_table_tbody' ).html(view3);
	  $( '.m051_product_choice_tbody' ).html(view4);
	}
	
	
	/** 자재 관리 */
	function show_material(){
	$.ajax({
	  		url:"materialSelect.do",
	  		type:"get",
	  		async: false,
	  		data: {company:'fourever'},
	  		success:materialHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
	}
	
	function materialHtml(data){
		var view="";
		 view+='<thead><tr>';
	     view+='<td></td>';
	     view+='<td>품목번호</td>';
	     view+='<td>품목명</td>';
	     view+='<td>제품군</td>';
	     view+='<td>라우팅</td>';
	     view+='</tr>';
	     view+='</thead>';
	     view+='<tbody>';
		 $.each(data,function(index, obj){	//반복문
		     view+='<tr class="m04_goods_admin_tb_line" id="m04_goods_admin_tb_line">';
		     view+='<td class="product_admin_tb_line_01"><input autocomplete="off" type="checkbox" name="materialNum" value="'+obj.ml_seq_num+'" class="productAdmin_check"></td>';
		     view+='<td class="product_admin_tb_line">'+obj.ml_num+'</td>';
		     view+='<td class="product_admin_tb_line">'+obj.ml_name+'</td>';
		     view+='<td class="product_admin_tb_line">'+obj.ml_family+'</td>';
		     view+='<td class="product_admin_tb_line">'+obj.ml_routing+'</td>';
		     view+='</tr>';
		})
	     view+='</tbody>';
	  	 $( '#m04_goods_admin_tb_02' ).html(view);
	}

	/** input list 인풋 리스트 넣기 */

    function show_department(){
	$.ajax({
	  		url:"codeSelect.do",
	  		type:"get",
	  		async: false,
	  		data : {"company":'fourever',
	   			"className":'부서'},
	  		success:departmentHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
}

	function departmentHtml(data){
		var view="";
	  $.each(data,function(index, obj){	//반복문
	     view+='<li class="option">'+obj.cc_name+'</li>';
	})
	  $( '#user_input_department' ).html(view);
	}
	
	//분류코드 인풋에 조회
	function show_m03_product_admin_td04_select_txt_list(){
		$.ajax({
	  		url:"codeSelect.do",
	  		type:"get",
	  		async: false,
	  		data : {"company":'fourever',
	   			"className":'품목단위'},
	  		success:ajaxHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
			}
		});
	
		function ajaxHtml(data){
			var view="";
		  $.each(data,function(index, obj){	//반복문
		     view+='<li class="option">'+obj.cc_name+'</li>';
		})
		  $( '#m03_product_admin_td04_select_txt_list' ).html(view);
		  $( '#m04_goods_admin_td04_03_select_txt_list' ).html(view);
		}
		
		$.ajax({
	  		url:"codeSelect.do",
	  		type:"get",
	  		async: false,
	  		data : {"company":'fourever',
	   			"className":'제품군'},
	  		success:ajaxHtml2,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
		
		function ajaxHtml2(data){
			var view="";
		  $.each(data,function(index, obj){	//반복문
		     view+='<li class="option">'+obj.cc_name+'</li>';
		})
		  $( '#m03_product_admin_td05_select_txt_list' ).html(view);
		  $( '#m04_goods_admin_td05_03_select_txt_list' ).html(view);
		}
		
		$.ajax({
	  		url:"codeSelect.do",
	  		type:"get",
	  		async: false,
	  		data : {"company":'fourever',
	   			"className":'품목대분류'},
	  		success:ajaxHtml3,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
		
		function ajaxHtml3(data){
			var view="";
		  $.each(data,function(index, obj){	//반복문
		     view+='<li class="option">'+obj.cc_name+'</li>';
		})
		  $( '#m03_product_admin_td07_select_txt_list' ).html(view);
		  $( '#m04_goods_admin_td07_03_select_txt_list' ).html(view);
		  $( '#m5_newtest_window_main_btn_list' ).html(view);
		}
		
		$.ajax({
		  		url:"codeSelect.do",
		  		type:"get",
		  		async: false,
		  		data : {"company":'fourever',
		   			"className":'품목소분류'},
		  		success:ajaxHtml4,
		  		error:function(data){ 
		  			let str = JSON.stringify(data);
		  			console.log(str);
		  		}
		  	});
		
		function ajaxHtml4(data){
			var view="";
		  $.each(data,function(index, obj){	//반복문
		     view+='<li class="option">'+obj.cc_name+'</li>';
		})
		  $( '#m03_product_admin_td08_select_txt_list' ).html(view);
		  $( '#m04_goods_admin_td08_03_select_txt_list' ).html(view);
		  $( '#m5_newtest_window_main_btn_list2' ).html(view);
		}
		
		$.ajax({
	  		url:"codeSelect.do",
	  		type:"get",
	  		async: false,
	  		data : {"company":'fourever',
	   			"className":'품목단위'},
	  		success:ajaxHtml5,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
		
		function ajaxHtml5(data){
			var view="";
		  $.each(data,function(index, obj){	//반복문
		     view+='<li class="option">'+obj.cc_name+'</li>';
		})
		  $( '#m03_product_admin_td09_select_txt_list' ).html(view);
		  $( '#m04_goods_admin_td09_03_select_txt_list' ).html(view);
		  $( '#m5_newtest_window_main_btn_list5' ).html(view);
		}
		
		$.ajax({
	  		url:"codeSelect.do",
	  		type:"get",
	  		async: false,
	  		data : {"company":'fourever',
	   			"className":'설비'},
	  		success:ajaxHtml6,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
		
		function ajaxHtml6(data){
			var view="";
		  $.each(data,function(index, obj){	//반복문
		     view+='<li class="option">'+obj.cc_name+'</li>';
		})
		  $( '#processAdmin_tb_01_system_list' ).html(view);
		}
	
		$.ajax({
	  		url:"codeSelect.do",
	  		type:"get",
	  		async: false,
	  		data : {"company":'fourever',
	   			"className":'설비'},
	  		success:ajaxHtml7,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
		
		function ajaxHtml7(data){
			var view="";
		  $.each(data,function(index, obj){	//반복문
		     view+='<li class="option">'+obj.cc_name+'</li>';
		})
		  $( '#processAdmin_tb_01_system_list' ).html(view);
		}
		
		$.ajax({
	  		url:"codeSelect.do",
	  		type:"get",
	  		async: false,
	  		data : {"company":'fourever',
	   			"className":'작업구분'},
	  		success:ajaxHtml8,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
		
		function ajaxHtml8(data){
			var view="";
		  $.each(data,function(index, obj){	//반복문
		     view+='<li class="option">'+obj.cc_name+'</li>';
		})
		  $( '#mainbody_05_02_left_bott_tb_table_txt_list' ).html(view);
		}
		
		$.ajax({
	  		url:"codeSelect.do",
	  		type:"get",
	  		async: false,
	  		data : {"company":'fourever',
	   			"className":'검사방법'},
	  		success:ajaxHtml9,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
		
		function ajaxHtml9(data){
			var view="";
		  $.each(data,function(index, obj){	//반복문
		     view+='<li class="option">'+obj.cc_name+'</li>';
		})
		  $( '#m5_newtest_window_main_txt_list4' ).html(view);
		}
		
		$.ajax({
		  		url:"codeSelect.do",
		  		type:"get",
		  		async: false,
		  		data : {"company":'fourever',
		   			"className":'검사기준대분류'},
		  		success:ajaxHtml10,
		  		error:function(data){ 
		  			let str = JSON.stringify(data);
		  			console.log(str);
		  		}
		  	});
		
		function ajaxHtml10(data){
			var view="";
		  $.each(data,function(index, obj){	//반복문
		     view+='<li class="option">'+obj.cc_name+'</li>';
		})
		  $( '#m5_newtest_window_main_btn_list' ).html(view);
		}
		
		$.ajax({
	  		url:"codeSelect.do",
	  		type:"get",
	  		async: false,
	  		data : {"company":'fourever',
	   			"className":'검사기준소분류'},
	  		success:ajaxHtml11,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
		
		function ajaxHtml11(data){
			var view="";
		  $.each(data,function(index, obj){	//반복문
		     view+='<li class="option">'+obj.cc_name+'</li>';
		})
		  $( '#m5_newtest_window_main_btn_list2' ).html(view);
		}
		
	$.ajax({
	  		url:"codeSelect.do",
	  		type:"get",
	  		async: false,
	  		data : {"company":'fourever',
	   			"className":'재고로케이션분류'},
	  		success:ajaxHtml12,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
		
		function ajaxHtml12(data){
			var view="";
			var view2="";
			var view3="";
			var num=1;
			console.log("hi");
		  $.each(data,function(index, obj){	//반복문
		     view+='<tr>';
		     view+='<td>'+num+'</td>';
		     view+='<td>'+obj.cc_name+'</td>';
		     view+='</tr>';
			view2+='<tr class="m03_product_localtion_tr">';
		     view2+='<td class="m03_product_localtion_td_01">'+num+'</td>';
		     view2+='<td class="m03_product_localtion_td_02">'+obj.cc_name+'</td>';
		     view2+='<td class="m04_goods_localtion_td_03"></td>';
		     view2+='</tr>';
			view3+='<tr class="m04_goods_localtion_tr">';
		     view3+='<td class="m04_goods_localtion_td_01">'+num+'</td>';
		     view3+='<td class="m04_goods_localtion_td_02">'+obj.cc_name+'</td>';
		     view3+='<td class="m04_goods_localtion_td_03"></td>';
		     view3+='</tr>';
			 num=num+1;
		})
		  $( '#locationList' ).html(view);
		  $( '.m03_product_localtion_tbody' ).html(view2);
		  $( '.m04_goods_localtion_tbody' ).html(view3);
		}
		
		$.ajax({
	  		url:"codeSelect.do",
	  		type:"get",
	  		async: false,
	  		data : {"company":'fourever',
	   			"className":'재고로케이션유형'},
	  		success:ajaxHtml13,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
		
		function ajaxHtml13(data){
			var view="";
			var num=1;
			console.log("hi");
		  $.each(data,function(index, obj){	//반복문
		     view+='<li class="option">'+obj.cc_name+'</li>';
		})
		  $( '#m08_location_select_txt_list' ).html(view);
		  $( '#m08_corr_location_select_txt_list' ).html(view);
		}
		
	}
	
	// 공정관리 - 검사항목 저장 클릭


	
	// 검사 삭제
    $(document).on("click", ".mainbody_05_btn8", function(){
	
		console.log("삭제 클릭");
		var len = $("input[name='inspectionNum']:checked").length;
		if(len == 1){
			var value = $("input[name='inspectionNum']:checked").val();
			$.ajax({
				url : "inspectionDelete.do",
				type : "GET",
				async:false,
				data : {"in_seq_num":value},
				// dataType : "json",
				success : function(){
					console.log(" 삭제 success");},
				error : function(request, status, error){
				    console.log("삭제 error");}
		});
		}else { //개수를 체크하고 2개부터는 each함수를 통해 각각 가져온다.
		    $("input[name='inspectionNum']:checked").each(function(e){
		        var value = $(this).val();
				console.log(value);
				$.ajax({
					url : "inspectionDelete.do",
					type : "GET",
					async:false,
					data : {"in_seq_num":value},
					// dataType : "json",
					success : function(){
						console.log(" 삭제 success");},
					error : function(request, status, error){
					    console.log("삭제 error");}
				});
	
		    })
		}
		show_inspection();	
	
	})


	//거래처 삭제
    $(document).on("click", ".m06_customer_delete_btn", function(){
		console.log("삭제 클릭");
		var len = $("input[name='clientNum']:checked").length;
		if(len == 1){
			var value = $("input[name='clientNum']:checked").val();
			$.ajax({
				url : "clientDelete.do",
				type : "GET",
				async:false,
				data : {"ct_num":value},
				// dataType : "json",
				success : function(){
					$("input[name='clientNum']:checked").parent().parent().remove();
					console.log(" 삭제 success");},
				error : function(request, status, error){
				    console.log("삭제 error");}
		});
		}else { //개수를 체크하고 2개부터는 each함수를 통해 각각 가져온다.
		    $("input[name='clientNum']:checked").each(function(e){
		        var value = $(this).val();
				console.log(value);
				$.ajax({
					url : "clientDelete.do",
					type : "GET",
					async:false,
					data : {"ct_num":value},
					// dataType : "json",
					success : function(){
						$("input[name='clientNum']:checked").parent().parent().remove();
						console.log(" 삭제 success");},
					error : function(request, status, error){
					    console.log("삭제 error");}
				});
	
		    })
		}
	})
	
	
	// clientInsert()
    $(document).on("click", ".mainbody_06_btn3", function(){

		console.log("안올듯");
			console.log("durls")
		var clientVO = {
			company : "fourever",
			ct_mutual : $("#m06_l_mutual_input").val(),
			ct_sortation : $("input[name=account]:checked").val(),
			ct_repName : $("#m06_l_name_input").val(),
			ct_businessNumber : $("#m06_l_bsnum_input").val(),
			ct_chrgName : $("#m06_l_person_name_input").val(),
			ct_postalCode : $("#m06_l_post_input").val(),
			ct_address : $("#m06_l_address_input").val(),
			ct_condition : $("#m06_l_bs01_input").val(),
			ct_industry : $("#m06_l_bs02_input").val(),
			ct_contact : $("#m06_l_phone_input").val(),
			ct_fax : $("#m06_l_fax_input").val(),
			ct_email : $("#m06_l_email_input").val()
		};
		$.ajax({
			url : "clientInsert.do",
			type : "GET",
			async:false,
			data : clientVO,
			// dataType : "json",
			success : function(){
				console.log("거래처 입력 success");},
			error : function(request, status, error){
			    console.log("거래처 입력 error");}
		});
		
	  	show_client();
	});


	//제품 삭제
    $(document).on("click", ".mainbody_03_02_01_del_bt", function(){
		console.log("삭제 클릭");
		var len = $("input[name='goodsNum']:checked").length;
		if(len == 1){
			var value = $("input[name='goodsNum']:checked").val();
			$.ajax({
				url : "goodsDelete.do",
				type : "GET",
				async:false,
				data : {"gs_seq_num":value},
				// dataType : "json",
				success : function(){
					console.log(" 삭제 success");},
				error : function(request, status, error){
				    console.log("삭제 error");}
		});
		}else { //개수를 체크하고 2개부터는 each함수를 통해 각각 가져온다.
		    $("input[name='goodsNum']:checked").each(function(e){
		        var value = $(this).val();
				console.log(value);
				$.ajax({
					url : "goodsDelete.do",
					type : "GET",
					async:false,
					data : {"gs_seq_num":value},
					// dataType : "json",
					success : function(){
						console.log(" 삭제 success");},
					error : function(request, status, error){
					    console.log("삭제 error");}
				});
	
		    })
		}
		show_goods();	
		
	})
	
	//자재 삭제
    $(document).on("click", ".mainbody_04_02_01_del_bt", function(){
		console.log("삭제 클릭");
		var len = $("input[name='materialNum']:checked").length;
		if(len == 1){
			var value = $("input[name='materialNum']:checked").val();
			$.ajax({
				url : "materialDelete.do",
				type : "GET",
				async:false,
				data : {"ml_seq_num":value},
				// dataType : "json",
				success : function(){
					console.log(" 삭제 success");},
				error : function(request, status, error){
				    console.log("삭제 error");}
		});
		}else { //개수를 체크하고 2개부터는 each함수를 통해 각각 가져온다.
		    $("input[name='materialNum']:checked").each(function(e){
		        var value = $(this).val();
				console.log(value);
				$.ajax({
					url : "materialDelete.do",
					type : "GET",
					async:false,
					data : {"ml_seq_num":value},
					// dataType : "json",
					success : function(){
						console.log(" 삭제 success");},
					error : function(request, status, error){
					    console.log("삭제 error");}
				});
	
		    })
		}
		show_material();	
		
	})
	
	
    $(document).on('click', '.mainbody_03_01_btn3', function(e){
	console.log("durls")
		var goodsVO = {
			company : "fourever",
			gs_num : $("#m3_l_itemnum_input").val(),
			gs_name : $("#m3_l_itemname_input").val(),
			gs_sortation : $("#product_admin_td_03_select_txt").text(),
			gs_unit : $("#m03_product_admin_td04_select_txt").text(),
			gs_family : $("#m03_product_admin_td05_select_txt").text(),
			gs_routing : $("#m03_product_admin_td06_select_txt").text(),
			gs_code_a : $("#m03_product_admin_td05_select_txt").text(),
			gs_code_c : $("#m03_product_admin_td05_select_txt").text(),
			gs_standard : $("#m3_l_standard_input").val(),
			gs_price : $("#m3_l_money_input").val(),
			gs_client : $("#product_admin_td_09_01_select_01").text(),
			gs_packingUnit : $("#m03_product_admin_td09_select_txt").text(),
			gs_packingAmount : $("#m3_l_packcount_input").val(),
			gs_safeAmount : $("#m3_l_savecount_input").val(),
			gs_location : $("#product_admin_td_13_select_01").text()
		};
		$.ajax({
			url : "goodsInsert.do",
			type : "GET",
			async:false,
			data : goodsVO,
			// dataType : "json",
			success : function(){
				console.log("거래처 입력 success");},
			error : function(request, status, error){
			    console.log("거래처 입력 error");}
		});
		
	  	show_goods();
})
	
    $(document).on('click', '.mainbody_04_01_btn3', function(e){
	$('.goods_input_modal_window').fadeIn();
	console.log("durls")
		var materialVO = {
			company : "fourever",
			ml_num : $("#m4_l_itemnum_input").val(),
			ml_name : $("m4_l_itemname_input").val(),
			ml_sortation : $("#m04_goods_admin_td_03_select_txt").text(),
			ml_uni : $("#m04_goods_admin_td04_03_select_txt").text(),
			ml_family : $("#m04_goods_admin_td05_03_select_txt").text(),
			ml_routing : $("#m04_goods_admin_td06_03_select_txt").text(),
			ml_code_a : $("#m04_goods_admin_td07_03_select_txt").text(),
			ml_code_c : $("#m04_goods_admin_td08_03_select_txt").text(),
			ml_standard : $("#m4_l_standard_input").val(),
			ml_price : $("#m4_l_money_input").val(),
			ml_client : $("#m04_goods_admin_td_09_01_select_01").text(),
			ml_packingUnit : $("#m04_goods_admin_td09_03_select_txt").text(),
			ml_packingAmount : $("#m4_l_packcount_input").val(),
			ml_safeAmount : $("#m4_l_savecount_input").val(),
			ml_location : $("#m04_goods_admin_td_13_select_01").text()
		};
		$.ajax({
			url : "materialInsert.do",
			type : "GET",
			async:false,
			data : materialVO,
			// dataType : "json",
			success : function(){
				console.log("거래처 입력 success");},
			error : function(request, status, error){
			    console.log("거래처 입력 error");}
		});
		
	  	show_material();
})

	// 공정 관리 수정 하기
	// tr 클릭했을때
	var processUpdateNum = 0;
    $(document).on('click', '.processAdmin_tb_02 tbody tr', function(e){
		processUpdateNum = $(this).find("input").val();
		console.log(processUpdateNum+"수정하기");
		$.ajax({
	  		url:"processSelect.do",
	  		type:"get",
	  		async: false,
	  		success:processinputHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});

		// input에 db 내용 보여주기
		function processinputHtml(data){
			var view="";
		  $.each(data,function(index, obj){	//반복문
		     if(obj.pr_seq_num==processUpdateNum){
		    	 $('#processAdmin_tb_01_num').val(obj.pr_num);
		    	 $('#processAdmin_tb_01_name').val(obj.pr_name);
		    	 $('#mainbody_05_02_left_bott_tb_table_txt').text(obj.pr_sortation);
		    	 $('#processAdmin_tb_01_system').text(obj.pr_facilities);
		    	 $('#processAdmin_tb_01_wrapp_01_01').val(obj.pr_reviewer);
		    	 $('#processAdmin_tb_01_wrapp_02_01').val(obj.pr_approver);
		    	 $('#processAdmin_tb_01_memo').val(obj.pr_memo);
		     }
		})
		}
	$('.mainbody_05_btn3').attr('onclick','processUpdate()');
	
	})

function processUpdate(){
	$(".process_input_modal_mid").text("공정이 수정되었습니다.");
	$('.process_input_modal_window').fadeIn();
	console.log("공정입력");
var processVO = {
			company : "fourever",
			pr_seq_num : processUpdateNum,
			pr_num : $("#processAdmin_tb_01_num").val(),
			pr_name : $("#processAdmin_tb_01_name").val(),
			pr_sortation : $("#mainbody_05_02_left_bott_tb_table_txt").text(),
			pr_facilities : $("#processAdmin_tb_01_system").text(),
			pr_reviewer : $("#processAdmin_tb_01_wrapp_01_01").text(),
			pr_approver : $("#processAdmin_tb_01_wrapp_02_01").text(),
			pr_memo : $("#processAdmin_tb_01_memo").val()
	};
	$.ajax({
			url : "processUpdate.do",
			type : "GET",
			async:false,
			data : processVO,
			// dataType : "json",
			success : function(){
				console.log("공정 수정 success");},
			error : function(request, status, error){
			    console.log("공정 수정 error");}
		});
		
	  	show_process();
}


	// 거래처 관리 수정 하기
	// tr 클릭했을때
	var clientUpdateNum = 0;
    $(document).on('click', '.m06_cus_list_table tbody tr', function(e){
		clientUpdateNum = $(this).find("input").val();
		console.log(clientUpdateNum+"수정하기");
		$.ajax({
	  		url:"clientSelect.do",
	  		type:"get",
	  		async: false,
	  		success: clientinputHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});

		// input에 db 내용 보여주기
		function clientinputHtml(data){
			var view="";
		  $.each(data,function(index, obj){	//반복문
		     if(obj.ct_num==clientUpdateNum){
			 $("#m06_l_mutual_input").val(obj.ct_mutual);
			 $("input[name=account]:checked").val(obj.ct_sortation);
			 $("#m06_l_name_input").val(obj.ct_repName);
			 $("#m06_l_bsnum_input").val(obj.ct_businessNumber);
			 $("#m06_l_person_name_input").val(obj.ct_chrgName);
			 $("#m06_l_post_input").val(obj.ct_postalCode);
			 $("#m06_l_address_input").val(obj.ct_address);
			 $("#m06_l_bs01_input").val(obj.ct_condition);
			 $("#m06_l_bs02_input").val(obj.ct_industry);
			 $("#m06_l_phone_input").val(obj.ct_contact);
			 $("#m06_l_fax_input").val(obj.ct_fax);
			 $("#m06_l_email_input").val(obj.ct_email)
		     }
		})
		}
		// 입력 버튼에서 수정 버튼으로 바꾸기
		$('.mainbody_06_btn3').attr('class','mainbody_06_btn4');
		
		})
	
	    $(document).on('click', '.mainbody_06_btn4', function(e){
		$(".process_input_modal_mid").text("거래처가 수정되었습니다.");
		$('.process_input_modal_window').fadeIn();
		console.log("공정입력");
		var clientVO = {
			company : "fourever",
			ct_num : clientUpdateNum,
			ct_mutual : $("#m06_l_mutual_input").val(),
			ct_sortation : $("input[name=account]:checked").val(),
			ct_repName : $("#m06_l_name_input").val(),
			ct_businessNumber : $("#m06_l_bsnum_input").val(),
			ct_chrgName : $("#m06_l_person_name_input").val(),
			ct_postalCode : $("#m06_l_post_input").val(),
			ct_address : $("#m06_l_address_input").val(),
			ct_condition : $("#m06_l_bs01_input").val(),
			ct_industry : $("#m06_l_bs02_input").val(),
			ct_contact : $("#m06_l_phone_input").val(),
			ct_fax : $("#m06_l_fax_input").val(),
			ct_email : $("#m06_l_email_input").val()
		};
		$.ajax({
			url : "clientUpdate.do",
			type : "GET",
			async:false,
			data : clientVO,
			// dataType : "json",
			success : function(){
				console.log("거래처 수정 success");},
			error : function(request, status, error){
			    console.log("거래처 수정 error");}
		});
			
	  	show_client();
	})
	
	// 제품 관리 수정 하기
	// tr 클릭했을때
	var goodsUpdateNum = 0;
    $(document).on('click', '.product_admin_tb_02 tbody tr', function(e){
		goodsUpdateNum = $(this).find("input").val();
		$.ajax({
	  		url:"goodsSelect.do",
	  		type:"get",
	  		async: false,
	  		success: goodsinputHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});

		// input에 db 내용 보여주기
		function goodsinputHtml(data){
			var view="";
		  $.each(data,function(index, obj){	//반복문
		console.log(goodsUpdateNum+"수정하기");
		     if(obj.gs_seq_num==goodsUpdateNum){
			 $("#m3_l_itemnum_input").val(obj.gs_num);
			 $("#m3_l_itemname_input").val(obj.gs_name);
			 $("#product_admin_td_03_select_txt").text(obj.gs_sortation);
			 $("#m03_product_admin_td04_select_txt").text(obj.gs_unit);
			 $("#m03_product_admin_td05_select_txt").text(obj.gs_family);
			 $("#m03_product_admin_td06_select_txt").text(obj.gs_routing);
			 $("#m03_product_admin_td05_select_txt").text(obj.gs_code_a);
			 $("#m03_product_admin_td05_select_txt").text(obj.gs_code_c);
			 $("#m3_l_standard_input").val(obj.gs_standard);
			 $("#m3_l_money_input").val(obj.gs_price);
			 $("#product_admin_td_09_01_select_01").text(obj.gs_client);
			 $("#m03_product_admin_td09_select_txt").text(obj.gs_packingUnit);
			 $("#m3_l_packcount_input").val(obj.gs_packingAmount);
			 $("#m3_l_savecount_input").val(obj.gs_safeAmount);
			 $("#product_admin_td_13_select_01").text(obj.gs_location);
		     }
		})
		}
		// 입력 버튼에서 수정 버튼으로 바꾸기
		$('.mainbody_03_01_btn3').attr('class','mainbody_03_01_btn4');
		$('.mainbody_03_01_btn3').attr('onclik','');
		
		})
	
	    $(document).on('click', '.mainbody_03_01_btn4', function(e){
		$(".process_input_modal_mid").text("제품이 수정되었습니다.");
		$('.process_input_modal_window').fadeIn();
		var goodsVO = {
			company : "fourever",
			gs_seq_num : goodsUpdateNum,
			gs_num : $("#m3_l_itemnum_input").val(),
			gs_name : $("#m3_l_itemname_input").val(),
			gs_sortation : $("#product_admin_td_03_select_txt").text(),
			gs_unit : $("#m03_product_admin_td04_select_txt").text(),
			gs_family : $("#m03_product_admin_td05_select_txt").text(),
			gs_routing : $("#m03_product_admin_td06_select_txt").text(),
			gs_code_a : $("#m03_product_admin_td05_select_txt").text(),
			gs_code_c : $("#m03_product_admin_td05_select_txt").text(),
			gs_standard : $("#m3_l_standard_input").val(),
			gs_price : $("#m3_l_money_input").val(),
			gs_client : $("#product_admin_td_09_01_select_01").text(),
			gs_packingUnit : $("#m03_product_admin_td09_select_txt").text(),
			gs_packingAmount : $("#m3_l_packcount_input").val(),
			gs_safeAmount : $("#m3_l_savecount_input").val(),
			gs_location : $("#product_admin_td_13_select_01").text()
		};
		$.ajax({
			url : "goodsUpdate.do",
			type : "GET",
			async:false,
			data : goodsVO,
			// dataType : "json",
			success : function(){
				console.log("제품 수정 success");},
			error : function(request, status, error){
			    console.log("제품 수정 error");}
		});
			
	  	show_goods();
	})
	
	// 자재 관리 수정 하기
	// tr 클릭했을때
	var materialUpdateNum = 0;
    $(document).on('click', '.m04_goods_admin_tb_02 tbody tr', function(e){
		materialUpdateNum = $(this).find("input").val();
		$.ajax({
	  		url:"materialSelect.do",
	  		type:"get",
	  		async: false,
	  		success: goodsinputHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});

		// input에 db 내용 보여주기
		function goodsinputHtml(data){
			var view="";
		  $.each(data,function(index, obj){	//반복문
		console.log(materialUpdateNum+"수정하기");
		     if(obj.ml_seq_num==materialUpdateNum){
				 $("#m4_l_itemnum_input").val(obj.ml_num);
				 $("#m4_l_itemname_input").val(obj.ml_name);
				 $("#m04_goods_admin_td_03_select_txt").text(obj.ml_sortation);
				 $("#m04_goods_admin_td04_03_select_txt").text(obj.ml_uni);
				 $("#m04_goods_admin_td05_03_select_txt").text(obj.ml_family);
				 $("#m04_goods_admin_td06_03_select_txt").text(obj.ml_routing);
				 $("#m04_goods_admin_td07_03_select_txt").text(obj.ml_code_a);
				 $("#m04_goods_admin_td08_03_select_txt").text(obj.ml_code_c);
				 $("#m4_l_standard_input").val(obj.ml_standard);
				 $("#m4_l_money_input").val(obj.ml_price);
				 $("#m04_goods_admin_td_09_01_select_01").text(obj.ml_client);
				 $("#m04_goods_admin_td09_03_select_txt").text(obj.ml_packingUnit);
				 $("#m4_l_packcount_input").val(obj.ml_packingAmount);
				 $("#m4_l_savecount_input").val(obj.ml_safeAmount);
				 $("#m04_goods_admin_td_13_select_01").text(obj.ml_location);
		     }
		})
		}
		// 입력 버튼에서 수정 버튼으로 바꾸기
		$('.mainbody_04_01_btn3').attr('class','mainbody_04_01_btn4');
		
		})
	
	    $(document).on('click', '.mainbody_04_01_btn4', function(e){
		$(".process_input_modal_mid").text("자재가 수정되었습니다.");
		$('.process_input_modal_window').fadeIn();
		console.log("공정입력");
		var materialVO = {
			company : "fourever",
			ml_seq_num : materialUpdateNum,
			ml_num : $("#m4_l_itemnum_input").val(),
			ml_name : $("m4_l_itemname_input").val(),
			ml_sortation : $("#m04_goods_admin_td_03_select_txt").text(),
			ml_uni : $("#m04_goods_admin_td04_03_select_txt").text(),
			ml_family : $("#m04_goods_admin_td05_03_select_txt").text(),
			ml_routing : $("#m04_goods_admin_td06_03_select_txt").text(),
			ml_code_a : $("#m04_goods_admin_td07_03_select_txt").text(),
			ml_code_c : $("#m04_goods_admin_td08_03_select_txt").text(),
			ml_standard : $("#m4_l_standard_input").val(),
			ml_price : $("#m4_l_money_input").val(),
			ml_client : $("#m04_goods_admin_td_09_01_select_01").text(),
			ml_packingUnit : $("#m04_goods_admin_td09_03_select_txt").text(),
			ml_packingAmount : $("#m4_l_packcount_input").val(),
			ml_safeAmount : $("#m4_l_savecount_input").val(),
			ml_location : $("#m04_goods_admin_td_13_select_01").text()
		};
		$.ajax({
			url : "materialUpdate.do",
			type : "GET",
			async:false,
			data : materialVO,
			// dataType : "json",
			success : function(){
				console.log("자재 수정 success");},
			error : function(request, status, error){
			    console.log("자재 수정 error");}
		});
			
	  	show_material();
	})
	
	var selectedLocationClass = "";
    $(document).on('click', '.mainbody_08_01_l_bottom_table tbody tr', function(e){
		selectedLocationClass = $(this);
		selectedLocationClass = selectedLocationClass.find('td:eq(1)');
		selectedLocationClass = selectedLocationClass.text();
		console.log(selectedLocationClass);
		show_location();
	})
	
	
    $(document).on('click', '.m08_localtion_content_01_01_btn', function(e){
		var locationVO = {
			company : "fourever",
			lc_class : selectedLocationClass,
			lc_parent : $("#m08_loca_text_01").text(),
			lc_name : $("#lc_name").val(),
			lc_num : $("#lc_num").val(),
			lc_type : $("#lc_type").text(),
			lc_jang : $("#lc_jang").val(),
			lc_pok : $("#lc_pok").val(),
			lc_go : $("#lc_go").val(),
			lc_yeol : $("#lc_yeol").val(),
			lc_yeon : $("#lc_yeon").val(),
			lc_dan : $("#lc_dan").val(),
		};
		$.ajax({
			url : "locationInsert.do",
			type : "GET",
			async:false,
			data : locationVO,
			// dataType : "json",
			success : function(){
				console.log("로케이션 삽입 success");},
			error : function(request, status, error){
			    console.log("로케이션 삽입 error");}
		});
	
	})
	
	
	// 로케이션
	function show_location(){
		$.ajax({
			url : "locationSelect.do",
			type : "GET",
			async:false,
			data : {locationClassName: selectedLocationClass,
			 company: 'fourever'},
			// dataType : "json",
			success : locationHtml,
			error : function(request, status, error){
			    console.log("로케이션 조회 error");}
		});
		
		function locationHtml(data){
		var view="";
		  $.each(data,function(index, obj){	//반복문
		     view+='<tr>';
		     view+='<td> <input autocomplete="off" type="checkbox" name="locationDeleteNum" value="'+obj.lc_seq_num+'"id="m08_r_bottom_table_checkbox">';
             view+='<label for="m08_r_bottom_table_checkbox"></label></td>';
		     view+='<td>'+obj.lc_name+'</td>';
		     view+='<td>'+obj.lc_num+'</td>';
		     view+='<td>'+obj.lc_type+'</td>';
		     view+='<td>'+obj.lc_jang+'</td>';
		     view+='<td>'+obj.lc_pok+'</td>';
		     view+='<td>'+obj.lc_go+'</td>';
		     view+='<td>'+obj.lc_yeol+'</td>';
		     view+='<td>'+obj.lc_yeon+'</td>';
		     view+='<td>'+obj.lc_dan+'</td>';
		     view+='<td></td>';
	         view+='</tr>'; 
	
		  })
			$( '#mainbody_08_01_r_bottom_table_body' ).html(view);
		}
	
	}
	
	
	
	 function locationDelete() {
	var len = $("input[name='locationDeleteNum']:checked").length;
	if(len == 1){
		var value = $("input[name='locationDeleteNum']:checked").val();
		$.ajax({
			url : "locationDelete.do",
			type : "GET",
			async:false,
			data : {"lc_seq_num":value},
			// dataType : "json",
			success : function(){
				console.log(" 삭제 success");},
			error : function(request, status, error){
			    console.log("삭제 error");}
	});
	}else { //개수를 체크하고 2개부터는 each함수를 통해 각각 가져온다.
	    $("input[name='locationDeleteNum']:checked").each(function(e){
	        var value = $(this).val();
			console.log(value);
			$.ajax({
				url : "locationDelete.do",
				type : "GET",
				async:false,
				data : {"lc_seq_num":value},
				// dataType : "json",
				success : function(){
					console.log(" 삭제 success");},
				error : function(request, status, error){
				    console.log("삭제 error");}
			});

	    })
	}
}

    $(document).on('click', '.mainbody_08_01_r_top_02_btn', function(e){
		locationDelete();
	})
	
	
	var selectLocation = "";
	var parentLocation = "";
	$(document).on('click', '#mainbody_08_01_r_bottom_table_body tr', function(e){
		$(this).css("background-color","#999999");
		selectLocation = $(this).find('input');
		selectLocation = selectLocation.val();
		parentLocation = $(this).find('td:eq(1)');
		parentLocation = parentLocation.text();
		$("#m08_loca_text_01").text(parentLocation);
	})
	
	
	
	function locationInputHtml(){
		console.log(selectLocation);
		$.ajax({
	  		url:"locationSelect.do",
	  		type:"get",
	  		async: false,
	  		success: locationInputHtml,
	  		error:function(data){
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	})
		console.log(selectLocation+"수정하기");
	
	}
		function locationInputHtml(data) {
		var view="";
		  $.each(data,function(index, obj){	//반복문
		console.log(selectLocation+"수정하기");
		     if(obj.lc_seq_num==selectLocation){
				 $("#m08_loca_text_01").text(obj.lc_parent);
				 $("#lc_name").val(obj.lc_name);
				 $("#lc_num").val(obj.lc_num);
				 $("#lc_type").text(obj.lc_type);
				 $("#lc_jang").val(obj.lc_jang);
				 $("#lc_pok").val(obj.lc_pok);
				 $("#lc_go").val(obj.lc_go);
				 $("#lc_yeol").val(obj.lc_yeol);
				 $("#lc_yeon").val(obj.lc_yeon);
				 $("#lc_dan").val(obj.lc_dan);
		     }
		})
		
	}
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 공정 관리 tr 클릭
		var processSelectedNum = "";
	$(document).on('click', '.processAdmin_tb_02 tr', function(e){
		processSelectedNum = $(this).find('input');
		processSelectedNum = processSelectedNum.val();
		console.log(processSelectedNum);
		show_inspection();
	})
	
	
	// 검사항목 가져오기
	function show_inspection() {
		$.ajax({
	  		url:"inspectionSelect.do",
	  		type:"get",
	  		async: false,
	  		data: {pr_num :processSelectedNum},
	  		success:inspectionHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
	}
	
	function inspectionHtml(data){
		var view="<thead> <tr> <th> </th> <th>대분류</th> <th>소분류</th> <th>검사항목명</th> <th>입력값 구분</th> <th>검사기준</th>";
		view+="<th>검사방법</th> <th>최댓값</th> <th>최소값</th> <th>입력단위</th> <th>시료수</th> <th>정렬순서</th> <th>자주검사</th> </tr> </thead>";
		view+="<tbody>";
		  $.each(data,function(index, obj){	//반복문
		     view+='<tr>';
		     view+='<td>';
	    	 view+='<input autocomplete="off" type="checkbox" name="inspectionNum" value="'+obj.in_seq_num+'">'
    		 view+='<label for="processAdmin_tb_03_checkbox"></label>'
   			 view+='</td>';
			 view+='<td>'+obj.in_code_a+'</td>';
			 view+='<td>'+obj.in_code_c+'</td>';
			 view+='<td>'+obj.in_goods+'</td>';
			 view+='<td>'+obj.in_inputValue+'</td>';
			 view+='<td>'+obj.in_standard+'</td>';
			 view+='<td>'+obj.in_how+'</td>';
			 view+='<td>'+obj.in_max+'</td>';
			 view+='<td>'+obj.in_min+'</td>';
			 view+='<td>'+obj.in_unit+'</td>';
			 view+='<td>'+obj.in_sample+'</td>';
			 view+='<td>'+obj.in_sort+'</td>';
			 view+='<td>'+obj.in_self+'</td>';
			 view+='</tr>';
		  })
	         view+='</tbody>'; 
	  $( '#processAdmin_tb_03' ).html(view);
	

	};
	
	
	// 검사 항목 입력
	function m5_newtest_window_modal_save_btn_click(){
		var in_self_check = "X";
		if ($('input:checkbox[id="in_self"]').is(":checked")){
			in_self_check = "O";
		};
		var inspectionVO = {
			company : "fourever",
			pr_num : processSelectedNum,
			in_code_a : $("#in_code_a").text(),
			in_code_c : $("#in_code_c").text(),
			in_goods : $("#in_goods").val(),
			in_inputValue : $("#in_inputValue").text(),
			in_standard : $("#in_standard").val(),
			in_how : $("#in_how").text(),
			in_max : $("#in_max").val(),
			in_min : $("#in_min").val(),
			in_unit : $("#in_unit").text(),
			in_sample : $("#in_sample").val(),
			in_sort : $("#in_sort").val(),
			in_self : in_self_check
		};
		console.log(inspectionVO);
		$.ajax({
				url : "inspectionInsert.do",
				type : "GET",
				async:false,
				data : inspectionVO,
				// dataType : "json",
				success : function(){
					console.log("success");
					},
				error : function(request, status, error){
				    console.log("검사 입력 error");
					}
			});
		
		$('.m5_newtest_window').fadeOut();
		show_inspection();
	
	}
	
		function show_bom(){
			
			
		}
		
		
	// 주문 관리 등록 추가
	$(document).on('click', '.mainbody_51_1_top_btn_02', function(e){
		var go_goods_seq = "";
		var go_goods_name = "";
		var go_goods_count = "";
		var num = 0;
		$("input[name='goodsOrderNum']:checked").each(function(e){
			var goods_name = go_goods_name+=$(this).next();
			if(num==0){
				go_goods_seq+=$(this).val();
				go_goods_name+=goods_name.text();
				go_goods_count+=$(this).next(5).val();
			}else {
				go_goods_seq+=", ";
				go_goods_seq+=$(this).val();
				go_goods_name+=", ";
				go_goods_name+=$(this).next().val();
				go_goods_count+=", ";
				go_goods_count+=$(this).next(5).val();
			}num=1;
			console.log(num);
		})
		var goodsOrderVO = {
		company : "fourever",
		go_goods_seq : go_goods_seq,
		go_goods_name : go_goods_name,
		go_goods_count : go_goods_count,
		go_client : $("#m51_product_admin_td_09_01_select_01").text(),
		go_orderDate : $("#go_orderDate").val(),
		go_dueDate : $("#go_dueDate").val(),
		go_place : $("#go_place").val(),
		go_address : $("#go_address").val(),
		go_price : $("#go_price").val(),
		go_amount : $("#go_amount").val(),
		go_taxation : $("input[name=taxation]:checked").val(),
		};
		$.ajax({
				url : "goodsOrderInsert.do",
				type : "GET",
				async:false,
				data : goodsOrderVO,
				// dataType : "json",
				success : function(){
					console.log("success");
					},
				error : function(request, status, error){
				    console.log("주문 입력 error");
					}
			});
	})
		
	function show_goodsOrder(){
		$.ajax({
	  		url:"goodsOrderSelect.do",
	  		type:"get",
	  		async: false,
	  		data: {company: 'fourever'},
	  		success:goodsOrderHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});

		function goodsOrderHtml(data){
			var view="";
			  $.each(data,function(index, obj){	//반복문
			     view+='<tr>';
			     view+='<td><input type="checkbox" name="goodsOrderDeleteNum" value="'+obj.go_num+'"></td>';
		         view+='<td>'+obj.go_orderDate+'</td>'; 
		         view+='<td>'+obj.go_num+'</td>'; 
		         view+='<td>'+obj.go_client+'</td>'; 
		         view+='<td>'+obj.go_goods_seq+'</td>'; 
		         view+='<td>'+obj.go_goods_name+'</td>'; 
		         view+='<td>'+obj.go_goods_count+'</td>'; 
		         view+='<td>'+obj.go_amount+'</td>'; 
		         view+='<td>'+obj.go_dueDate+'</td>'; 
		         view+='<td></td>'; 
		         view+='</tr>'; 
			  })
		  $( '#m52_output_view_tb_tbody' ).html(view);
		}
	}
		
		
	// 주문 삭제
	$(document).on('click', '.mainbody_52_01_top_btn_03', function(e){
		
		goodsOrderDelete();
		
	})
	
	function goodsOrderDelete() {
		var len = $("input[name='goodsOrderDeleteNum']:checked").length;
		if(len == 1){
			var value = $("input[name='goodsOrderDeleteNum']:checked").val();
			$.ajax({
				url : "goodsOrderDelete.do",
				type : "GET",
				async:false,
				data : {"go_num":value},
				success : function(){
					console.log(" 삭제 success");},
				error : function(request, status, error){
				    console.log("삭제 error");}
			});
			}else { //개수를 체크하고 2개부터는 each함수를 통해 각각 가져온다.
			    $("input[name='goodsOrderDeleteNum']:checked").each(function(e){
		        var value = $(this).val();
				console.log(value);
				$.ajax({
					url : "goodsOrderDelete.do",
					type : "GET",
					async:false,
					data : {"go_num":value},
					success : function(){
						console.log(" 삭제 success");},
					error : function(request, status, error){
					    console.log("삭제 error");}
					});
			
			    })
			}
		
			show_goodsOrder();
			
	}
	
	$(document).on('click', '.m051_product_choice_tbody tr', function(e){
		var selectedgoodsNum = $(this).find("td:eq(1)").text();
		$("#mainbody_51_2_table_tbody tr").each(function(e){
	        var goinputvalue = $(this).find("input").val();
			if(selectedgoodsNum==goinputvalue){
				$(this).css("display", "table");
			}

	    })
		
		
	})
	
	//주문 관리 거래처 클릭하면 추가
	$(document).on('click', '#m51_Order_customer_num_tbody tr', function(e){
		var selected = $(this).find("td:eq(2)").text();
		$("#m51_product_admin_td_09_01_select_01").text(selected);
		m51_Order_customer_num_Close();
	})
	
	//제품 관리 거래처 클릭하면 추가
	$(document).on('click', '#customer_tbody tr', function(e){
		var selected = $(this).find("td:eq(2)").text();
		$("#product_admin_td_09_01_select_01").text(selected);
		customerClose();
	})
		
	//제품 관리 로케이션 클릭하면 추가
	$(document).on('click', '.m03_product_localtion_tbody tr', function(e){
		var selected = $(this).find("td:eq(1)").text();
		$("#product_admin_td_13_select_01").text(selected);
		m03_product_locationClose();
	})
	
	//자재 관리 로케이션 클릭하면 추가
	$(document).on('click', '.m04_goods_localtion_tbody tr', function(e){
		var selected = $(this).find("td:eq(1)").text();
		$("#m04_goods_admin_td_13_select_01").text(selected);
		m03_product_locationClose();
	})
	
	// 주문관리 합계금액 계산
	$(document).on('keyup', '.go_goods_count', function(e) {
		var price = $(this).parent().prev().text();
		console.log(price);
		var num1 = parseInt($(this).val());
		console.log(num1);
		var num2 = $(this).parent().next().find("input");
		var num3 = num2.parent().next().find("input");
		num2 = 1-(parseInt(num2.val())*0.01);
		console.log(num2);
		this.value = this.value.replace(/[^0-9]/g, '');
		num3.val(price*num1*num2);
		$("#go_amount").val(price*num1*num2);
	})
	
	// 주문관리 합계금액 계산
	$(document).on('keyup', '.go_goods_discount', function(e) {
		var price = $(this).parent().prev().prev().text();
		console.log(price);
		var num1 = parseInt($(this).parent().prev().find("input").val());
		console.log(num1);
		var num2 = $(this);
		var num3 = num2.parent().next().find("input");
		num2 = 1-(parseInt(num2.val())*0.01);
		console.log(num2);
		this.value = this.value.replace(/[^0-9]/g, '');
		num3.val(price*num1*num2);
		$("#go_amount").val(price*num1*num2);
		
	$('.input_num').each(function() {
		if (isNaN(this.value) || this.value === '') {
				$('.input_total').val(0);
				$('.input_total2').val(0);
			}else{
			$('.input_total_${vo.product_num }').val(num1*num2);
			$('.input_total2_${vo.product_num }').val(num1*num2*num3);
			}
		})
	})