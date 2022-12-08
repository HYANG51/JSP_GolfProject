<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   main{
      min-height: 400px;
   }
   table {
      margin: auto;
      max-width: 600px;
   }
</style>
</head>

<body class="d-flex h-100 text-center text-bg-dark">
   <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
      <main class="px-3 container">
         <form action="golf_regist.do" method="post">
            <table class="table table-dark table-striped">
               <tr>
                  <th>수강월</th>
                  <td>
                     <div class="input-group mb-3">
                        <input type="number" class="form-control" name="regist_month" aria-label="Recipient's username" aria-describedby="basic-addon2" required> 
                        <span class="input-group-text" id="basic-addon2">2022년03월 예) 202203</span>
                     </div>
                  </td>
               </tr>
               <tr>
                  <th>회원명</th>
                  <td>
                     <div class="input-group mb-3">
                        <select class="form-select"   name="c_name" aria-label="Default select example" required>
                              <option value="">회원명</option>
                              <option value="홍길동">홍길동</option>
                              <option value="장발장">장발장</option>
                              <option value="임꺽정">임꺽정</option>
                              <option value="성춘향">성춘향</option>
                              <option value="이몽룡">이몽룡</option>
                        </select>
                     </div>
                  </td>
               </tr>
               <tr>
                  <th>회원번호</th>
                  <td>
                     <div class="input-group mb-3">
                        <input type="number" class="form-control" name="c_no" aria-label="Recipient's username" aria-describedby="basic-addon2" required> 
                        <span class="input-group-text" id="basic-addon2">예) 10001</span>
                     </div>
                  </td>
               </tr>
               <tr>
                  <th>강의장소</th>
                  <td>
                     <div class="input-group mb-3">
                        <select class="form-select"   name="class_area" aria-label="Default select example" required>
                              <option value="">강의장소</option>
                              <option value="서울본원">서울본원</option>
                              <option value="성남분원">성남분원</option>
                              <option value="대전분원">대전분원</option>
                              <option value="부산분원">부산분원</option>
                              <option value="대구분원">대구분원</option>
                        </select>
                     </div>
                  </td>
               </tr>
               <tr>
                  <th>강의명</th>
                  <td>
                     <div class="input-group mb-3">
                        <select class="form-select"   name="class_name" aria-label="Default select example" required>
                              <option value="">강의명</option>
                              <option value="100">초급반</option>
                              <option value="200">중급반</option>
                              <option value="300">고급반</option>
                              <option value="400">심화반</option>
                        </select>
                     </div>
                  </td>
               </tr>
               <tr>
                  <th>수강료</th>
                  <td>
                     <div class="input-group mb-3">
                        <input type="number" class="form-control" name="tuition" aria-label="Recipient's username" aria-describedby="basic-addon2" required> 
                        <span class="input-group-text" id="basic-addon2">원</span>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td colspan="2">
                     <button type="submit" class="btn btn-light">수강신청</button>
                     <button type="reset" class="btn btn-light ms-3">다시쓰기</button>
                     <a href="homepage.jsp"><button type="button" class="btn btn-light ms-3">홈으로</button></a>
                  </td>
               </tr>
            </table>
         </form>
      </main>
   </div>
</body>
</html>