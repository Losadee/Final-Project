
$(function(){
  //드래그 앤 드롭
  $(".sortable").sortable();
  
  //이미지 등록
  $("#AddImgs").change(function(e){
      //div 내용 비워주기
      $('#Preview').empty();

      var files = e.target.files;
      var arr = Array.prototype.slice.call(files);

      //업로드 가능 파일인지 체크
      for(var i=0; i<files.length; i++){
          if(!checkExtension(files[i].name,files[i].size)){
              return false;
          }
          
          if(files.length > 3) {
          	alert("프로젝트 이미지는 최대 3장만 업로드 가능합니다.");
          }
      }
      preview(arr);

      function checkExtension(fileName,fileSize){
          var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
          var maxSize = 20971520;  //20MB

          if(fileSize >= maxSize){
              alert('이미지 크기가 초과되었습니다.');
              $("#AddImgs").val("");  //파일 초기화
              return false;
          }

          if(regex.test(fileName)){
              alert('확장자명을 확인해주세요.');
              $("#AddImgs").val("");  //파일 초기화
              return false;
          }
          return true;
      }

      function preview(arr){
          arr.forEach(function(f){

              //div에 이미지 추가
              var str = '<li class="ui-state-default">';
              //str += '<span>'+fileName+'</span><br>';

              //이미지 파일 미리보기
              if(f.type.match('image.*')){
                  //파일을 읽기 위한 FileReader객체 생성
                  var reader = new FileReader(); 
                  reader.onload = function (e) { 
                      //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                      str += '<img src="'+e.target.result+'" title="'+f.name+'" width=150 height=110>';
					  str += '</li>';
					  $(str).appendTo('#Preview');
                  } 
                  reader.readAsDataURL(f);
              }
          })
      }
  })


});
	
function dateCheck() {
	// 펀딩 수정시 시간 오류 판단
	var now = new Date().getTime();	// 현재 날짜 및 시간
	var start = new Date($('#start').val()).getTime();	// 펀딩 시작시간
	if(start < now) {
		$(".top_right *").remove(); 
	
	    var tmpHtml = "";
	     
			// 시작일 오류
			tmpHtml +=  '<button class="err_btn err_button" color="white" disabled>'
			+ 			'<span>'
			+ 			'<div name="error" class="topb">'
			+				'<svg viewBox="0 0 48 48">'
			+					'<path d="M21.009 15.1083C21.0042 15.05 21.0502 15 21.1087 15H26.8913C26.9498 15 26.9958 15.05 26.991 15.1083L26.0076 26.9083C26.0033 26.9601 25.96 27 25.908 27H22.092C22.04 27 21.9967 26.9601 21.9924 26.9083L21.009 15.1083Z"></path>'
			+					'<path d="M21 32C21 30.3431 22.3431 29 24 29C25.6569 29 27 30.3431 27 32C27 33.6569 25.6569 35 24 35C22.3431 35 21 33.6569 21 32Z"></path>'
			+					'<path fill-rule="evenodd" clip-rule="evenodd" d="M24 40C32.8366 40 40 32.8366 40 24C40 15.1634 32.8366 8 24 8C15.1634 8 8 15.1634 8 24C8 32.8366 15.1634 40 24 40ZM24 44C35.0457 44 44 35.0457 44 24C44 12.9543 35.0457 4 24 4C12.9543 4 4 12.9543 4 24C4 35.0457 12.9543 44 24 44Z"></path></svg>'
			+ 			'</div>'
			+  			'시작일 오류</span>'
			+ 			'</button>';
	
	     $(".top_right").append(tmpHtml);
	     
	     return;
	}

	
}	

$(document).ready(dateCheck);
$(document).ready(function() {
	$('#date').on("click", function() {
		if($('.err_btn').length) {	// 요소 있는지 없는지 판단
			$(".err_btn").remove(); 
			
			var tmpHtml2 = "";

			//<!-- 시작일 오류  --> 
			tmpHtml2 = '<button class="able pre_width pre" id="priview">'	<!-- 미리보기 버튼 -->
					+			'<div class="topb icon">'
					+				'<svg viewBox="0 0 48 48">'
					+					'<path fill-rule="evenodd" clip-rule="evenodd" d="M13.7 23.9943C13.8 29.506 18.4 34.0342 24 33.935C29.6 34.0342 34.2 29.506 34.3 23.9943C34.2 18.4826 29.6 13.9563 24 14.0545C18.4 13.9563 13.8 18.4826 13.7 23.9943ZM2 23.9943C5.5 15.2355 14.4 9.62552 24 10.0195C33.6 9.62552 42.5 15.2355 46 23.9943C42.5 32.8523 33.6 38.4623 24 37.97C14.4 38.364 5.5 32.7541 2 23.9943ZM30.6 23.9944C30.6 20.4614 27.646 17.5974 24 17.5974C20.355 17.5974 17.4 20.4614 17.4 23.9944C17.4 27.5274 20.355 30.3913 24 30.3913C27.646 30.3913 30.6 27.5274 30.6 23.9944Z"></path>'
					+				'</svg>'
					+			'</div>'
					+			'<span class="previewText">미리 보기</span>'
					+		'</button>'
					+ '<button class="top_btn top_button saveBtn">'
					+ 	'<span>임시저장</span>'
					+ '</button>';
	 
	       $(".top_right").append(tmpHtml2);
		}
	
	});


     // 계좌 인증
	$('#accountCheck').on("click", function() {
         var url = "https://testapi.openbanking.or.kr/oauth/2.0/authorize?" +
  	    "response_type=code&"+
  	    "client_id=d074c396-c90b-460c-a607-ca735cf4cdf3&"+
  	    "redirect_uri=http://localhost:8080/harVest/callback&"+
  	    "scope=login inquiry&"+
  	    "state=12345678123456781234567812345678&"+
  	    "auth_type=0";
         var title = "popup";
         var status = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=430, height=600, top=50,left=550";
         window.open(url,title,status); 			
     });
     
	// 달력   
	$('.datepicker').daterangepicker();
	
	function strNullCheck(str){
		if(str == "") {
			return false;
		}
		return true;
	}
	// 저장 버튼 변경
	$("input").blur(function(){
		
		if(
		strNullCheck($('#creNm').val()) 		&&
		strNullCheck($('#creIntro').val())  	&&
		strNullCheck($('#title').val())  		&&
		strNullCheck($('#productNm').val()) 	&&
		strNullCheck($('#targetAmt').val()) 	&&
		strNullCheck($('#minDona').val()) 		&&
		strNullCheck($('#start').val()) 		
		) {
			$('.top_right span').text('심사요청');
			$('#status').val('PJT02');
			return;
		}
		$('.top_right span').text('임시저장')
		$('#status').val('PJT03')
	});
	
	// 프로필 미리보기
	const fileDOM = document.querySelector('#file');
	const preview = document.querySelector('.image-box');
	
	
	fileDOM.addEventListener('change', () => {
 		const reader = new FileReader();
  		reader.onload = ({ target }) => {
    	preview.src = target.result;
  		};
  		reader.readAsDataURL(fileDOM.files[0]);
	});
	
	// 상단탭 고정
	$(window).scroll(function() {
			var window = $(this).scrollTop();
			if (window) {
				$('#header').addClass('fixed', 1000);
				return;
			}
			$('#header').removeClass('fixed', 1000);
	});
	
	// 필수 항목 제어
	$('.text_').on("propertychange change keyup keydown paste input", function(){
		var value = $(this).val();
		const amount = parseFloat(value.replace(',', ''));
		var id = $(this).attr('id');
		if(value == "") {
			$('#p_' + id).html('필수 항목입니다.');
			$('#p_' + id).css({"color": "red"});
			$('.' + id + 'Length').css({"color": "red"});
			$(this).closest('div').css({"border": "1px solid red"});
	 		return;
		}
		
		$('#p_' + id).html('');
		return;
	});
	
	$('.text_').trigger('change');
	
	// 글자수 제어
	$('.creNm').keydown(function() {
		const inputLength = $(this).val().length;
		$('.creNmLength').html(inputLength + '/20');
		if(inputLength > 20) {
			$('.creNmLength').css({"color": "red"});
			$('.creNmWrap').css({"border": "1px solid red"});
			$('.saveBtn').prop('disabled', true);
			return;
		}
		$('.creNmLength').css({"color": "rgb(13, 13, 13)"});
		$('.creNmWrap').css({"border": "1px solid"});
		$('.saveBtn').prop('disabled', false);
		return;
		
	});
	
	$('.creIntro').keydown(function() {
		const inputLength = $(this).val().length;
		$('.creIntroLength').html(inputLength + '/300');
		if(inputLength > 300) {
			$('.creIntroLength').css({"color": "red"});
			$('.taWrap').css({"border": "1px solid red"});
			$('.saveBtn').prop('disabled', true);
			return;
		}
		$('.creIntroLength').css({"color": "rgb(13, 13, 13)"});
		$('.taWrap').css({"border": "1px solid"});
		return;
	});

	$('.title').keydown(function() {
		const inputLength = $(this).val().length;
		$('.titleLength').html(inputLength + '/50');
		if(inputLength > 50) {
			$('.titleLength').css({"color": "red"});
			$('.titleWrap').css({"border": "1px solid red"});
			$('.saveBtn').prop('disabled', true);
			return;
		}
		$('.titleLength').css({"color": "rgb(13, 13, 13)"});
		$('.titleWrap').css({"border": "1px solid"});
		$('.saveBtn').prop('disabled', false);
		return;
	});

	$('.productNm').keydown(function() {
		const inputLength = $(this).val().length;
		$('.productNmLength').html(inputLength + '/10');
		if(inputLength > 10) {
			$('.productNmLength').css({"color": "red"});
			$('.productNmWrap').css({"border": "1px solid red"});
			$('.saveBtn').prop('disabled', true);
			return;
		}
		$('.productNmLength').css({"color": "rgb(13, 13, 13)"});
		$('.productNmWrap').css({"border": "1px solid"});
		$('.saveBtn').prop('disabled', false);
		return;
		
	});
	
	// 금액 제어
	$('#targetAmt').on("propertychange change keyup keydown paste input", function(){
			const value = $(this).val();
			const amount = parseFloat(value.replace(/,/gi, ''));
			if(amount < 500000) {
				$('#p_targetAmt').html('50만원 이상의 금액을 입력해주세요.');
	 			$('#p_targetAmt').css({"color": "red"});
				$('.targetAmtWrap').css({"border": "1px solid red"});
				$('.saveBtn').prop('disabled', true);
				return;
			}
			
			if(amount >= 500000 && amount <= 9999999999) {
				$('#p_targetAmt').html('');
				$('.targetAmtWrap').css({"border": "1px solid"});
				$('.saveBtn').prop('disabled', false);
				return;
			}
			
			if(amount > 9999999999) {
	 			$('#p_targetAmt').html('9,999,999,999원 이하인 금액을 입력해주세요.');
	 			$('#p_targetAmt').css({"color": "red"});
				$('.targetAmtWrap').css({"border": "1px solid red"});
				$('.saveBtn').prop('disabled', true);
				return;
			}
		
	});
	$('#minDona').on("propertychange change keyup keydown paste input", function(){
		const value = $(this).val();
		const amount = parseFloat(value.replace(/,/gi, ''));
		if(amount < 1000) {
			$('#p_minDona').html('천원 이상의 금액을 입력해주세요.');
 			$('#p_minDona').css({"color": "red"});
			$('.minDonaWrap').css({"border": "1px solid red"});
			$('.saveBtn').prop('disabled', true);
			return;
		}
		if(amount >= 1000 && amount <= 9999999999) {
			$('#p_minDona').html(' ');
			$('.minDonaWrap').css({"border": "1px solid"});
			$('.saveBtn').prop('disabled', false);
			return;
		}
		if(amount > 9999999999) {
			$('#p_minDona').html('9,999,999,999원 이하인 금액을 입력해주세요.');
			$('#p_minDona').css({"color": "red"});
			$('.minDonaWrap').css({"border": "1px solid red"});
			$('.saveBtn').prop('disabled', true);
			return;
		}
		
	});
	
	// 수수료, 총 금액 계산
	$('#targetAmt').on("input", function() {
		var target = $('#targetAmt').val().replaceAll(/\D/g, '');
		var fee = Math.round(target * 0.05);
		var total = target - fee;
		
		$('input[name=totalAmt]').attr('value', total.toLocaleString('ko-KR').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '원');
		$('input[name=fee]').attr('value', fee.toLocaleString('ko-KR').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '원');
	
	}); 
	
	function openPopup(){
		  var url = "url?arg1="+arg1+"&arg2="+arg2;		// arg1, arg2 변수를 get방식으로 전송
		  var title = "popup";
		  var status = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=260, height=120, top=0,left=0"; 
		  
		  window.open(url,title,status); 			// 팝업 open
	}
	

	// 달력 설정
	var today = new Date();
	// 익일부터
	today.setDate(today.getDate() + 1);

	$('#date').daterangepicker(
			{
				"maxSpan" : {
					"days" : 60
				},
				locale : {
					"format" : "YYYY-MM-DD",
					"separator" : " - ",
					"applyLabel" : "확인",
					"cancelLabel" : "취소",
					"fromLabel" : "시작일",
					"toLabel" : "종료일",
					"daysOfWeek" : [ "일", "월", "화", "수", "목", "금", "토" ],
					"monthNames" : [ "1월", "2월", "3월", "4월", "5월", "6월",
							"7월", "8월", "9월", "10월", "11월", "12월" ],
				},
				"minDate" : today,
				"drops" : "auto"
			}, function(start, end) {

				var term = new Date(end - start) / (1000 * 3600 * 24);
				$('#start').val(start.format('YYYY-MM-DD'));
				$('#end').val(end.format('YYYY-MM-DD'));
				// 펀딩 기간
				$('#diffDate').text(Math.floor(term) + '일');
				// 후원자 결제 종료일
				var endDate = new Date(end);
				$('#payDate').text(dateCal(endDate, 7));
				// 정산일
				$('#adjDate').text(dateCal(endDate, 9));
			});

			// 결제일, 정산일 계산(주말 제외) 0: 일요일, 6: 토요일
			function dateCal(date, n) {
				var calDate = new Date(date.setDate(date.getDate() + n));
				var realDate = calDate.getDay() == 0 ? dateCal(calDate, 2)
						: calDate.getDay() == 6 ? dateCal(calDate, 1) : calDate;
		
				return dateFormat(new Date(realDate));
				// 		return new Date(date.setDate(date.getDate() + n));
			}

			// 계산한 날짜 포맷
			function dateFormat(date) {
				var formatDate = date.getFullYear() + '-'
						+ (date.getMonth() + 1).toString().padStart(2, '0') + '-'
						+ date.getDate().toString().padStart(2, '0');
				return formatDate;
			}
	
});
	
	
// 에디터
$(function() {
			var plugins = [ "advlist", "autolink", "lists", "link", "image",
					"charmap", "print", "preview", "anchor", "searchreplace",
					"visualblocks", "code", "fullscreen", "insertdatetime",
					"media", "table", "paste", "code", "help", "wordcount",
					"save" ];
			var edit_toolbar = 'formatselect fontselect fontsizeselect |'
					+ ' forecolor backcolor |'
					+ ' bold italic underline strikethrough |'
					+ ' alignjustify alignleft aligncenter alignright |'
					+ ' bullist numlist |' + ' table tabledelete |'
					+ ' link image';

			tinyMCE.init({

						forced_root_block : false,
						force_br_newlines : true,
						force_p_newlines : false,
						language : "ko_KR", //한글판으로 변경
						mode : "specific_textareas",
						editor_selector : 'mceEditor',
						height : 500,
						menubar : false,
						plugins : plugins,
						toolbar : edit_toolbar,

						/*** image upload ***/
						image_title : true,
						/* enable automatic uploads of images represented by blob or data URIs*/
						automatic_uploads : true,
						/*
						    URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
						    images_upload_url: 'postAcceptor.php',
						    here we add custom filepicker only to Image dialog
						 */
						file_picker_types : 'image',
						/* and here's our custom image picker*/
						file_picker_callback : function(cb, value, meta) {
							var input = document.createElement('input');
							input.setAttribute('type', 'file');
							input.setAttribute('accept', 'image/*');

							/*
							Note: In modern browsers input[type="file"] is functional without
							even adding it to the DOM, but that might not be the case in some older
							or quirky browsers like IE, so you might want to add it to the DOM
							just in case, and visually hide it. And do not forget do remove it
							once you do not need it anymore.
							 */
							input.onchange = function() {
								var file = this.files[0];

								var reader = new FileReader();
								reader.onload = function() {
									/*
									Note: Now we need to register the blob in TinyMCEs image blob
									registry. In the next release this part hopefully won't be
									necessary, as we are looking to handle it internally.
									 */
									var id = 'blobid' + (new Date()).getTime();
									var blobCache = tinymce.activeEditor.editorUpload.blobCache;
									var base64 = reader.result.split(',')[1];
									var blobInfo = blobCache.create(id, file,
											base64);
									blobCache.add(blobInfo);

									/* call the callback and populate the Title field with the file name */
									cb(blobInfo.blobUri(), {
										title : file.name
									});
								};
								reader.readAsDataURL(file);
							};
							input.click();
						},
						/*** image upload ***/

						content_style : 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
					});

		});