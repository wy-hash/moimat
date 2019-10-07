<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- modal for logout -->
<div class="modal" id="demo-modal-wo-anim" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <!--Modal header-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="pci-cross pci-circle"></i></button>
                <h4 class="modal-title">로그아웃</h4>
            </div>


            <!--Modal body-->
            <div class="modal-body">
                <p class="text-semibold text-main">로그아웃 하시겠습니까?</p>
            </div>

            <!--Modal footer-->
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">취소</button>
                <button class="btn btn-warning">로그아웃</button>
            </div>
        </div>
    </div>
</div>
<!-- //modal for logout -->
