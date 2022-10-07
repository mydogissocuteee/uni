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
	var view3="";
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
		view2+='<td><input type="hidden" name="pr_seq_num" value="'+obj.pr_seq_num+'">'+obj.pr_num+'</td>';
		view2+='<td><input type="hidden" name="routing" value="1">'+obj.pr_name+'</td>';
		view2+='</tr>';
		view3+='<li class="option">'+obj.pr_name+'</li>';
})
		view+='</tbody>';
		view+='</table>';
  $( '.processAdmin_tb_02' ).html(view);
  $( '#routing_modal_body_bottom_l_table_tbody' ).html(view2);
  $( '#m11_produc_plus_content_01_table_div02_list' ).html(view3);
}


	function processInsert(){
	   $('.process_input_modal_window').fadeIn();
	
	    var TEXT01 = $('#processAdmin_tb_01_num').val();
	   var TEXT02 = $('#processAdmin_tb_01_name').val();
	   var TEXT03 = $('#mainbody_05_02_left_bott_tb_table_txt').text();
	   if(TEXT01==""){
	       $(".process_input_modal_mid").text("공정번호를 입력해주세요.");
	   }else if(TEXT02==""){
	       $(".process_input_modal_mid").text("공정명을 입력해주세요.");
	   }else if(TEXT03.indexOf(" ") !== -1){
	       $(".process_input_modal_mid").text("공정구분을 선택해주세요.");
	   }else {
	       $(".process_input_modal_mid").text("공정이 추가되었습니다.");
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
	var view3="";
	var clientindex=1;
  	$.each(data,function(index, obj){	//반복문
		view+='<tr>';
		view+='<td><input autocomplete="off" type="checkbox" id="processAdmin_tb_02_checkbox" name="clientNum" value="'+obj.ct_num+'">';
		view+='<label for="processAdmin_tb_02_checkbox"></label></td>';
		view+='<td>'+obj.ct_mutual+'</td>';
		view+='<td>'+obj.ct_num+'</td>';
		view+='<td>'+obj.ct_businessNumber+'</td>';
		view+='<td>'+obj.ct_repName+'</td>';
		view+='</tr>';
		
		view2+='<tr>';
		view2+='<td class="goods_customer_num_Search_td_00">'+clientindex+'</td>';
		view2+='<td class="goods_customer_num_Search_td_00">'+obj.ct_num+'</td>';
		view2+='<td class="goods_customer_num_Search_td_00">'+obj.ct_mutual+'</td>';
		view2+='<td class="goods_customer_num_Search_td_00">'+obj.ct_sortation+'</td>';
		view2+='<input type=hidden value="'+obj.ct_address+'">';
		view2+='</tr>';
		
		clientindex=clientindex+1;
		
		view3+='<li class="option">'+obj.ct_mutual+'</li>';
})
		view+='</tbody>';
		view+='</table>';
  $( '.m06_cus_list_table' ).html(view);
  $( '#customer_tbody' ).html(view2);
  $( '#goods_customer_num_tbody' ).html(view2);
  $( '#m51_Order_customer_num_tbody' ).html(view2);
  $( '#m11_produc_plus_content_01_table_div03_list' ).html(view3);
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
		var view5="";
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
		 view2+='<td class="product_admin_tb_line"><input type="hidden" name="gs_seq_num" value="'+obj.gs_seq_num+'"><input type="hidden" name="gs_standard" value="'+obj.gs_standard+'"><input type="hidden" name="gs_unit" value="'+obj.gs_unit+'">'+obj.gs_num+'</td>';
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
		 view3+='<td><input autocomplete="off" type="checkbox" class="goodsOrderNum" name="goodsOrderNum" value="'+obj.gs_seq_num+'"></td>';
	     view3+='<td class="product_admin_tb_line">'+obj.gs_name+'</td>';
	     view3+='<td class="go_goods_standard">'+obj.gs_standard+'</td>';
	     view3+='<td class="go_goods_unit">'+obj.gs_unit+'</td>';
	     view3+='<td class="go_goods_price">'+obj.gs_price+'</td>';
	     view3+='<td><input type="text" autocomplete="off" class="go_goods_count" id="num1_'+obj.gs_seq_num+'" name="go_goods_count" value="0"></td>'; //주문수량
	     view3+='<td><input type="text" autocomplete="off" class="go_goods_discount" id="num2_'+obj.gs_seq_num+'" name="go_goods_discount" value="0"></td>'; //할인율
	     view3+='<td><input type="text" autocomplete="off" class="goodsamount" id="total_'+obj.gs_seq_num+'" name="go_amount" value="0"></td>'; //금액
	     view3+='</tr>';
		 view4+='<tr>';
	     view4+='<td class="product_admin_tb_line">'+(index+1)+'</td>';
	     view4+='<td class="product_admin_tb_line">'+obj.gs_seq_num+'</td>';
	     view4+='<td class="product_admin_tb_line">'+obj.gs_name+'</td>';
	     view4+='</tr>';
 		 view5+='<tr>';
	     view5+='<td class="product_admin_tb_line">'+(index+1)+'</td>';
	     view5+='<td class="product_admin_tb_line">'+obj.gs_name+'</td>';
	     view5+='<td class="product_admin_tb_line">'+obj.gs_seq_num+'</td>';
	     view5+='</tr>';
	})
	     view+='</tbody>';
	  $( '#product_admin_tb_02' ).html(view);
	  $( '.m07_bom_list_tbody' ).html(view2);
	  $( '#mainbody_51_2_table_tbody' ).html(view3);
	  $( '.m051_product_choice_tbody' ).html(view4);
	  $( '.m12_plan_productSearch_content_tbody' ).html(view5);
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
	     view2='';
		 $.each(data,function(index, obj){	//반복문
		     view+='<tr class="m04_goods_admin_tb_line" id="m04_goods_admin_tb_line">';
		     view+='<td class="product_admin_tb_line_01"><input autocomplete="off" type="checkbox" name="materialNum" value="'+obj.ml_seq_num+'" class="productAdmin_check"></td>';
		     view+='<td class="product_admin_tb_line">'+obj.ml_num+'</td>';
		     view+='<td class="product_admin_tb_line">'+obj.ml_name+'</td>';
		     view+='<td class="product_admin_tb_line">'+obj.ml_family+'</td>';
		     view+='<td class="product_admin_tb_line">'+obj.ml_routing+'</td>';
		     view+='</tr>';

		     view2+='<tr class="m07_bom_localtion_tr">';
		     view2+='<td class="m07_bom_localtion_td_01"><input type="checkbox">';
		     view2+='<input type="hidden" name= "ml_sortation" value="'+obj.ml_sortation+'">'; //구분
		     view2+='<input type="hidden" name= "ml_standard" value="'+obj.ml_standard+'">'; //규격
		     view2+='<input type="hidden" name= "ml_uni" value="'+obj.ml_uni+'">'; //단위
			 view2+='</td>';
		     view2+='<td class="m07_bom_localtion_td_02">'+obj.ml_num+'</td>';
		     view2+='<td class="m07_bom_localtion_td_03">'+obj.ml_name+'</td>';
		     view2+='</tr>';
		})
	     view+='</tbody>';
	  	 $( '#m04_goods_admin_tb_02' ).html(view);
	  	 $( '.m07_bom_localtion_tb tbody' ).html(view2);
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
      $('.customer_input_modal_window').fadeIn();
      var TEXT01 = $('#m06_l_mutual_input').val();
      console.log(TEXT01);
      var TEXT02 = $('#m06_l_name_input').val();
      var TEXT03 = $('#m06_l_bsnum_input').val();
      var TEXT04 = $('#m06_l_person_name_input').val();
      if(TEXT01==""){
         $(".customer_input_modal_mid").text("상호명을 입력해주세요.");
      }else if($('.m06_radio').is(':checked') == false){
         $(".customer_input_modal_mid").text("거래처구분을 선택해주세요.");
      }else if(TEXT02==""){
         $(".customer_input_modal_mid").text("대표자명을 입력해주세요.");
      }else if(TEXT03==""){
         $(".customer_input_modal_mid").text("사업자번호를 입력해주세요.");
      }else if(TEXT04==""){
         $(".customer_input_modal_mid").text("담당자명을 입력해주세요.");
      }else {
         $(".customer_input_modal_mid").text("거래처가 추가되었습니다.");
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
      $('.product_input_modal_window').fadeIn();

      var TEXT01 = $('#m3_l_itemnum_input').val();
      var TEXT02 = $('#m3_l_itemname_input').val();
      var TEXT03 = $('#product_admin_td_03_select_txt').text();
      var TEXT04 = $('#m03_product_admin_td04_select_txt').text();
      if(TEXT01==""){
         $(".product_input_modal_mid").text("품목번호를 입력해주세요.");
      }else if(TEXT02==""){
         $(".product_input_modal_mid").text("품목명을 입력해주세요.");
      }else if(TEXT03.indexOf(" ") !== -1){
         $(".product_input_modal_mid").text("품목구분을 선택해주세요.");
      }else if(TEXT04.indexOf(" ") !== -1){
         $(".product_input_modal_mid").text("단위를 선택해주세요.");
      }else {
         $(".product_input_modal_mid").text("제품이 추가되었습니다.");
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
      }
   })
	
        $(document).on('click', '.mainbody_04_01_btn3', function(e){
      $('.goods_input_modal_window').fadeIn();
      
      var TEXT01 = $('#m4_l_itemnum_input').val();
      var TEXT02 = $('#m4_l_itemname_input').val();
      var TEXT03 = $('#m04_goods_admin_td_03_select_txt').text();
      var TEXT04 = $('#m04_goods_admin_td04_03_select_txt').text();
      if(TEXT01==""){
         $(".goods_input_modal_mid").text("품목번호를 입력해주세요.");
      }else if(TEXT02==""){
         $(".goods_input_modal_mid").text("품목명을 입력해주세요.");
      }else if(TEXT03.indexOf(" ") !== -1){
         $(".goods_input_modal_mid").text("품목구분을 선택해주세요.");
      }else if(TEXT04.indexOf(" ") !== -1){
         $(".goods_input_modal_mid").text("단위를 선택해주세요.");
      }else {
         $(".goods_input_modal_mid").text("자재가 저장되었습니다.");
         var materialVO = {
            company : "fourever",
            ml_num : $("#m4_l_itemnum_input").val(),
            ml_name : $("#m4_l_itemname_input").val(),
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
      }
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
				if(obj.ct_sortation=="매출처"){
					$("#매출처").prop("checked", true);
					$("#매입처").prop("checked", false);
					$("#외주처").prop("checked", false);
				}else if(obj.ct_sortation=="매입처"){
					$("#매출처").prop("checked", false);
					$("#매입처").prop("checked", true);
					$("#외주처").prop("checked", false);
				}else{
					$("#매출처").prop("checked", false);
					$("#매입처").prop("checked", false);
					$("#외주처").prop("checked", true);
				}
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
         $('.product_input_modal_window').fadeIn();

         var TEXT01 = $('#m3_l_itemnum_input').val();
         var TEXT02 = $('#m3_l_itemname_input').val();
         var TEXT03 = $('#product_admin_td_03_select_txt').text();
         var TEXT04 = $('#m03_product_admin_td04_select_txt').text();
         if(TEXT01==""){
            $(".product_input_modal_mid").text("품목번호를 입력해주세요.");
         }else if(TEXT02==""){
            $(".product_input_modal_mid").text("품목명을 입력해주세요.");
         }else if(TEXT03.indexOf(" ") !== -1){
            $(".product_input_modal_mid").text("품목구분을 선택해주세요.");
         }else if(TEXT04.indexOf(" ") !== -1){
            $(".product_input_modal_mid").text("단위를 선택해주세요.");
         }else {
            $(".product_input_modal_mid").text("제품이 수정되었습니다.");
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

         }
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
         $('.goods_input_modal_window').fadeIn();
      
         var TEXT01 = $('#m4_l_itemnum_input').val();
         var TEXT02 = $('#m4_l_itemname_input').val();
         var TEXT03 = $('#m04_goods_admin_td_03_select_txt').text();
         var TEXT04 = $('#m04_goods_admin_td04_03_select_txt').text();
         if(TEXT01==""){
            $(".goods_input_modal_mid").text("품목번호를 입력해주세요.");
         }else if(TEXT02==""){
            $(".goods_input_modal_mid").text("품목명을 입력해주세요.");
         }else if(TEXT03.indexOf(" ") !== -1){
            $(".goods_input_modal_mid").text("품목구분을 선택해주세요.");
         }else if(TEXT04.indexOf(" ") !== -1){
            $(".goods_input_modal_mid").text("단위를 선택해주세요.");
         }else {
            $(".goods_input_modal_mid").text("자재가 수정되었습니다.");
            var materialVO = {
               company : "fourever",
               ml_seq_num : materialUpdateNum,
               ml_num : $("#m4_l_itemnum_input").val(),
               ml_name : $("#m4_l_itemname_input").val(),
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
         }
      })
	
	var selectedLocationClass = "";
    $(document).on('click', '.mainbody_08_01_l_bottom_table tbody tr', function(e){
		selectedLocationClass = $(this);
		selectedLocationClass = selectedLocationClass.find('td:eq(1)');
		selectedLocationClass = selectedLocationClass.text();
		console.log(selectedLocationClass);
		show_location();
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
		     view+='<td><input type="hidden" name="parentName" value="'+obj.lc_parent+'">'+obj.lc_name+'</td>';
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
	
	// 로케이션 분류 리스트를 클릭했을때
	$(document).on('click', '#locationList tr', function(e){
		
	  $('#locationList tr').css("background-color","");
	  $('#locationList tr').css("color","black");
	  $('#mainbody_08_01_r_bottom_table_body tr').css("background-color","");
	  $('#mainbody_08_01_r_bottom_table_body tr').css("color","black");
	  $('.m08_localtion_content_01_01_btn').attr("id","m08_localtion_content_01_01_btn_01");
	  $(this).css("background-color","#999999");
	  $(this).css("color","white");

	location_logic();
	  
	  //상위 로케이션 비우기
	  $("#m08_loca_text_01").text("");
   })
   
   // 로케이션 명을 클릭했을 때
   var selectLocation = "";
   var parentLocation = "";
   var parentLocation_name = "";
   $(document).on('click', '#mainbody_08_01_r_bottom_table_body tr', function(e){

   const Location_inout = document.querySelectorAll('#mainbody_08_01_r_bottom_table_body tr input[name=parentName]');

   console.log(Array.from(Location_inout).filter(v => v.value.includes($(this).children().eq(1).text())).length);
   
   for (i = 0; i < Array.from(Location_inout).filter(v => v.value.includes($(this).children().eq(1).text())).length; i++){
      if(Array.from(Location_inout).filter(v => v.value.includes($(this).children().eq(1).text()))[i].classList.contains('num1')){
         $('#mainbody_08_01_r_bottom_table_body tr').css("background-color","");
         $('#mainbody_08_01_r_bottom_table_body tr').css("color","black");
         $('.m08_localtion_content_01_01_btn').attr("id","m08_localtion_content_01_01_btn_02");
         $(this).css("background-color","#999999");
         $(this).css("color","white");
      
         // 클릭한 요소 부터 다음 parentName이 같은 요소까지 tr 번호를 센다음 그 사이애들은 다 None으로 쳐리
         for (i=0; i<$('#mainbody_08_01_r_bottom_table_body tr').length; i++){
            var num = i+1;
            if($('#mainbody_08_01_r_bottom_table_body tr:nth-child('+num+') td input[name=parentName]').val().includes($(this).children().eq(1).text())){
               $('#mainbody_08_01_r_bottom_table_body tr:nth-child('+num+') td input[name=parentName]').removeClass();
               $('#mainbody_08_01_r_bottom_table_body tr:nth-child('+num+')').css("display","none");
            }
         }
      }else{
         $('#mainbody_08_01_r_bottom_table_body tr').css("background-color","");
         $('#mainbody_08_01_r_bottom_table_body tr').css("color","black");
         $('.m08_localtion_content_01_01_btn').attr("id","m08_localtion_content_01_01_btn_02");
         $(this).css("background-color","#999999");
         $(this).css("color","white");
         for (i=0; i<$('#mainbody_08_01_r_bottom_table_body tr').length; i++){
            var num = i+1;
            if($('#mainbody_08_01_r_bottom_table_body tr:nth-child('+num+') td input[name=parentName]').val() === $(this).children().eq(1).text()){
               $('#mainbody_08_01_r_bottom_table_body tr:nth-child('+num+')').css("display","table-row");
               $('#mainbody_08_01_r_bottom_table_body tr:nth-child('+num+') td input[name=parentName]').addClass('num1');
               $('#mainbody_08_01_r_bottom_table_body tr:nth-child('+num+')').insertBefore($(this).next())
            }
         }
      }
      // Array.from(Location_inout).filter(v => v.value.includes($(this).children().eq(1).text()))

   }

   if(Array.from(Location_inout).filter(v => v.value.includes($(this).children().eq(1).text())).length == 0 ){
      $('#mainbody_08_01_r_bottom_table_body tr').css("background-color","");
      $('#mainbody_08_01_r_bottom_table_body tr').css("color","black");
      $('.m08_localtion_content_01_01_btn').attr("id","m08_localtion_content_01_01_btn_02");
      $(this).css("background-color","#999999");
      $(this).css("color","white");
      for (i=0; i<$('#mainbody_08_01_r_bottom_table_body tr').length; i++){
         var num = i+1;
         if($('#mainbody_08_01_r_bottom_table_body tr:nth-child('+num+') td input[name=parentName]').val() === $(this).children().eq(1).text()){
            $('#mainbody_08_01_r_bottom_table_body tr:nth-child('+num+')').css("display","table-row");
            $('#mainbody_08_01_r_bottom_table_body tr:nth-child('+num+') td input[name=parentName]').addClass('num1');
            $('#mainbody_08_01_r_bottom_table_body tr:nth-child('+num+')').insertBefore($(this).next())
         }
      }

   }
   

      selectLocation = $(this).find('input');
      selectLocation = selectLocation.val();
      parentLocation = $(this).find('td:eq(1)');
      parentLocation = parentLocation.text();
      console.log('db에 저장돼야할것'+parentLocation);
      parentLocation_name = parentLocation.replace(/^\s+/,'').substr(1);
      console.log('모달창에 보여야할것'+parentLocation_name);
      $("#m08_loca_text_01").text(parentLocation_name);
   })
   
	
	function locationInputHtml(){
		console.log(selectLocation);
		$.ajax({
	  		url:"locationSelect.do",
	  		type:"get",
	  		async: false,
	  		success: locationInputHTML,
	  		error:function(data){
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	})
		console.log(selectLocation+"수정하기");
	
		function locationInputHTML(data) {
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
	
		
		
   // 주문 관리 등록 추가
   $(document).on('click', '.mainbody_51_1_top_btn_02', function(e){
      $('.user_group_input_modal_window').fadeIn();
      
      var TEXT01 = $('#m51_product_admin_td_09_01_select_01').text();
      var TEXT02 = $('#go_orderDate').val();
      var TEXT03 = $('#go_dueDate').val();
      var TEXT04 = $('#go_place').val();
      var TEXT05 = $('#go_address').val();
      if(TEXT01== ('\u00A0')){
         $(".user_group_input_modal_mid").text("거래처를 선택해주세요.");
      }else if(TEXT02==""){
         $(".user_group_input_modal_mid").text("접수일자를 선택해주세요.");
      }else if(TEXT03==""){
         $(".user_group_input_modal_mid").text("납기일자를 선택해주세요.");
      }else if(TEXT04==""){
         $(".user_group_input_modal_mid").text("고객발주번호를 입력해주세요.");
      }else if(TEXT05==""){
         $(".user_group_input_modal_mid").text("배송지를 입력해주세요.");
      }else if($('#go_taxation').is(':checked') == false){
         $(".user_group_input_modal_mid").text("과세형태를 선택해주세요.");
      }else {
         $(".user_group_input_modal_mid").text("주문이 등록되었습니다.");

         var go_goods_seq = "";
         var go_goods_name = "";
         var go_goods_count = "";
         var go_goods_discount = ""; //추가 할인율
         var go_goods_price = ""; //추가 금액
         var go_goods_standard = ""; //또추가
         var go_goods_unit = ""; //또추가
         var go_goods_unitPrice = ""; //또추가
         var go_price = "";
         var num = 0;
         
         num = 0;
         $(".product_name").each(function(e){
            console.log(num);
            if(num===0){
               go_goods_name+=$(this).text();
               go_goods_seq+=$(this).prev().find("input").val();
               go_goods_count+=$(this).next().next().next().next().find("input").val();
               go_price+=$(this).parent().find("input[name=go_amount]").val();
               go_goods_discount+=$(this).parent().find("input[name=go_goods_discount]").val();
               go_goods_price+=$(this).parent().find("input[name=go_goods_price]").val();
               go_goods_standard+=$(this).parent().find(".go_goods_standard").text();
               go_goods_unit+=$(this).parent().find(".go_goods_unit").text();
               go_goods_unitPrice+=$(this).parent().find(".go_goods_price").text();
            }else {
               go_goods_name+=",";
               go_goods_name+=$(this).text();
               go_goods_seq+=",";
               go_goods_seq+=$(this).prev().find("input").val();
               go_goods_count+=",";
               go_goods_count+=$(this).next().next().next().next().find("input").val();
               go_price+=",";
               go_price+=$(this).parent().find("input[name=go_amount]").val();
               go_goods_discount+=",";
               go_goods_discount+=$(this).parent().find("input[name=go_goods_discount]").val();
               go_goods_price+=",";
               go_goods_price+=$(this).parent().find("input[name=go_goods_price]").val();
			   go_goods_standard+=$(this).parent().find(".go_goods_standard").text();
               go_goods_standard+=",";
               go_goods_unit+=$(this).parent().find(".go_goods_unit").text();
               go_goods_unit+=",";
               go_goods_unitPrice+=$(this).parent().find(".go_goods_price").text();
               go_goods_unitPrice+=",";
            }num=1;
         })
            console.log(go_goods_name);
         var goodsOrderVO = {
         company : "fourever",
         go_num : $("#go_num").text(),
         go_goods_seq : go_goods_seq,
         go_goods_name : go_goods_name,
         go_goods_count : go_goods_count,
         go_goods_standard : go_goods_standard,
         go_goods_unit : go_goods_unit,
         go_goods_unitPrice : go_goods_unitPrice,
         go_goods_discount : go_goods_discount,
         go_goods_price : go_goods_price,
         go_client : $("#m51_product_admin_td_09_01_select_01").text(),
         go_orderDate : $("#go_orderDate").val(),
         go_dueDate : $("#go_dueDate").val(),
         go_place : $("#go_place").val(),
         go_address : $("#go_address").val(),
         go_price : go_price,
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
      }
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
			var view2="";
			  $.each(data,function(index, obj){	//반복문
			     view+='<tr>';
			     view+='<td><input type="checkbox" name="goodsOrderDeleteNum" value="'+obj.go_num+'"></td>';
		         view+='<td>'+obj.go_orderDate+'</td>'; 
		         view+='<td>'+obj.go_num+'</td>'; 
		         view+='<td>'+obj.go_client+'</td>'; 
		         view+='<td>'+obj.go_goods_seq+'</td>'; 
		         view+='<td>'+obj.go_goods_name+'</td>'; 
		         view+='<td>'+obj.go_goods_count+'</td>'; 
		         view+='<td>'+obj.go_price+'</td>'; 
		         view+='<td>'+obj.go_dueDate+'</td>'; 
		         view+='<td></td>'; 
		         view+='</tr>'; 
				 view2+='<tr>';
		         view2+='<td class="m11_work_orderPlan_plus_Search_td_00">'+obj.go_num+'</td>'; 
		         view2+='<td class="m11_work_orderPlan_plus_Search_td_00">'+obj.go_client+'</td>'; 
		         view2+='<td class="m11_work_orderPlan_plus_Search_td_00">'+obj.go_goods_seq+'</td>'; 
		         view2+='<td class="m11_work_orderPlan_plus_Search_td_00">'+obj.go_goods_name+'</td>'; 
		         view2+='<td class="m11_work_orderPlan_plus_Search_td_00">'+obj.go_goods_count+'</td>'; 
		         view2+='</tr>'; 
			  })
		  $( '#m52_output_view_tb_tbody' ).html(view);
		  $( '.m11_work_orderPlan_plus_Search_tb tbody' ).html(view2);
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
				$(this).find("td:eq(1)").attr("class", "product_name");
			}

	    })
		
		
	})
	
	//주문 관리 거래처 클릭하면 추가
	$(document).on('click', '#m51_Order_customer_num_tbody tr', function(e){
		var selected = $(this).find("td:eq(2)").text();
		var selectedaddress = $(this).find("input").val();
		$("#m51_product_admin_td_09_01_select_01").text(selected);
		$("#go_address").val(selectedaddress);
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
		
		var go_price = 0;
		$('.goodsamount').each(function() {
			go_price+=parseInt($(this).val());
			if (isNaN(this.value) || this.value === '') {
				$(this).val(0);
			}
		})
		$("#go_price").val(go_price);
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
	
		var go_price = 0;
		$('.goodsamount').each(function() {
			go_price+=parseInt($(this).val());
			if (isNaN(this.value) || this.value === '') {
				$(this).val(0);
			}
		})
		$("#go_price").val(go_price);
		
	})
	
	$(document).on('click', 'input:radio[name=taxation]', function(e) {
			console.log("클릭 들어옴");
		if ($(this).val()=="영세"||$(this).val()=="면세"){
			$("#go_amount").val($("#go_price").val());
		}else{
			$("#go_amount").val(parseInt($("#go_price").val())*1.1);
		}
		
	})
	
	$(document).on('click', '.process_plan_btn_02', function(e) {
		var productPlanVO = {
			company : "fourever",
			pp_date : $("#pp_date").val(),
			pp_goods_name : $("#pp_goods_name").text(),
			pp_goods_num : $("#pp_goods_num").text(),
			pp_product_date : $("#pp_product_date").val(),
			pp_quantity : $("#pp_quantity").val(),
			pp_performance_quantity : $("#pp_performance_quantity").val()
		};
	
		$.ajax({
			url : "productPlanInsert.do",
			type : "GET",
			async:false,
			data : productPlanVO,
			// dataType : "json",
			success : function(){
				console.log("success");},
			error : function(request, status, error){
			    console.log("생산 계획 입력 error");
				}
		});
		
		
	})	
	$(document).on('click', '.m12_plan_productSearch_content_tbody tr', function(e) {
		$("#pp_goods_name").text($(this).find("td:eq(1)").text());
		$("#pp_goods_num").text($(this).find("td:eq(2)").text());
		m12_plan_productModalClose();
	})
	
	
	/** 생산계획 조회  */
	function show_product_plan(){
		$.ajax({
		  		url:"productPlanSelect.do",
		  		type:"get",
		  		async: false,
				data: {company: 'fourever'},
		  		success:ajaxHtml,
		  		error:function(data){ 
		  			let str = JSON.stringify(data);
		  			console.log(str);
		  		}
		  	});
	
	function ajaxHtml(data){
		var view="";
		var view2="";
		  $.each(data,function(index, obj){	//반복문
		     view+='<tr>'; 
		     view+='<td><input type="checkbox" name="productionPlanNum" value="'+obj.pp_num+'"></td>'; 
		     view+='<td>'+obj.pp_goods_name+'</td>'; 
		     view+='<td>'+obj.pp_goods_num+'</td>'; 
		     view+='<td>'+obj.pp_product_date+'</td>'; 
		     view+='<td>'+obj.pp_quantity+'</td>'; 
		     view+='<td>'+obj.pp_performance_quantity+'</td>'; 
		     view+='</tr>'; 
			 view2+='<tr>'; 
		     view2+='<td class="m11_work_order_plus_Search_td_00"><input type="hidden" value="'+obj.pp_num+'">'+obj.pp_product_date+'</td>'; 
		     view2+='<td class="m11_work_order_plus_Search_td_00">'+obj.pp_goods_num+'</td>'; 
		     view2+='<td class="m11_work_order_plus_Search_td_00">'+obj.pp_goods_name+'</td>'; 
		     view2+='<td class="m11_work_order_plus_Search_td_00"></td>'; 
		     view2+='<td class="m11_work_order_plus_Search_td_00">'+obj.pp_quantity+'</td>'; 
		     view2+='</tr>'; 
		  })
	  $( '#produce_plan_tb_02_tbody' ).html(view);
	  $( '.m11_work_order_plus_Search_tb tbody' ).html(view2);
	}}
	


	// 생산계획 삭제
	$(document).on('click', '.process_plan_btn_01', function(e){
		productPlanDelete();
	})
	
	function productPlanDelete() {
		var len = $("input[name='productionPlanNum']:checked").length;
		if(len == 1){
			var value = $("input[name='productionPlanNum']:checked").val();
			$.ajax({
				url : "productPlanDelete.do",
				type : "GET",
				async:false,
				data : {"pp_num":value},
				success : function(){
					console.log(" 삭제 success");},
				error : function(request, status, error){
				    console.log("삭제 error");}
			});
			}else { //개수를 체크하고 2개부터는 each함수를 통해 각각 가져온다.
			    $("input[name='productionPlanNum']:checked").each(function(e){
		        var value = $(this).val();
				console.log(value);
				$.ajax({
					url : "productPlanDelete.do",
					type : "GET",
					async:false,
					data : {"pp_num":value},
					success : function(){
						console.log(" 삭제 success");},
					error : function(request, status, error){
					    console.log("삭제 error");}
					});
			
			    })
			}
		show_product_plan();	
	}
	
	
	// 생산 계획 수정하기
	var productPlanUpdateNum = 0;
    $(document).on('click', '#produce_plan_tb_02_tbody tr', function(e){
		productPlanUpdateNum = $(this).find("input").val();
		$.ajax({
	  		url:"productPlanSelect.do",
	  		type:"get",
	  		async: false,
			data : {company: 'fourever'},
	  		success:processinputHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});

	// input에 db 내용 보여주기
	function processinputHtml(data){
		var view="";
		console.log(productPlanUpdateNum+"수정하기");
		$.each(data,function(index, obj){	//반복문
		     if(obj.pp_num==productPlanUpdateNum){
		    	 $('#pp_date').val(obj.pp_date);
		    	 $('#pp_goods_name').text(obj.pp_goods_name);
		    	 $('#pp_goods_num').text(obj.pp_goods_num);
		    	 $('#pp_product_date').val(obj.pp_product_date);
		    	 $('#pp_quantity').val(obj.pp_quantity);
		    	 $('#pp_performance_quantity').val(obj.pp_performance_quantity);
		     }
		})
		}
		$('.process_plan_btn_02').attr('onclick','processUpdate()');
	
	})
	
	
	// 작업 지시 생성 클릭
	// 주문 가져오기
    $(document).on('click', '.m11_work_orderPlan_plus_Search_tb tr', function(e){
		var go_num =  $(this).find("td:eq(0)").text();
		$.ajax({
	  		url:"goodsOrderSelect.do",
	  		type:"get",
	  		async: false,
			data : {company: 'fourever'},
	  		success:processinputHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});

		function processinputHtml(data){
			var view="";
			$.each(data,function(index, obj){
		console.log("주문"+go_num);
			     if(obj.go_num==go_num){
			    	 $('#wo_go_num').text(obj.go_num);
					 $('.mainbody_11_01_top_04_01').text("");
			    	 $('.mainbody_11_01_top_05_01').text(obj.go_num);
			    	 $('#wo_go_client').text(obj.go_client);
			    	 $('#wo_go_dueDate').text(obj.go_dueDate);
			    	 $('#wo_go_place').text(obj.go_place);
			    	 $('#wo_go_goods_seq').text(obj.go_goods_seq);
			    	 $('#wo_go_goods_name').text(obj.go_goods_name);
					 $('#wo_pp_performance_quantity').text(""); //수량 id 지정후 넣기
			     }
			})
		}
	m11_workOrder_modal_close();
	})
	
	// 작업 지시 생성 클릭
	// 생산계획 가져오기
    $(document).on('click', '.m11_work_order_plus_Search_tb tr', function(e){
		var pp_num =  $(this).find("input").val();
		$.ajax({
	  		url:"productPlanSelect.do",
	  		type:"get",
	  		async: false,
			data : {company: 'fourever'},
	  		success:processinputHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});

		function processinputHtml(data){
			var view="";
			$.each(data,function(index, obj){
			     if(obj.pp_num==pp_num){
				console.log(pp_num);
					 $('.mainbody_11_01_top_05_01').text("");
			    	 $('.mainbody_11_01_top_04_01').text(obj.pp_num);
			    	 $('#wo_go_num').text(obj.pp_num);
			    	 $('#wo_go_client').text("");
			    	 $('#wo_go_dueDate').text(obj.pp_date);
			    	 $('#wo_go_place').text(""); //고객발주번호
			    	 $('#wo_go_goods_seq').text(obj.pp_goods_num);
			    	 $('#wo_go_goods_name').text(obj.pp_goods_name);
			    	 $('#wo_pp_performance_quantity').text(obj.pp_performance_quantity); //수량 id 지정후 넣기
			     }
			})
		}
	m11_workOrder_modal_close();
	})
	
	
	var indexx=1;
	// 생산품목 입력
	$(document).on('click', '.m11_produc_plus_content_01_table_btn', function(e) {
		var productItemVO = {
			company : "fourever",
			pi_date : $("#pi_date").val(),
			pi_process : $(".m11_produc_plus_content_01_table_div02_txt").text(),
			pi_process_type : $(".m11_produc_plus_content_01_table_div02_1").text(),
			pi_client : $(".m11_produc_plus_content_01_table_div03_txt").text(),
			pi_material : $(".m11_produc_plus_content_01_table_div04_txt").text(),
			pi_material_count : $("#pi_material_count").val(),
			pi_material_unit : $(".m11_produc_plus_content_01_table_div0_1").text(),
			pi_content : $("#pi_content").val(),
			pi_start_date : $("#pi_start_date").val(),
			pi_end_date : $("#pi_end_date").val(),
			pi_move : $(".m11_produc_plus_content_01_table_div06_txt").text(),
			pi_move_name : $(".m11_produc_plus_content_01_table_div02_1").text(),
			pi_move_address : $("#pi_move_address").val(),
			pi_memo : $("#pi_memo").val()
		};
	
		$.ajax({
			url : "productItemInsert.do",
			type : "GET",
			async:false,
			data : productItemVO,
			// dataType : "json",
			success : addwork_order_tb_02_list,
			error : function(request, status, error){
			    console.log("생산품목 입력 error");
				}
		});
		
	function addwork_order_tb_02_list(data){
		var work_order_tb_02_list = $(".work_order_tb_02 tbody").html();
		console.log(work_order_tb_02_list);
		work_order_tb_02_list+='<tr>';
		work_order_tb_02_list+='<td><input type="checkbox" name="product_item_delete"></td>';
		work_order_tb_02_list+='<td>'+productItemVO.pi_date+'</td>';
		work_order_tb_02_list+='<td>'+indexx+'</td>';
		work_order_tb_02_list+='<td class="wo_process">'+productItemVO.pi_process+'</td>';
		work_order_tb_02_list+='<td class="wo_process_type">'+productItemVO.pi_process_type+'</td>';
		work_order_tb_02_list+='<td class="var wo_goods_name">'+productItemVO.pi_material+'</td>';
		work_order_tb_02_list+='<td>'+productItemVO.pi_material_unit+'</td>';
		work_order_tb_02_list+='<td class="wo_count">'+productItemVO.pi_material_count+'</td>';
		work_order_tb_02_list+='<td class="wo_start_date">'+productItemVO.pi_start_date+'</td>';
		work_order_tb_02_list+='<td class="wo_end_date">'+productItemVO.pi_end_date+'</td>';
		work_order_tb_02_list+='<td></td>';
	    work_order_tb_02_list+='</tr>';
		$(".work_order_tb_02 tbody").html(work_order_tb_02_list);
		}
		indexx+=1;
	})	
	
	// 작업 지시 입력
	$(document).on('click', '.mainbody_11_01_top_btn_02', function(e) {
		var num = 0;
		var wo_process = "";
		var wo_process_type = "";
		var wo_goods_num = "";
		var wo_goods_name = "";
		var wo_count = "";
		var wo_start_date = "";
		var wo_end_date = "";
		
		num = 0;
		$(".wo_process").each(function(e){
			if(num===0){
				wo_process+=$(this).text();
			}else {
				wo_process+="<br>";
				wo_process+=$(this).text();
			}num=1;
		})
		num = 0;
		$(".wo_goods_num").each(function(e){
			if(num===0){
				wo_goods_num+=$(this).text();
			}else {
				wo_goods_num+="<br>";
				wo_goods_num+=$(this).text();
			}num=1;
		})
		num = 0;
		$(".wo_goods_name").each(function(e){
			if(num===0){
				wo_goods_name+=$(this).text();
			}else {
				wo_goods_name+="<br>";
				wo_goods_name+=$(this).text();
			}num=1;
		})
		num = 0;
		$(".wo_count").each(function(e){
			if(num===0){
				wo_count+=$(this).text();
			}else {
				wo_count+="<br>";
				wo_count+=$(this).text();
			}num=1;
		})
		num = 0;
		$(".wo_start_date").each(function(e){
			if(num===0){
				wo_start_date+=$(this).text();
			}else {
				wo_start_date+="<br>";
				wo_start_date+=$(this).text();
			}num=1;
		})
		num = 0;
		$(".wo_end_date").each(function(e){
			if(num===0){
				wo_end_date+=$(this).text();
			}else {
				wo_end_date+="<br>";
				wo_end_date+=$(this).text();
			}num=1;
		})
		
		var workOrderVO = {
		company : "fourever",
		wo_process : wo_process,
		wo_process_type : wo_process_type,
		wo_goods_num : wo_goods_num,
		wo_goods_name : wo_goods_name,
		wo_spec_name : $("#go_orderDate").val(),
		wo_count : wo_count,
		wo_client : $("#wo_go_client").text(),
		wo_date : $("#wo_go_dueDate").text(),
		wo_start_date : wo_start_date,
		wo_end_date : wo_end_date
		};
		$.ajax({
				url : "workOrderInsert.do",
				type : "GET",
				async:false,
				data : workOrderVO,
				// dataType : "json",
				success : function(){
					console.log("success");
					},
				error : function(request, status, error){
				    console.log("주문 입력 error");
					}
			});
	
	
	})
	
	
	function show_work_order(){
	$.ajax({
	  		url:"workOrderSelect.do",
	  		type:"get",
	  		async: false,
	  		data: {company:'fourever'},
	  		success:materialHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			console.log(str);
	  		}
	  	});
	
	
		function materialHtml(data){
			var view="";
			 $.each(data,function(index, obj){	//반복문
			     view+='<tr>';
			     view+='<td><input type="checkbox" name="work_order_delete" value="'+obj.wo_num+'"></td>';
			     view+='<td></td>';
			     view+='<td>'+obj.wo_process+'</td>';
			     view+='<td>'+obj.wo_process_type+'</td>';
			     view+='<td>'+obj.wo_goods_num+'</td>';
			     view+='<td>'+obj.wo_goods_name+'</td>';
			     view+='<td>'+obj.wo_spec_name+'</td>';
			     view+='<td>'+obj.wo_count+'</td>';
			     view+='<td>'+obj.wo_client+'</td>';
			     view+='<td>'+obj.wo_date+'</td>';
			     view+='<td>'+obj.wo_start_date+'</td>';
			     view+='<td>'+obj.wo_end_date+'</td>';
			     view+='<td></td>';
			     view+='</tr>';
			})
		  	 $( '.process_order_view_tb tbody' ).html(view);
		}
	
	}
	
	
	$(document).on('click', '.mainbody_11_03_top_btn_05', function(e) {
		$("input[name='product_item_delete']:checked").each(function(e){
	        $(this).parent().parent().remove();
		    })
	})
	
	
	$(document).on('click', '.mainbody_14_01_top_btn_03', function(e) {
		var len = $("input[name='work_order_delete']:checked").length;
		if(len == 1){
			var value = $("input[name='work_order_delete']:checked").val();
			$.ajax({
				url : "workOrderDelete.do",
				type : "GET",
				async:false,
				data : {"wo_num":value},
				// dataType : "json",
				success : function(){
						$("input[name='work_order_delete']:checked").remove();
					console.log(" 삭제 success");},
				error : function(request, status, error){
				    console.log("삭제 error");}
		});
		}else { //개수를 체크하고 2개부터는 each함수를 통해 각각 가져온다.
		    $("input[name='work_order_delete']:checked").each(function(e){
		        var value = $(this).val();
				console.log(value);
				$.ajax({
					url : "workOrderDelete.do",
					type : "GET",
					async:false,
					data : {"wo_num":value},
					// dataType : "json",
					success : function(){
						console.log(" 삭제 success");},
					error : function(request, status, error){
					    console.log("삭제 error");}
				});
	
		    })
		}
		show_work_order();
	})
	

	
	//라우팅 클릭
    $(document).on("click", ".routing_modal_body_bottom_l_table tbody tr", function(){

        const table = document.getElementById('routing_modal_body_bottom_r_table_tbody');
        $(this).remove();
        
        const click_td1 = $(this).children().eq(0).html();
        const click_td2 = $(this).children().eq(1).html();

        console.log(click_td1);
        const newRow = table.insertRow();
        const newCel1 = newRow.insertCell(0);
        const newCel2 = newRow.insertCell(1);
        
        newCel1.innerHTML = click_td1;
        newCel2.innerHTML = click_td2;
        newCel2.firstChild.setAttribute("value", "2");
    });


    $(document).on("click", ".routing_modal_body_bottom_r_table tbody tr", function(){

        const table = document.getElementById('routing_modal_body_bottom_l_table_tbody');
        $(this).remove();
        const click_td1 = $(this).children().eq(0).html();
        const click_td2 = $(this).children().eq(1).html();

        const newRow = table.insertRow();
        const newCel1 = newRow.insertCell(0);
        const newCel2 = newRow.insertCell(1);

        newCel1.innerHTML = click_td1;
        newCel2.innerHTML = click_td2;
		newCel2.firstChild.setAttribute("value", "1");
    });
	
	
	$(document).on('click', '.routing_modal_body_top_save_btn', function(e) {
		routingInsert();
		
	})
	
	function routingInsert(){
		var prr_left = "";
		var prr_right = "";
		$("input[name='routing']").each(function(e){
			if ($(this).val()==1){
				prr_left+=$(this).parent().prev().find("input").val();
				prr_left+=',';
			}else{
				prr_right+=$(this).parent().prev().find("input").val();
				prr_right+=',';
			}
		})
		processRoutingVO = {
			prr_name : $('#prr_name').val(),
			prr_left : prr_left,
			prr_right : prr_right,
			company : 'fourever'
		}
		console.log(processRoutingVO.prr_name);
		$.ajax({
				url : "processRoutingInsert.do",
				type : "GET",
				async:false,
				data : processRoutingVO,
				success : function(){
					console.log(" success");},
				error : function(request, status, error){
				    console.log(" error");}
		});
		show_process_routing();
	}
	
	function show_process_routing(){
		$.ajax({
				url : "processRoutingSelect.do",
				type : "GET",
				async:false,
				data : {company: 'fourever'},
				success : routingHtml,
				error : function(request, status, error){
				    console.log(" error");}
		});
		
		function routingHtml(data){
			var view = "";
			$.each(data,function(index, obj){
				view+='<li class="option">'+obj.prr_name+'</li>';
			})
			$(".m03_product_admin_td06_div ul").html(view);
			$(".m04_goods_admin_td06_02_00 ul").html(view);
		}
		
	}
	
	
	
	
	 function enterkey4() {
      if (window.event.keyCode == 13) {
            for(i=0; i<$("#m52_output_view_tb_tbody tr").length; i++){
                num = i+1;
				if($('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(2)').text().length >9){
	               $('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(2)').text($('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(2)').text().substr(2));
	            }
                if($('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(5)').text().match(",")){
                    console.log("품목이 2개 이상");
                    var TEXT01_01 = $('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(5)').text().split(",");
                    var TEXT02_01 = $('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(6)').text().split(",");
                    var TEXT03_01 = $('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(7)').text().split(",");
					var TEXT04_01 = $('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(8)').text().split(",");
                    for(i=0; i<TEXT01_01.length; i++){
                        $('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(5)').text(TEXT01_01[0]);
                        $('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(6)').text(TEXT02_01[0]);
                        $('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(7)').text(TEXT03_01[0]);
						$('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(8)').text(TEXT04_01[0])
                        if(i==1){
                            console.log(num);
                            console.log(i);
                            console.log(num-i);
                            $('#m52_output_view_tb_tbody tr').eq(num-1).after('<tr><td><img src="./resources/img/주문관리/리스트.png"></td><td>'+$('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(2)').text()+'</td><td>'+$('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(3)').text()+'</td><td>'+$('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(4)').text()+'</td><td>'+TEXT01_01[i]+'</td><td>'+TEXT02_01[i]+'</td><td>'+TEXT03_01[i]+'</td><td>'+TEXT04_01[i]+'</td><td>'+$('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(9)').text()+'</td><td>'+$('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(10)').text()+'</td></tr><tr><tr>');
                        }else if(i>1){
                            $('#m52_output_view_tb_tbody tr').eq(num+i-1).after('<tr><td><img src="./resources/img/주문관리/리스트.png"></td><td>'+$('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(2)').text()+'</td><td>'+$('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(3)').text()+'</td><td>'+$('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(4)').text()+'</td><td>'+TEXT01_01[i]+'</td><td>'+TEXT02_01[i]+'</td><td>'+TEXT03_01[i]+'</td><td>'+TEXT04_01[i]+'</td><td>'+$('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(9)').text()+'</td><td>'+$('#m52_output_view_tb_tbody tr:nth-child('+num+') td:nth-child(10)').text()+'</td></tr><tr><tr>');
                        }
                    }
                }
            }
        }
    }
	
	 $(document).on('click', '.m051_product_choice_tbody tr', function(e){
        $('.m51_product_choice_Modal').fadeOut();
    })
	
	$(document).on('click', '.mainbody_51_2_bottom_btn_2_01', function(e){
        
    })
	
	
	
	// 로케이션 추가 버튼
	//로케이션 분류를 클릭했을 때
	    $(document).on('click', '#m08_localtion_content_01_01_btn_01', function(e){
		var locationVO = {
			company : "fourever",
			lc_class : selectedLocationClass,
			lc_parent : $("#m08_loca_text_01").text(),
			lc_name : '└&nbsp;'+$("#lc_name").val(),
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
	
	//로케이션 명을 선택했을때
   $(document).on('click', '#m08_localtion_content_01_01_btn_02', function(e){
		var name_space = parentLocation.split("└");
		name_space = "&nbsp;&nbsp;&nbsp;"+name_space[0]+"└&nbsp;";
		var locationVO = {
			company : "fourever",
			lc_class : selectedLocationClass,
			lc_parent : parentLocation,
			lc_name : name_space+$("#lc_name").val(), //부모를 가져와서 공백 3개 더하기
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
	
	////////BOM 관리//////////
	// 품목 클릭하면 오른쪽에 보이게
	var gs_seq_num = "";
	$(document).on('click', '.m07_bom_list_tbody tr', function(e){
		gs_seq_num = $(this).find("input[name=gs_seq_num]").val()
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

		function goodsinputHtml(data){
			var view="";
			  $.each(data,function(index, obj){
			     if(obj.gs_seq_num==gs_seq_num){
					view ='<tr class="m07_cate_name_10 main">';
					view+='<td class="m07_cate_main_name_11">&nbsp;― [완제품]'+obj.gs_name+'</td>'
					view+='<td class="m07_cate_main_name_12">'+obj.gs_num+'</td>'
					view+='<td class="m07_cate_main_name_13">1</td>'
					view+='<td class="m07_cate_main_name_14">'+obj.gs_standard+'</td>'
					view+='<td class="m07_cate_main_name_15">'+obj.gs_unit+'</td>'
					view+='<td class="m07_cate_main_name_16">'
					view+='<div class="m07_bom_list_tbody_btn_02_01">'
					view+='<button class="m07_bom_list_tbody_btn_02_02">'
					view+='<img src="./resources/img/BOM/부품추가.png">'
					view+='</button>'
					view+='</div>'
					view+='</td>'
					view+='</tr>'
			     }
			})
		$(".m07_le_bom_list_tbody").html(view);
		}
		show_bom();
	})
	
	// bom 추가버튼 누르기 
	var parentOfBom = "";
	$(document).on('click', '.m07_bom_list_tbody_btn_02_02', function(e){
		parentOfBom= $(this).parent().parent().parent().find('td:eq(0)').text();
		console.log(parentOfBom);
		$('.m07_bom_locationModal').fadeIn();
		
	})
	
	// 모달창에서 자재 클릭하면 추가되기 
	$(document).on('click', '.m07_bom_localtion_tr', function(e){
		console.log(parentOfBom+"추가하기")
		var ml_sortation = $(this).find('input[name=ml_sortation]').val();
		var ml_name = $(this).find('td:eq(2)').text();
		if(parentOfBom.indexOf("└") !== -1){
			var b_name = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└['+ml_sortation+']'+ml_name;
			console.log("원자재의 bom")
		}else{
			var b_name = '&nbsp;&nbsp;&nbsp;└['+ml_sortation+']'+ml_name;
			console.log("완제품의 bom")
		}
		var b_num = $(this).find('td:eq(1)').text();
		var b_standard = $(this).find('input[name=ml_standard]').val();
		var b_unit = $(this).find('input[name=ml_uni]').val();
		var bomVO = {
			b_goods_seq: gs_seq_num,
			b_parent: parentOfBom,
			b_name: b_name,
			b_num: b_num,
			b_count: 0,
			b_standard: b_standard,
			b_unit: b_unit,
			company: 'fourever'
		}
		$.ajax({
	         url : "bomInsert.do",
	         type : "GET",
	         async:false,
	         data : bomVO,
	         // dataType : "json",
	         success : function(){
	            console.log("공정 입력 success");},
	         error : function(request, status, error){
	             console.log("공정 입력 error");}
	      });
		
	})
	
	function show_bom(){
		$.ajax({
	         url : "bomSelect.do",
	         type : "GET",
	         async:false,
	         data : {b_goods_seq: gs_seq_num},
	         success : goodsinputHtml,
	         error : function(request, status, error){
	             console.log("bom 조회 error");}
	      });
		function goodsinputHtml(data){
			var view="";
			  $.each(data,function(index, obj){
				view+='<tr class="m07_cate_name_10 main">';
				view+='<td class="m07_cate_main_name_11"><input type="hidden" name="vomParent" value="'+obj.b_parent+'">'+obj.b_name+'</td>'
				view+='<td class="m07_cate_main_name_12">'+obj.b_num+'</td>'
				view+='<td class="m07_cate_main_name_13"><input type="text" name="b_count" style="width: 50%;"></td>'
				view+='<td class="m07_cate_main_name_14">'+obj.b_standard+'</td>'
				view+='<td class="m07_cate_main_name_15">'+obj.b_unit+'</td>'
				view+='<td class="m07_cate_main_name_16">'
				view+='<div class="m07_bom_list_tbody_btn_02_01">'
				view+='<button class="m07_bom_list_tbody_btn_02_02">'
				view+='<img src="./resources/img/BOM/부품추가.png">'
				view+='</button>'
				view+='</div>'
				view+='</td>'
				view+='</tr>'
			})
			var dd = $(".m07_le_bom_list_tbody").html();
		$(".m07_le_bom_list_tbody").html(dd+view);
		}
		
	}
	
	// 주문 내역 더블클릭
    $(document).on("dblclick", "#m52_output_view_tb_tbody tr", function(){
		var goodsOrderDeleteNum = $(this).find("input[name=goodsOrderDeleteNum]").val();
		console.log(goodsOrderDeleteNum);
		
		//여기에 html 넣기
			$.ajax({
	         url : "goodsOrderSelectSequence.do",
	         type : "GET",
	         async:false,
	         data : {go_num: goodsOrderDeleteNum},
	         success : hhhtttmmmlll,
	         error : function(request, status, error){
	             console.log("bom 조회 error");}
	      	});

			function hhhtttmmmlll(data){
				  $.each(data,function(index, obj){
					 $("#go_num").text(data.go_num);
					 $("#m51_product_admin_td_09_01_select_01").text(data.go_client);
			         $("#go_orderDate").val(data.go_orderDate);
			         $("#go_dueDate").val(data.go_dueDate);
			         $("#go_place").val(data.go_place);
			         $("#go_address").val(data.go_address);
			         $("#go_price").val(data.go_price);
			         $("#go_amount").val(data.go_amount);
					 if(data.go_taxation=="과세"){
				         $("#과세").prop("checked", true);
				         $("#영세").prop("checked", false);
				         $("#면세").prop("checked", false);
					 }else if(data.go_taxation=="과세"){
				         $("#과세").prop("checked", false);
				         $("#영세").prop("checked", true);
				         $("#면세").prop("checked", false);
					 }else {
				         $("#과세").prop("checked", false);
				         $("#영세").prop("checked", false);
				         $("#면세").prop("checked", true);
					 }
					$("#mainbody_51_2_table_tbody tr").each(function(e){
						console.log($(this));
				        goodsOrderNumdd = $(this).firstChild;
						var jbSplit = data.go_goods_seq.split( ',');
					      for ( var i in jbSplit ) {
						if(goodsOrderNumdd==i){
							
							$(this).css("display", "table");
							$(this).find("td:eq(1)").attr("class", "product_name");
					      }
						}
					})
		
			    })
			}
		
		/////////////
		
        $('.mainbody_51_1_top_btn_02').attr('class','mainbody_51_1_top_btn_02_update');
       show_client();
       show_goods();
        document.getElementById("main_title").innerHTML = "주문 관리&nbsp; > &nbsp;주문 관리"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_51").css("display", "flex");
        $(".mainbody_52").css("display", "none");

		
    })
	
	
	    function location_logic() {
        // name="parentName" value="undefined"
        for (i=0; i<$('#mainbody_08_01_r_bottom_table_body tr').length; i++){
            var num = i+1;
            if($('#mainbody_08_01_r_bottom_table_body tr:nth-child('+num+') td input[name=parentName]').val() === "undefined"){
                $('#mainbody_08_01_r_bottom_table_body tr:nth-child('+num+')').css("display","table-row");
            }
        }

    }

    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	