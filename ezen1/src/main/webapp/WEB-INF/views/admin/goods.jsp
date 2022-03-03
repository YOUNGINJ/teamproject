<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin/goods</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>

<c:import url="../header.jsp"></c:import>

<!-- container -->
  <div
    class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative my-2"
    style="max-width: 520px;">
    <form action="productRegisterAction" class="w-100" name="productRegisterForm" method="post" onsubmit="return nullChecker()" >
    <div class="d-flex flex-column bg-white border border-dark-50 rounded col-12"
      style="height: auto;">
      <div class="d-flex justify-content-end w-100" style="height: 30px;">
        <img src="/img/icon/cross.png" alt="" style="width:30px; height: 30px;">
      </div>
      <p class="text-center font-weight-bold text-dark" style="font-size: 16px;">
        상품등록
      </p>
      <div class="d-flex felx-row justify-content-around mb-3 form-group">
        <span class="font-weight-bold text-dark" style="font-size: 14px;">상품이름</span>
        <input type="text" name="goods_name" class="nullcheck form-control col-7" placeholder="상품이름을 입력해주세요" style="font-size: 14px;">
        <input type="hidden" name="goods_idx">
      </div>
      <div class="d-flex felx-row justify-content-around mb-3 form-group">
        <span class="font-weight-bold text-dark" style="font-size: 14px;">정품가격</span>
        <input type="text" name="goods_price" class="nullcheck form-control col-7" placeholder="상품가격을 입력해주세요" style="font-size: 14px;">
      </div>
      <div class="d-flex felx-row justify-content-around mb-3 form-group">
        <span class="font-weight-bold text-dark" style="font-size: 14px;">판매수량</span>
        <input type="text" name="goods_purchased" class="nullcheck form-control col-7" placeholder="상품수량을 입력해주세요" style="font-size: 14px;">
      </div>
      <div class="d-flex felx-row justify-content-between mx-4 mb-4">
        <span class="font-weight-bold" style="font-size: 14px;">옵션등록</span>
        <select class="text-dark form-control col-7" name="goods_option" id="" style="font-size: 14px;">
          <option selected value="">옵션select</option>
          <option value="">옵션1</option>
        </select>
      </div>
      <div class="d-flex felx-row justify-content-start ml-4 mb-3">
        <span class="font-weight-bold text-dark" style="font-size: 14px;">이미지</span>
      </div>
      <div class="d-flex flex-row justify-content-between mx-4 mb-2" style="font-size: 14px;">
        <span>썸네일</span>
        <input type="file" name="uploadthumb" id="img" style="display:none;" />
        <label for="img" class="btn btn-primary border pb-4"
          style="width: 76px; height: 27px; font-size: 12px;">파일선택</label>
      </div>
      <div class="d-flex flex-row justify-content-between mx-4 mb-2" style="font-size: 14px;">
        <span>1번파일</span>
        <input type="file" name="uploadgoodsimg" id="img" style="display:none;" />
        <label for="img" class="btn btn-primary border pb-4"
          style="width: 76px; height: 27px; font-size: 12px;">파일선택</label>
      </div>
      <div class="d-flex flex-row justify-content-between mx-4 mb-2" style="font-size: 14px;">
        <span>2번파일</span>
        <input type="file" name="uploadgoodsimg2" id="img" style="display:none;" />
        <label for="img" class="btn btn-primary border pb-4 "
          style="width: 76px; height: 27px; font-size: 12px;">파일선택</label>
      </div>
      <div class="d-flex flex-row justify-content-between mx-4 mb-2" style="font-size: 14px;">
        <span>3번파일</span>
        <input type="file" name="uploadgoodsimg3" id="img" style="display:none;" />
        <label for="img" class="btn btn-primary border pb-4"
          style="width: 76px; height: 27px; font-size: 12px;">파일선택</label>
      </div>
      <div class="d-flex flex-row justify-content-between mx-4 mb-2" style="font-size: 14px;">
        <span>상세파일</span>
        <input type="file" name="uploadgoodsimg4" id="img" style="display:none;" />
        <label for="img" class="btn btn-primary border pb-4"
          style="width: 76px; height: 27px; font-size: 12px;">파일선택</label>
      </div>
      <div class="d-flex flex-row justify-content-between my-3">
          <button type="button" class="btn btn-dark text-light ml-3 col-5" style="height: 40px; border-radius: 6px;">취소</button>
          <button class="btn btn-primary text-light mr-3 col-5" style="height: 40px; border-radius: 6px;">확인</button>
      </div>
    </div>
  </form>
  </div>

    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>


<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
</body>
</html>