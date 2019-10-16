<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<title>회원가입 | moim@</title>

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
    
    <style>
    	i.form-control-feedback {
    		line-height: 31px;
		}
    </style>

</head>
<!-- END HEAD -->
<body>
	<div id="container" class="cls-container">
		

		<!-- REGISTRATION FORM -->
		<!--===================================================-->
		<div class="cls-content">



		    <div class="cls-content-lg panel">
		        <div class="panel-body">
		            <div class="mar-ver pad-btm">
		                <h3 class="h3">회원가입</h3>
		                <p class="text-muted">즐거운 취미생활, moim@에서 시작하세요</p>
		            </div>

			
		            <!-- Form wizard with Validation -->
		            <!--===================================================-->
		            <div id="demo-bv-wz" class="panel">
		                <div class="wz-heading pad-top">
		
		                    <!--Nav-->
		                    <ul class="row wz-step wz-icon-bw wz-nav-off mar-top">
		                        <li class="col-xs-3">
		                            <a data-toggle="tab" href="#demo-bv-tab1">
		                                <span class="text-danger"><i class="demo-pli-information icon-2x"></i></span>
		                                <p class="text-semibold mar-no">계정</p>
		                            </a>
		                        </li>
		                        <li class="col-xs-3">
		                            <a data-toggle="tab" href="#demo-bv-tab2">
		                                <span class="text-warning"><i class="demo-pli-male icon-2x"></i></span>
		                                <p class="text-semibold mar-no">프로필</p>
		                            </a>
		                        </li>
		                        <li class="col-xs-3">
		                            <a data-toggle="tab" href="#demo-bv-tab3">
		                                <span class="text-info"><i class="demo-pli-heart-2 icon-2x"></i></span>
		                                <p class="text-semibold mar-no">관심사</p>
		                            </a>
		                        </li>
		                        <li class="col-xs-3">
		                            <a data-toggle="tab" href="#demo-bv-tab4">
		                                <span class="text-success"><i class="demo-pli-medal-2 icon-2x"></i></span>
		                                <p class="text-semibold mar-no">완료!</p>
		                            </a>
		                        </li>
		                    </ul>
		                </div>
		
		                <!--progress bar-->
		                <div class="progress progress-xs">
		                    <div class="progress-bar progress-bar-primary"></div>
		                </div>
		
		
		                <!--Form-->
		                <form id="demo-bv-wz-form" class="form-horizontal" action="/auth/join" method="post">
		                    <div class="panel-body">
		                        <div class="tab-content">
		
		                            <!--First tab-->
		                            <div id="demo-bv-tab1" class="tab-pane">
		                                <div class="form-group">
		                                    <label class="col-lg-3 control-label">이메일*</label>
		                                    <div class="col-lg-7">
		                                        <input type="email" class="form-control" name="memEmail" placeholder="이메일 주소">
		                                    </div>
		                                </div>
		                                <div class="form-group">
		                                	<label class="col-lg-3 control-label">이메일 인증*</label>
		                                	<div class="col-lg-7">
			                                	<div class="col-lg-7 pad-no">
			                                		<input type="text" class="form-control" name="certCode" placeholder="인증코드 입력" disabled="disabled">
		                                		</div>
		                                		<div class="col-lg-3">
			                                		<button class="btn btn-primary" name="certButton">인증코드 발송</button>                                		
		                                		</div>
	                                		</div>
		                                </div>
		                                <div class="form-group">
		                                    <label class="col-lg-3 control-label">비밀번호*</label>
		                                    <div class="col-lg-7">
		                                        <input type="password" class="form-control" name="memPassword" placeholder="비밀번호">
		                                    </div>
		                                </div>
		                                <div class="form-group">
		                                    <label class="col-lg-3 control-label">비밀번호 확인*</label>
		                                    <div class="col-lg-7">
		                                        <input type="password" class="form-control" name="confirmPassword" placeholder="비밀번호">
		                                    </div>
		                                </div>
		                            </div>
		
		                            <!--Second tab-->
		                            <div id="demo-bv-tab2" class="tab-pane fade">
		                                <div class="form-group">
		                                    <label class="col-lg-3 control-label">이름(별명)*</label>
		                                    <div class="col-lg-7">
		                                        <input type="text" class="form-control" name="memNickname" placeholder="이름(별명)">
		                                    </div>
		                                </div>
		                                <div class="form-group">
		                                    <label class="col-lg-3 control-label">생년월일*</label>
		                                    <div class="col-lg-7">
		                                        <input type="text" placeholder="주민번호 앞자리 (YYMMDD)" name="memBirthday" class="form-control">
		                                    </div>
		                                </div>
		                                <div class="form-group">
		                                    <label class="col-lg-3 control-label">성별*</label>
		                                    <div class="col-lg-7">
						                        <div class="radio">
						                            <!-- Inline radio buttons -->
						                            <input id="demo-inline-form-radio" class="form-control magic-radio" type="radio" name="memGender" value="M" checked>
						                            <label for="demo-inline-form-radio">남</label>
						                            <input id="demo-inline-form-radio-2" class="form-control magic-radio" type="radio" name="memGender" value="F">
						                            <label for="demo-inline-form-radio-2">여</label>
						                        </div>
		                                    </div>
		                                </div>
		                                <div class="form-group">
		                                    <label class="col-lg-3 control-label">활동지역*</label>
		                                    <div class="col-lg-7">
												<select id="select2-placeholder" class="form-control" name="areaRegionKey">
					                                <c:forEach items="${ areas }" var="area">
					                                	<c:choose>
					                                		<c:when test="${ area.areaKey eq 'O000' }">
					                                			<option value="${ area.areaKey }">${ area.areaRegionName }</option>
					                                		</c:when>
					                                		<c:otherwise>
					                                			<option value="${ area.areaRegionKey }">${ area.areaName } ${ area.areaRegionName }</option>
					                                		</c:otherwise>
					                                	</c:choose>
					                                </c:forEach>
					                            </select>
		                                    </div>
		                                </div>
		                                <div class="form-group" id="myDropzone">
		                                	<label class="col-lg-3 control-label">프로필사진</label>
		                                	<div class="col-lg-7">


												<!--Dropzonejs using Bootstrap theme-->
												<!--===================================================-->
												<p style="text-align: left; margin-bottom: 0; padding: 6px 12px;">프로필에 쓰일 사진을 선택해주세요.</p>

												<div class="bord-top pad-ver" style="border-top: none; text-align: left; padding: 6px 12px;">
													<!-- The fileinput-button span is used to style the file input field as button -->
													<span class="btn btn-success fileinput-button dz-clickable">
														<i class="fa fa-plus"></i>
														<span>사진선택</span>
													</span>



												</div>
												<div id="dz-previews" style="border-top:none; text-align: left; padding: 6px 12px;">
													<div id="dz-template" class="pad-top bord-top">
														<div class="media">
															<div class="media-body">
																 <!--This is used as the file preview template-->
																<div class="media-block">
																	<div class="media-left">
																		<img class="dz-img" data-dz-thumbnail>
																	</div>
																	<div class="media-body">
																		<p class="text-main text-bold mar-no text-overflow" data-dz-name></p>
																		<span class="dz-error text-danger text-sm" data-dz-errormessage></span>
																		<p class="text-sm" data-dz-size></p>
																		<div id="dz-total-progress" style="opacity:0">
																			 <div class="progress progress-xs active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
																				<div class="progress-bar progress-bar-success" style="width:0%;" data-dz-uploadprogress></div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="media-right">
																<button data-dz-remove class="btn btn-xs btn-danger dz-cancel"><i class="demo-pli-cross"></i></button>
															</div>
														</div>
													</div>
												</div>
												<!--===================================================-->
												<!--End Dropzonejs using Bootstrap theme-->




		                                	</div>
		                                </div>
		                                <div class="form-group">
			                                <label class="col-lg-3 control-label">소개글</label>
		                                	<div class="col-lg-7">
		                                		<textarea class="form-control" name="memContent" rows="5"placeholder="간단한 소개글을 적어보세요."></textarea>
	                                		</div>
		                                </div>
		                                
		                            </div>
		
		                            <!--Third tab-->
		                            <div id="demo-bv-tab3" class="tab-pane">
		                                <div class="form-group">
		                                    <label class="col-lg-3 control-label">관심사 선택*</label>
		                                    <div class="col-lg-7">
					                            <select id="select2-multiple-selects" multiple="multiple" class="form-control" name="intKey">
					                                <c:forEach items="${ interest }" var="item">
					                                	<c:choose>
					                                		<c:when test="${fn:substring(item.intKey, 2, 4) ne '00' }">
					                                			<option value="${ item.intKey }">${ item.intName }</option>
					                                		</c:when>
					                                	</c:choose>
					                                </c:forEach>
					                            </select>
		                                    </div>
		                                </div>
		                            </div>
		
		                            <!--Fourth tab-->
		                            <div id="demo-bv-tab4" class="tab-pane  mar-btm text-center">
		                                <h4>감사합니다!</h4>
		                                <p class="text-muted">moim@에 가입해주셔서 감사합니다.</p>
		                            </div>
		                        </div>
		                    </div>
		
		                    <!--Footer button-->
		                    <div class="panel-footer clearfix">
		                    	<div class="pull-left">(*)표시는 필수 입력사항입니다.</div>
		                        <div class="box-inline pull-right">
		                            <button type="button" class="previous btn btn-primary">이전</button>
		                            <button type="button" class="next btn btn-primary">다음</button>
		                            <button type="submit" class="finish btn btn-warning" disabled>완료</button>
		                        </div>
		                    </div>
		                </form>
		            </div>
		            <!--===================================================-->
		            <!-- End Form wizard with Validation -->
			




		        </div>



		    </div>




		</div>
		<!--===================================================-->
	
		
		
	</div>
	<!--===================================================-->
	<!-- END OF CONTAINER -->
	
	
	<script>
	
		$(document).ready(function() {
			
		    // FORM WIZARD WITH VALIDATION
		    // =================================================================
		    $('#demo-bv-wz').bootstrapWizard({
		        tabClass		    : 'wz-steps',
		        nextSelector	    : '.next',
		        previousSelector	: '.previous',
		        onTabClick          : function(tab, navigation, index) {
		            return false;
		        },
		        onInit : function(){
		            $('#demo-bv-wz').find('.finish').hide().prop('disabled', true);
		        },
		        onTabShow: function(tab, navigation, index) {
		            var $total = navigation.find('li').length;
		            var $current = index+1;
		            var $percent = ($current/$total) * 100;
		            var wdt = 100/$total;
		            var lft = wdt*index;

		            $('#demo-bv-wz').find('.progress-bar').css({width:wdt+'%',left:lft+"%", 'position':'relative', 'transition':'all .5s'});

		            // If it's the last tab then hide the last button and show the finish instead
		            if($current >= $total) {
		                $('#demo-bv-wz').find('.next').hide();
		                $('#demo-bv-wz').find('.finish').show();
		                $('#demo-bv-wz').find('.finish').prop('disabled', false);
		                //하단 텍스트 감춤
		                $('.panel-footer .pull-left').css('display', 'none');
		            } else {
		                $('#demo-bv-wz').find('.next').show();
		                $('#demo-bv-wz').find('.finish').hide().prop('disabled', true);
		            }
		        },
		        onNext: function(){
		            isValid = null;
		            $('#demo-bv-wz-form').bootstrapValidator('validate');


		            if(isValid === false)return false;
		        }
		    });
		    

		    
		    


		    // FORM VALIDATION
		    // =================================================================
		    // Require Bootstrap Validator
		    // http://bootstrapvalidator.com/
		    // =================================================================

		    var isValid;
		    $('#demo-bv-wz-form').bootstrapValidator({
		        message: '값이 유효하지 않습니다.',
		        feedbackIcons: {
			        valid: 'fa fa-check-circle fa-lg text-success',
			        invalid: 'fa fa-times-circle fa-lg',
			        validating: 'fa fa-refresh',
		        },
		        fields: {
			        memEmail: {
			            validators: {
			                notEmpty: {
			                    message: '이메일 주소는 필수 입력사항입니다.'
			                },
			                emailAddress: {
			                    message: '유효한 이메일 주소가 아닙니다.'
			                },
			                remote: {
			                	message: '이미 등록된 메일입니다. 다시 확인해주세요.',
			                	url: '/auth/email-validation',
			                	type: 'POST'
			                }
			            }
			        },
			        certCode: {
			        	validators: {
			        		notEmpty: {
			        			message: '인증코드를 입력해주세요.'
			        		},
			        		integer: {
			        			message: '인증코드는 숫자입니다.'
			        		},
			        		remote: {
			        			message: '인증코드가 일치하지 않습니다.',
			        			url: '/auth/check-certcode',
			        			type: 'POST',
			        			data: function(validator) {
			        				return { certEmail: validator.getFieldElements('memEmail').val() };
			        			}
			        		}
			        	}
			        },
			        memPassword: {
			            validators: {
			                notEmpty: {
			                    message: '비밀번호를 입력해주세요.'
			                },
			                stringLength: {
			                	min: 8,
			                	message: '비밀번호는 여덟자리 이상이어야 합니다.'
			                }
			            }
			        },
			        confirmPassword: {
			            validators: {
			            	notEmpty: {
			            		message: '비밀번호를 입력해주세요.'
			            	},
			                stringLength: {
			                	min: 8,
			                	message: '비밀번호는 여덟자리 이상이어야 합니다.'
			                },
			                identical: {
			                	field: 'password',
			                	message: '비밀번호가 일치하지 않습니다. 다시 입력해주세요.'
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
			        				var inputDate = new moment(value, 'YYMMDD', true);
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
		    });
		    
		    /***** ADDITIONAL VALIDATOR SCRIPT *****/
		    
		    // CUSTOM
		    
		    $('input[name="memPassword"]').on('input', function() {
		    	$('#demo-bv-wz-form').bootstrapValidator('revalidateField', 'confirmPassword');
		    });
		    
		    $('button[name="certButton"]').on('click', function() {
		    	if ($('input[name="memEmail"]').next().hasClass('text-success')) {
		    		$.ajax({
		    			url: '/auth/send-certcode',
		    			type: 'post',
		    			data: { "email": $('input[name="memEmail"]').val() },
		    			dataType: 'text',
		    			success: function(result) {
		    				alert(result);
					    	$('input[name="certCode"]').removeAttr('disabled');
		    			},
		    			fail: function(result) {
		    				alert(result);
		    			}
		    		});
		    	}
		    });
		    
		    /*****END VALIDATOR *****/
		    
		    
		    /***** FOR AREA SELECTBOX - SELECT 2 *****/
		    
			$('#select2-placeholder').select2({
				width: '100%'
			}).ready(function() {
				$('#select2-select2-placeholder-container').css({'padding-left': '12px', 'text-align': 'left'});
			});
		    
		    $('#select2-multiple-selects').select2({
		    	width: '100%',
		    	placeholder: '찾아보기'
		    });
		    
		    $('span[class="select2-selection__clear"]').css('margin-right', '')
		    
		    /***** END SELECTBOX *****/
		    
		    
		    
		    // TODO: 메서드 전체적으로 고쳐야함
		    //			- required upload url.
		    /***** FILE UPLOAD USING DROPZONE.JS *****/











		    
		    var previewNode = document.querySelector("#dz-template");
		    previewNode.id = "";
		    var previewTemplate = previewNode.parentNode.innerHTML;
		    previewNode.parentNode.removeChild(previewNode);

		    var uplodaBtn = $('#dz-upload-btn'); //TODO : 필요없음
		    var removeBtn = $('#dz-remove-btn'); //TODO : 필요없음
		    var myDropzone = new Dropzone("div#myDropzone", { // Make the whole body a dropzone
		        url: "/upload", // Set the url
				headers: {'Content-Type': 'multipart/form-data'},
				uploadMultiple: true,
		        thumbnailWidth: 50,
		        thumbnailHeight: 50,
		        parallelUploads: 20,
		        previewTemplate: previewTemplate,
		        autoQueue: true, // Make sure the files aren't queued until manually added
		        previewsContainer: "#dz-previews", // Define the container to display the previews
		        clickable: ".fileinput-button", // Define the element that should be used as click trigger to select files.
		        maxFiles: 1,
		        dictMaxFilesExceeded: '프로필 사진은 한장만 가능합니다.'
		    });

		    $('.finish').on('click', function(e) {
		    	e.preventDefault();
		    	e.stopPropagation();
				myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
				//myDropzone.processQueue();

				return false;
			});

		    myDropzone.on("success", function(file, response) {
		    	alert(response);
				$('#myDropzone').remove();
				$('#demo-bv-wz-form').attr('action', '/auth/join').submit();
			});


		    // myDropzone.on("addedfile", function(file) {
		    //     // Hookup the button
		    //     uplodaBtn.prop('disabled', true); //TODO: 필요없음
		    //     removeBtn.prop('disabled', false); //TODO: 필요없음
		    // });
			//
		    // // Update the total progress bar
		    // myDropzone.on("totaluploadprogress", function(progress) {
		    //     $("#dz-total-progress .progress-bar").css({'width' : progress + "%"});
		    // });
			//
		    // myDropzone.on("sending", function(file) {
		    //     // Show the total progress bar when upload starts
		    //     document.querySelector("#dz-total-progress").style.opacity = "1";
		    // });
			//
		    // // Hide the total progress bar when nothing's uploading anymore
		    // myDropzone.on("queuecomplete", function(progress) {
		    //     document.querySelector("#dz-total-progress").style.opacity = "0";
		    // });
			//
			//
		    // // Setup the buttons for all transfers
		    // uplodaBtn.on('click', function() {
		    //     //Upload all files
		    //     //myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
		    // });
			//
		    // removeBtn.on('click', function() {
		    //     myDropzone.removeAllFiles(true);
		    //     uplodaBtn.prop('disabled', true);
		    //     removeBtn.prop('disabled', true);
		    // });
		    //
		    /***** END FILE UPLOAD *****/
		    
		    
		    
		    
		    
		    
			
		});
	
	</script>


</body>
</html>