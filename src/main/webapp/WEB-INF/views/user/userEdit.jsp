<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<!--Bootstrap Validator [ OPTIONAL ]-->
    <link href="/resources/plugins/bootstrap-validator/bootstrapValidator.min.css" rel="stylesheet">
    
    <!--Magic Checkbox [ OPTIONAL ]-->
    <link href="/resources/plugins/magic-check/css/magic-check.min.css" rel="stylesheet">
    
    <!--Select2 [ OPTIONAL ]-->
    <link href="/resources/plugins/select2/css/select2.min.css" rel="stylesheet">
    
    <!--Dropzone [ OPTIONAL ]-->
    <link href="/resources/plugins/dropzone/dropzone.min.css" rel="stylesheet">
    
    <!--Bootstrap Wizard [ OPTIONAL ]-->
    <script src="/resources/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>

    <!--Bootstrap Validator [ OPTIONAL ]-->
    <script src="/resources/plugins/bootstrap-validator/bootstrapValidator.min.js"></script>
    
    <!-- Momoent.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    
    <!--Select2 [ OPTIONAL ]-->
    <script src="/resources/plugins/select2/js/select2.min.js"></script>
    
    <!--Dropzone [ OPTIONAL ]-->
    <script src="/resources/plugins/dropzone/dropzone.min.js"></script>

<title>Page Template | moim@</title>
<style>
i.form-control-feedback {
	line-height: 31px;
}
</style>
</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">

		<!-- HEADER-NAVBAR -->
		<%@ include file="../includes/header-navbar.jsp"%>
		<!-- END NAVBAR -->

		<!-- BOXED -->
		<div class="boxed">

			<!-- MAIN-NAV -->
			<%@ include file="../includes/main-nav.jsp"%>
			<!-- END MAIN-NAV -->

			<!-- ASIDE -->
			<%-- <%@ include file="includes/aside.jsp" %> --%>
			<!-- END ASIDE -->




			<!--CONTENT CONTAINER-->
			<!--===================================================-->
			<div id="content-container">

				<!--Page Title-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<div id="page-title">
					<h1 class="page-header text-overflow">마이페이지</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">

					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">회원정보수정</h3>
						</div>
						<!-- ========== 사진 시작 ========== -->
						<div class="panel-body form-horizontal form-padding">
							<div class="form-group">
								<div class="col-md-11 text-center">
								<!-- 이미지 사이즈등등은 생각해 볼 것 입니다. -->
									<img class="img-lg img-border img-circle" id="memPhoto"
										src="${memberDomain.memPhoto }" alt="샘플사진" />
								</div>
							</div>
						</div>
						<!-- ================================================== -->

						<!-- BASIC FORM ELEMENTS -->
						<form id="edit-form" action="/mypage/edit" method="post">
							<div class="panel-body form-horizontal form-padding">
							<div class="form-group" id="myDropzone">
								<label class="col-lg-3 control-label">프로필사진 변경</label>
								<div class="col-lg-7">
									<!--Dropzonejs using Bootstrap theme-->
									<!--===================================================-->
									<p style="text-align: left; margin-bottom: 0; padding: 6px 12px;">
										프로필에 쓰일 사진을 선택해주세요.
									</p>
									<div class="bord-top pad-ver" style="border-top: none; text-align: left; padding: 6px 12px;">
										<!-- The fileinput-button span is used to style the file input field as button -->
										<span class="btn btn-success fileinput-button dz-clickable">
											<i class="fa fa-plus"></i> <span>사진선택</span>
										</span>
									</div>
									<div id="dz-previews" style="border-top: none; text-align: left; padding: 6px 12px;">
										<div id="dz-template" class="pad-top bord-top">
											<div class="media">
												<div class="media-body">
													<!--This is used as the file preview template-->
													<div class="media-block">
														<div class="media-left">
															<img class="dz-img" data-dz-thumbnail>
														</div>
														<div class="media-body">
															<p class="text-main text-bold mar-no text-overflow"
																data-dz-name></p>
															<span class="dz-error text-danger text-sm"
																data-dz-errormessage></span>
															<p class="text-sm" data-dz-size></p>
															<div id="dz-total-progress" style="opacity: 0">
																<div class="progress progress-xs active"
																	role="progressbar" aria-valuemin="0"
																	aria-valuemax="100" aria-valuenow="0">
																	<div class="progress-bar progress-bar-success"
																		style="width: 0%;" data-dz-uploadprogress></div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="media-right">
													<button data-dz-remove
														class="btn btn-xs btn-danger dz-cancel">
														<i class="demo-pli-cross"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
									<!--===================================================-->
									<!--End Dropzonejs using Bootstrap theme-->
								</div>
							</div>
							<!--===================================================-->
								<!--닉네임-->
								<div class="form-group">
									<label class="col-lg-3 control-label">이름(별명)</label>
									<div class="col-lg-7">
										<input type="text" class="form-control" name="memNickname"
											placeholder="이름(별명)" value="${memberDomain.memNickname}">
									</div>
								</div>
								<!--Email Input-->
								<div class="form-group">
									<label class="col-lg-3 control-label">이메일</label>
									<div class="col-lg-7">
										<input type="email" class="form-control" placeholder="이메일 주소"
											value="${memberDomain.memEmail}" name="memEmail" readonly>
									</div>
								</div>
								<!-- 신규 비밀번호 확인 -->
								<div class="form-group">
									<label class="col-lg-3 control-label">비밀번호 변경</label>
									<div class="col-lg-7">
										<input type="password" class="form-control" name="memPassword"
											placeholder="비밀번호">
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">비밀번호 확인</label>
									<div class="col-lg-7">
										<input type="password" class="form-control"
											name="confirmPassword" placeholder="비밀번호">
									</div>
								</div>
								<!--생일-->
								<div class="form-group">
									<label class="col-lg-3 control-label">생년월일</label>
									<div class="col-lg-7">
										<input type="text" placeholder="주민번호 앞자리 (YYMMDD)"
											name="memBirthday" class="form-control" value="">
									</div>
								</div>
								<!-- 성별 -->
								<div class="form-group">
									<label class="col-lg-3 control-label">성별</label>
									<div class="col-lg-7  text-left">
										<label id="gender" class="control-label"></label>
									</div>
								</div>
								<!-- 지역 -->
								<div class="form-group">
									<label class="col-lg-3 control-label">활동지역</label>
									<div class="col-lg-7">
										<select id="area-select" class="form-control"
											name="areaRegionKey">
											<c:forEach items="${ areas }" var="area">
												<c:choose>
													<c:when test="${ area.areaKey eq 'O000' }">
														<option value="${ area.areaKey }">${ area.areaRegionName }</option>
													</c:when>
													<c:otherwise>
														<option data-area="${area.areaId }"
															value="${ area.areaRegionKey }">${ area.areaName }
															${ area.areaRegionName }</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
								</div>
								<!-- 간단 소개글 -->
								<div class="form-group">
									<label class="col-lg-3 control-label">소개글</label>
									<div class="col-lg-7">
										<textarea class="form-control" name="memContent" rows="5"
											placeholder="간단한 소개글을 적어보세요." style="resize: none;">${ memberDomain.memContent }</textarea>
									</div>
								</div>
								<!-- 관심사-->
								<div class="form-group">
									<label class="col-lg-3 control-label">관심사 선택</label>
									<div class="col-lg-7">
										<select id="interest-selects" multiple="multiple"
											class="form-control" name="intKey">
											<c:forEach items="${ interest }" var="item">
												<c:choose>
													<c:when test="${fn:substring(item.intKey, 2, 4) ne '00' }">
														<option data-int="${item.intId }"
															value="${ item.intKey } ">${ item.intName }</option>
													</c:when>
												</c:choose>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="panel-footer text-right">
									<button class="btn btn-danger btn-hover-danger" type="button" id="delBtn">탈퇴하기</button>
									<button class="btn btn-default btn-hover-warning" type="button" id="canBtn">돌아가기</button>
									<button class="btn btn-success" type="submit" id="modBtn">수정완료</button>
								</div>
							</div>
						</form>
						<!--===================================================-->
						<!-- END BASIC FORM ELEMENTS -->
					</div>
				</div>
				<!--===================================================-->
				<!--End page content-->
			</div>
			<!--===================================================-->
			<!--END CONTENT CONTAINER-->
		</div>
		<!-- END BOXED -->

		<!-- FOOTER -->
		<%@ include file="../includes/footer.jsp"%>
		<!-- END FOOTER -->

	</div>
	<!-- END CONTAINER -->
	<%-- for modal --%>
	<c:if test="${ !empty loginVO }">
		<%@ include file="../includes/modals.jsp"%>
	</c:if>
	<%-- for modal --%>
	<!--Bootbox Modals [ OPTIONAL ]-->
	<script src="/resources/plugins/bootbox/bootbox.min.js"></script>
	<script>
		$(document).ready(function() { //onload 함수
			// set BirthDay 
			// 현재 날짜 형식을 yyyy-MM-dd로 반환하는 쿼리라서 이렇게 쓰는것 
			// 쿼리나 뭐나 바꾸면 이렇게 안해도 됨
			var birthday = '<c:out value="${memberDomain.memBirthday }" />';
			var splitBirthday = birthday.split('-');
			var birthStr = ''+ splitBirthday[0] + splitBirthday[1] + splitBirthday[2];
			var memGender = '<c:out value="${memberDomain.memGender}" />'
			$('input[name=memBirthday]').val(birthStr);
			// 유저의 서식지
			$('#area-select option[data-area=<c:out value="${memberDomain.areaId }" />]').attr('selected','selected')
			// 유저의 선택관심사 
			$('#interest-selects option[data-int=<c:out value="${memberDomain.memInt1 }" />]').attr('selected','selected')
			$('#interest-selects option[data-int=<c:out value="${memberDomain.memInt2 }" />]').attr('selected','selected')
			$('#interest-selects option[data-int=<c:out value="${memberDomain.memInt3 }" />]').attr('selected','selected')
			if(memGender == 'M'){
				$("#gender").text('남성')
			}else if(memGender == 'F'){
				$("#gender").text('여성')
			}
			var msg = "<c:out value='${msg}'/>"
			if(msg){
				bootbox.alert(msg);
			}
			
			 $('#delBtn').on('click', function(){
			        bootbox.dialog({
			            title: "정말로 탈퇴하시겠습니까?",
			            message:'<div class="row"> ' + 
			            		'	<div class="col-md-12"> ' +
			                    '		<form id="chkModal"class="form-horizontal"> ' + 
			                    '			<div class="form-group"> ' +
			                    '				<label class="col-md-4 control-label mar-lft" for="pwchk">비밀번호</label> ' +
			                    '				<div class="col-md-5"> ' +
			                    '					<input id="pwchk" name="chkpwd" type="password" class="form-control input-md"> ' +
			                    '					<span class="help-block mar-lft"><small>본인확인을 위해 비밀번호를 입력해 주세요.</small></span>' +
			                    '				</div>' + 
			                    ' 			</div>' + 
			                    '		</form> </div> </div>',
			            buttons: {
			                success: {
			                    label: "탈퇴하기",
			                    className: "btn-danger",
			                    callback: function() {
			                        var name = $('#name').val();
			                        var modalForm = $("#chkModal");
			                        modalForm.attr("action","/mypage/delete");
			                        modalForm.attr("method","post");
			                        modalForm.submit();
			                    }
			                }
			            }
			        });
			    });
			
			
			$('#area-select').select2({
				width : '100%'
			}).ready(function() {
				$('#select2-area-select-container').css({
					'padding-left' : '12px',
					'text-align' : 'left'
				});
			});

			$('#interest-selects').select2({
				width : '100%',
				placeholder : '찾아보기'
			});				
			
			$('span[class="select2-selection__clear"]').css('margin-right', '');	
			// FORM VALIDATION
			// =================================================================
			// Require Bootstrap Validator
			// http://bootstrapvalidator.com/
			// =================================================================

			var isValid;
		    $('#edit-form').bootstrapValidator({
		        message: '값이 유효하지 않습니다.',
		        feedbackIcons: {
			        valid: 'fa fa-check-circle fa-lg text-success',
			        invalid: 'fa fa-times-circle fa-lg',
			        validating: 'fa fa-refresh',
		        },
		        fields: {
			        memPassword: {
			        	enabled: false,
			            validators: {
			                stringLength: {
			                	min: 8,
			                	message: '비밀번호는 여덟자리 이상이어야 합니다.'
			                },
			                notEmpty: {
			                    message: '비밀번호를 입력해주세요.'
			                },
			            }
			        },
			        confirmPassword: {
			        	enabled: false,
			            validators: {
			            	identical: {
			                	field: 'memPassword',
			                	message: '비밀번호가 일치하지 않습니다. 다시 입력해주세요.'
			                },
			                stringLength: {
			                	min: 8,
			                	message: '비밀번호는 여덟자리 이상이어야 합니다.'
			                },
			                notEmpty: {
			                	message: '비밀번호를 입력해주세요.'
			                }
			            }
			        },
			        memNickname: {
			        	validators: {
			        		notEmpty: {
			        			message: '이름을 입력해주세요.'
			        		},
			        		regexp: {
			        			regexp: /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/,
			        			message: '이름(별명)은 한글, 영어, 숫자만 가능합니다.'
			        		},
			        		stringLength: {
			        			max: function (value, validator, $field) {
			        				var byteLength = (function getByteLength(s,b,i,c){
			        				    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			        				    return b;
			        				})(value);

		    						return 32 - byteLength;
			        				
			        			},
			        			min: 2,
			        			message: '이름(별명)은 한글 8자, 영어 16자 이하여야 합니다.'
			        		}
			        		
			        	}
			        },
			        memBirthday: {
			        	validators: {
			        		notEmpty: {
			        			message: '생년월일을 입력해주세요.'
			        		},
			        		callback: {
			        			message: '날짜가 유효하지 않습니다. 다시 입력해주세요.',
			        			callback: function(value, validator) {
			        				var inputDate = new moment(value, 'YYYYMMDD', true);
			        				var currentTime = new moment();
			        				
			        				if ( !inputDate.isValid() ) {
			        					return false;
			        				}
			        				
			        				return inputDate.isBefore(currentTime);
			        			}
			        		}
			        	}
			        },
			        memContent: {
			        	validators: {
			        		stringLength: {
			        			max: function (value, validator, $field) {
			        				var byteLength = (function getByteLength(s,b,i,c){
			        				    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			        				    return b;
			        				})(value);

		    						return 170 - byteLength;
			        			},
			        			message: '소개글은 43자 미만이어야 합니다.'
			        		}
			        	}
			        },
			        intKey: {
			        	validators: {
			        		choice: {
			        			min: 3,
			        			max: 3,
			        			message: '관심사는 세가지를 선택해야 합니다.'
			        		}
			        	}
			        }
		        }
		    }).on('success.field.bv', function(e, data) {
		        // $(e.target)  --> The field element
		        // data.bv      --> The BootstrapValidator instance
		        // data.field   --> The field name
		        // data.element --> The field element

		        var $parent = data.element.parents('.form-group');

		        // Remove the has-success class
		        $parent.removeClass('has-success');


		        // Hide the success icon
		        //$parent.find('.form-control-feedback[data-bv-icon-for="' + data.field + '"]').hide();
		    }).on('error.form.bv', function(e) {
		        isValid = false;
		    }).on('keyup', '[name="memPassword"]', function() {
	            var isEmpty = $(this).val() == '';
	            $('#edit-form')
	                    .bootstrapValidator('enableFieldValidators', 'memPassword', !isEmpty)
	                    .bootstrapValidator('enableFieldValidators', 'confirmPassword', !isEmpty);

	            // Revalidate the field when user start typing in the password field
	            if ($(this).val().length == 1) {
	                $('#edit-form').bootstrapValidator('validateField', 'memPassword')
	                                .bootstrapValidator('validateField', 'confirmPassword');
	            }
	        });
		    
		    /***** ADDITIONAL VALIDATOR SCRIPT *****/
		    
		    // CUSTOM
		    //$('input[name="memPassword"]').on('input', function() {
		    //	$('#edit-form').bootstrapValidator('revalidateField', 'confirmPassword');
		    //});
		   
		    
		    
		    /*****END VALIDATOR *****/
		    
		 // TODO: 메서드 전체적으로 고쳐야함
		    //			- required upload url.
		    /***** FILE UPLOAD USING DROPZONE.JS *****/

		    var previewNode = document.querySelector("#dz-template");
		    previewNode.id = "";
		    var previewTemplate = previewNode.parentNode.innerHTML;
		    previewNode.parentNode.removeChild(previewNode);

		    var uplodaBtn = $('#dz-upload-btn'); //TODO : 필요없음
		    var removeBtn = $('#dz-remove-btn'); //TODO : 필요없음
		    var myDropzone = new Dropzone('div#myDropzone', { // Make the whole body a dropzone
		        url: "/mypage/edit", // Set the url
				headers: {'Content-Type': /*'multipart/form-data'*/false},
				//uploadMultiple: true,
				acceptedFiles: 'image/*',
				autoProcessQueue: false,
		        thumbnailWidth: 50,
		        thumbnailHeight: 50,
		        parallelUploads: 20,
		        previewTemplate: previewTemplate,
		        //autoQueue: false, // Make sure the files aren't queued until manually added
		        previewsContainer: "#dz-previews", // Define the container to display the previews
		        clickable: ".fileinput-button", // Define the element that should be used as click trigger to select files.
		        maxFiles: 1,
		        dictMaxFilesExceeded: '프로필 사진은 한장만 가능합니다.',
				//paramName: 'uploadfile',
				//autoDiscover: false,
				init: function() {

		        	var closuredz = this;

		        	$('#modBtn').on('click', function(e) {
		        		e.preventDefault();
		        		e.stopPropagation();
		        		
		        		if($('input[name="memPassword"]').val()!=$('input[name="confirmPassword"]').val()){
		        			alert("비밀번호를 확인해주세요!");
		        			return false;
		        		}
						
		        		if (closuredz.getQueuedFiles().length > 0) {
		        			closuredz.processQueue();
						} else {
		        			var blob = new Blob();
		        			blob.upload = { 'chunked': closuredz.defaultOptions.chunking };
		        			closuredz.uploadFile(blob);

						}
					});

		        	this.on('sending', function(file, xhr, formData) {
		        		formData.append('memEmail', $('input[name="memEmail"]').val());
		        		formData.append('memPassword', $('input[name="memPassword"]').val());
		        		formData.append('memNickname', $('input[name="memNickname"]').val());
		        		formData.append('memBirthday', $('input[name="memBirthday"]').val());
		        		formData.append('areaRegionKey', $('select[name="areaRegionKey"]').val());
		        		formData.append('memContent', $('textarea[name="memContent"]').val());
		        		formData.append('intKey', $('select[name="intKey"]').val().toString());
					});

		        	this.on('success', function(file, response) {
		        		if (response) {
		        			//이게 컨트롤러에 다른경로를 설정해놨어도 이걸로 작동
		        			window.location.href = '/mypage';
						}
					});
			
				}
		    });
		    
		    $("#canBtn").on("click",function(){
		    	location.href = '/mypage';
		    });
		    
		   

		});
	</script>
</body>
</html>