<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>

<c:import url="../header.jsp"></c:import>

 <!-- container -->
    <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center postion-relative px-0" style="max-width: 520px;">
        <!-- 팝업창 -->
        <div class="container-sm container-fluid col-11  d-flex flex-column  align-items-center bg-white border border-dark-50 rounded"style="position-absolute; top: 78px; left:10px; height:440px; width:340px;" >
            <div class="d-flex w-100 flex-row justify-content-end pt-2">
                
                <!-- 취소버튼 -->
                <div class="col-1  mr-3" onclick="location.href='memberlist'" style="cursor: pointer;">
                <img src="/img/icon/cross.png" alt="취소" style="width: 30px; height: 30px;">
            </div>    
            </div>
                  
              
               <!-- main -->
               <div class="w-100 d-flex flex-column jusfity-content-center align-items-center px-3 mb-2">
                <div class="w-auto text-center font-weight-bold text-dark mt-1 mb-4" style="font-size: 16px;">
                       회원정보 상세조회
                </div>  
               </div>
              
               <form action="userSearchAction" name="userSearchForm" class="d-flex flex-column  ">
                
                <!-- 이름 -->
                <div class="m-2 col-12 font-weight-bold form-group text-dark d-flex flex-row justify-content-between">
                    이름
                <div class="pl-5">
                <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck " placeholder="홍길동" style="font-size: 14px;" disabled>
                </div>
                </div>
                
                <!-- 아이디 -->
                <div class="m-2 col-12 font-weight-bold form-group text-dark d-flex flex-row justify-content-between">
                    아이디
                <div class="pl-4">
                <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck " placeholder="HONG" style="font-size: 14px;" disabled>
                </div>
                </div>
                
                <!-- 비밀번호 -->
                <div class="m-2 col-12 font-weight-bold form-group text-dark d-flex flex-row justify-content-between">
                    비밀번호
                <div class="pl-3">
                <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck " placeholder="1234" style="font-size: 14px;" disabled>
                </div>
                </div>
                
                <!-- 이메일 -->
                <div class="m-2 col-12 font-weight-bold form-group text-dark d-flex flex-row justify-content-between">
                    이메일
                <div class="pl-4"> 
                <input type="email" class="form-control col-12 rounded font-weight-nomal nullcheck " placeholder="test.gmail.com" style="font-size: 14px;" disabled>
                </div>
                </div>
                
                <!-- 전화번호 -->
                <div class="m-2 col-12 font-weight-bold form-group text-dark d-flex flex-row justify-content-between">
                    전화번호
                <div class="pl-3">
                <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck " placeholder="010-0000-0000" style="font-size: 14px;" disabled>
                </div>
                </div>
                
                <!-- 주소 -->
                <div class="m-2 col-12 font-weight-bold form-group text-dark d-flex flex-row justify-content-between">
                    주소
                <div class="pl-5">
                <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck " placeholder="회원주소" style="font-size: 14px;" disabled>
                </div>
                </div>

                 <!-- 버튼 -->
               
                 <div  class="mt-5 mb-3 align-items-center text-center" >
                    <button type="submit" class="btn btn-dark text-light form-control" style="width: 140px; ">작성</button>
          
                  </div>
            
            </form>
               
    
    
      <!--팝업창 div  -->         
        </div>



<!-- 레퍼런스 div -->
    </div>

    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>


<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
</body>
</html>