<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>
<c:import url="../pcMain.jsp"></c:import>


<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >

<c:import url="../header.jsp"></c:import>

<!--상품 상단 뒤로가기 버튼 &&현재 페이지 내용-->
  <div
    class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center postion-relative"
    style="max-width: 520px; margin-top: 60px;">
    <div class="container-sm container-fluid d-flex flex-row mb-0 px-0 border-bottom" style="height: 60px">
      <div class="col-2 my-3">
        <a href="goodsList"><img src="/img/icon/left.png" alt="" class="mx-auto d-block my-auto img-fluid"
          width="30px" height="30px"></a>
      </div>
      <div class="col-10 my-3 py-1 pr-5 text-center font-weight-bold">
        장바구니
      </div>
    </div>
    <!--장바구니 내용-->
    <c:if test="${ cart != 0 }">
    <!-- 전체선택/선택삭제 -->
    <main class="w-100">
    <div class="container-fluid d-flex felx-row justify-content-between mx-3 my-3 border-bottom col-11" style="height: 40px;">
      <div class="ml-3">
        <input type="checkbox" value="selectAll" class="ml-0" id="checkAll" onclick="selectAll(this)" style="width: 16px; height: 16px;"><label for="selectAll"
          class="ml-2" style="font-size: 14px;">전체선택</label>
      </div> 
      
      <div style="font-size: 13px;">
        <input type="button" value="선택삭제" onclick="removeGoodsInCart();">
      </div>
    </div>
    <!-- 상품내용  -->
    
    <div class="container d-flex flex-column py-1 px-3 mb-4 border-bottom">
      
      
       <c:forEach var="cart" items="${ cartlist }" varStatus="status">
       
      <div class="row mt-4 mx-3 mb-3" style="font-size: 14px;">
        <input type="hidden" class="cartidx" name="changeValue${ cart.cart_idx }" value="${ cart.cart_idx }">
        <input type="checkbox" name="${ cart.cart_idx }" class="mx-2" style="width: 16px; height: 16px;">
        <c:set var="goods" value="${ goodslist.get(status.index) }" scope="page" />
        <div name="goods_name">${ goods.goods_name }</div>
        <input type="hidden" name="changeValue${ cart.cart_idx }" value="${ goods.goods_price }">
        
      </div>
      
      <div class="d-flex flex-row justify-content-around">
        <img src="${ goods.goods_thumb }" alt="" class="img-fluid mx-3" width="100px"
          height="100px">
        <div class="d-flex flex-column col-7">
          <div class="d-flex flex-row justify-content-between">
            <span>가격</span><span>${ cart.cart_total_price }</span> 
            <input type="hidden" class="price" name="changeValue${ cart.cart_idx }" value="${ cart.cart_total_price }">
          </div>
          <div class="d-flex flex-row justify-content-between">
            <span>옵션</span>
            <span><c:set var="this_cart_option" value="${ cart.option_idx }" scope="page"/>
            <c:forEach var="option" items="${ optionlist }">
            	<c:if test="${ this_cart_option eq option.option_idx }">${ option.option_name }+${ option.option_price }</c:if>
            </c:forEach>
          <c:remove var="goods" scope="page"/>  
            </span>
          </div> 
          <div class="d-flex flex-row justify-content-between">
            옵션
            <!-- 서버에서 처리 -->
            <input id="changeValue${ cart.cart_idx }" type="button" class="btn-block mt-1" value="옵션/수량변경"
              style="width: 80px;height: 20px; font-size: 11px;" onclick="changeValue(event);">
          </div>
          <div class="d-flex flex-row justify-content-between">
            <select class="form-select text-center" name="changeValue${ cart.cart_idx }" style="width: 140px;">
              <c:forEach var="options" items="${ optionlist }">
              <option <c:if test="${ this_cart_option eq options.option_idx }"> selected </c:if> value="${ options.option_idx }">${ options.option_name }+${ options.option_price }</option>
              </c:forEach>
              <c:remove var="this_cart_option" scope="page"/>
            </select>
            <select class="form-select text-center" name="changeValue${ cart.cart_idx }"
              style="width: 60px; font-size: 12px;">
              <option <c:if test="${ cart.cart_amount == 1 }"> selected </c:if> value="1" >1</option>
              <option <c:if test="${ cart.cart_amount == 2 }"> selected </c:if> value="2">2</option>
              <option <c:if test="${ cart.cart_amount == 3 }"> selected </c:if> value="3">3</option>
              <option <c:if test="${ cart.cart_amount == 4 }"> selected </c:if> value="4">4</option>
              <option <c:if test="${ cart.cart_amount == 5 }"> selected </c:if> value="5">5</option>
            </select>
            
          </div>
        </div>
      </div>
      
      </c:forEach>
      
      <div class="d-flex flex-row justify-content-between mx-2 mt-5" style="font-size: 14px;">
        <div>
          상품금액
        </div>
        <div id="total_price">
          
        </div>
      </div>
      <div class="d-flex flex-row justify-content-between mx-2 mb-3" style="font-size: 14px;">
        <div>
          배송비
        </div>
        <div id="shipping_price">
          2500
        </div>
      </div>
    </div>
    <div class="container d-flex flex-row justify-content-between my-4 mx-0 w-100 font-weight-bold"
      style="font-size: 16px;">
      <div>
        총 결제 금액
      </div>
      <div id="final_price">
        
      </div>
      <input type="hidden" name="cart_total_price" value="">
   		<input type="hidden" name="cart_list_idx" value="">
    </div>
    <div class="font-weight-bold w-100 mt-5 text-center mb-5" style="font-size: 16xp;">
      <button type="button" class="btn btn-primary" style="width: 300px; height: 40px;" onclick="listingGoods();">주문하기</button>
      </div>
      
  </main>
  </c:if>
  <c:if test="${ cart == 0 }">
    <!--장바구니 비어있는-->
    <div class="d-flex justify-content-center mb-0">
      <img src="/img/icon/bag.png" alt="" class="img-fluid " width="300px" height="300px">
    </div>
    <div class="font-weight-bold mb-5" style="font-size: 26px;">
      장바구니가 비었습니다.
    </div>
    <div class="d-flex flex-row justify-content-center mb-5 w-100">
      <a href="goodsList"><input type="button" class="btn btn-primary rounded-pill" value="상품보러가기"></a>
    </div>
  </c:if>
  </div>
	

    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import> 
</div>

<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
<script>
/* 전체선택 */
    function selectAll(selectAll)  {
  const checkboxes 
     = document.querySelectorAll('input[type="checkbox"]');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
};
/* 가격계산 */
    window.onlode = calculateTotalPrice();

 </script>
</body>
</html>