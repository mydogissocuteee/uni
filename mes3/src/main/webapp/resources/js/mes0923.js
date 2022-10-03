/**
 * 
 */
function u_r_t_btn02_click() {
	var MemberVO = {
			company : "fourever",
			userid : $("#u_input_id").val(),
			username : $("#u_input_name").val(),
			userpw : $("#u_input_pw").val(),
			mainProcess : $("#u_input_main").val(),
			userRight : $("#u_input_author").val(),
			department : $("#u_input_groupname").val(),
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
				alert("success");},
			error : function(request, status, error){
			    alert("회원가입 error");
			    alert("code: " + request.status);
			    alert("message: " + request.responseText);
			    alert("error: " + error);}
		});
		
		/* list 가져오기 */
		
		
	  	$.ajax({
	  		url:"userSelect.do",
	  		type:"get",
	  		async: false,
	  		success:ajaxHtml,
	  		error:function(data){ 
	  			let str = JSON.stringify(data);
	  			alert(str);
		var view="view되나";
	  			$.each(data,function(index, obj){	//반복문
	  				alert("반복");
	  	         view+="플러스되나";
	  	         view+="<tr>";
	  	         view+="<td>"+obj.username+"</td>";
	  	         view+="<td>"+obj.userpw+"</td>";
	  	         view+="<td>"+obj.mainProcess+"</td>";
	  	         view+="<td>"+obj.userRight+"</td>";
	  	         view+="<td>"+obj.department+"</td>";
	  	         view+="<td>"+obj.contact+"</td>";
	  	         view+="<td>"+obj.email+"</td>";
	  	         view+="</tr>"; 
	  	  	});
	  			$( '#list_Data' ).html(view);
	  		}
	  	});
		
		function ajaxHtml(data){
			alert("select되나");
			var view="view되나";
	      $.each(data,function(index, obj){	//반복문
	         view+="플러스되나";
	         view+="<tr>";
	         view+="<td>"+obj.num+"</td>";
	         view+="<td id='t"+obj.idx+"'><a href='javascript:cview("+obj.idx+")'>"+obj.userid+"</a></td>";
	         view+="<td>"+obj.username+"</td>";
	         view+="<td>"+obj.userpw+"</td>";
	         view+="<td>"+obj.mainProcess+"</td>";
	         view+="<td>"+obj.userRight+"</td>";
	         view+="<td>"+obj.department+"</td>";
	         view+="<td>"+obj.contact+"</td>";
	         view+="<td>"+obj.email+"</td>";
	         view+="</tr>"; 
	  	})
	      $( '#list_Data' ).html(view);
		}
	      $( '#list_Data' ).html(view);
	}