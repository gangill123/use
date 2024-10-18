<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<head>
 <!-- 한글 인코딩 추가 -->
 <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/attendanceMain.css" />
<!--QR 라이브러리  -->

    
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    
    
      <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
      
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
    </style>
    
    
    
    
    
 
    <link
      rel="icon"
      href="${pageContext.request.contextPath }/resources/assets/img/kaiadmin/favicon.ico"
      type="image/x-icon"
    />

    <!-- Fonts and icons -->
    
     
    
    
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
      WebFont.load({
        google: { families: ["Public Sans:300,400,500,600,700"] },
        custom: {
          families: [
            "Font Awesome 5 Solid",
            "Font Awesome 5 Regular",
            "Font Awesome 5 Brands",
            "simple-line-icons",
          ],
          urls: ["${pageContext.request.contextPath }/resources/assets/css/fonts.min.css"],
        },
        active: function () {
          sessionStorage.fonts = true;
        },
      });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/kaiadmin.min.css" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/demo.css" />
  </head>
  <body>
    <div class="wrapper">
      <%@ include file="/resources/assets/inc/sidebar.jsp" %> <!-- sidebar -->
      <div class="main-panel">
        <div class="main-header">
          <%@ include file="/resources/assets/inc/logo_header.jsp" %> <!-- Logo Header -->
          <%@ include file="/resources/assets/inc/navbar.jsp" %> <!-- Navbar Header -->
        </div>
        <div class="container">
          <div class="page-inner">
<!------------------------------------------------------------------------------------------------------------------>
  
 
  <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                 <div class="card-title">근태관리</div>



				<button class="btn1 btn-primary">
					<span class="btn-label"> <i class="fa fa-bookmark"></i>
					</span> 나의 근무 현황
				</button>

				<button class="btn1 btn-primary" data-toggle="modal"
					data-target="#overtimeModal">
					<span class="btn-label"> <i class="fa fa-bookmark"></i>
					</span> 초과 근무 신청서
				</button>

				<button class="btn1 btn-primary">
					<span class="btn-label"> <i class="fa fa-bookmark"></i>
					</span> 교육/출장 신청서
				</button>

					<button class="btn1 btn-primary">
                        <span class="btn-label">
                          <i class="fa fa-bookmark"></i>
                        </span>
                       근태 수정 신청서
                      </button>
                
  
  
<!-- JSP 파일에서 세션 값을 가져오는 부분 --> 
<% String empId = (String) session.getAttribute("emp_id"); %>




<!-- 모달 초과 근무 신청서 -->
<div class="modal fade" id="overtimeModal" tabindex="-1" role="dialog" aria-labelledby="overtimeModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="overtimeModalLabel">초과 근무 신청서</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="overtimeForm">
                    <div class="form-group">
                        <label for="emp_id">사원 ID</label>
                        <input type="text" class="form-control" id="emp_id" name="emp_id" value="<%= empId %>" readonly>
            			</div>
					<div class="form-group">
						<label for="created_at">신청 날짜 및 시간:</label> <input
							type="text" class="form-control" id="created_at"
							name="created_at" placeholder="yyyy-MM-dd HH:mm:ss"
							value="${createdAt}" required>
					</div>
					<div class="form-group">
						<label for="check_in">출근 시간</label> <input type="text"
							class="form-control" id="check_in" name="check_in"
							placeholder="yyyy-MM-dd HH:mm:ss" required>
					</div>
					<div class="form-group">
						<label for="check_out">퇴근 시간</label> <input type="text"
							class="form-control" id="check_out" name="check_out"
							placeholder="yyyy-MM-dd HH:mm:ss" required>
					</div>
					<div class="form-group">
                        <label for="overtime">초과 시간</label>
                        <input type="number" class="form-control" id="overtime" name="overtime" placeholder="초과 시간을 입력하세요" required>
                    </div>
                    <div class="form-group">
                        <label for="status">상태</label>
                        <select class="form-control" id="status" name="status" required>
                            <option>진행 중</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="modified_reason">신청 이유</label>
                        <textarea class="form-control" id="modified_reason" name="modified_reason" rows="3" placeholder="신청 이유를 입력하세요" required></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="submitOvertimeForm()">제출</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script>
// 서버에 폼 데이터를 제출하는 함수
function submitOvertimeForm() {
    // 폼 요소 가져오기
    const form = document.getElementById('overtimeForm');
    const formData = new FormData(form);

    // FormData를 JSON으로 변환
    const data = {};
    formData.forEach(function(value, key) {
        data[key] = value;
    });

    // AJAX 요청 생성
    fetch('/Attendance/overtimeSubmit', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json', // JSON 형식으로 전송
        },
        body: JSON.stringify(data), // JSON 문자열로 변환
    })
    .then(function(response) {
        if (response.ok) {
            return response.json(); // 서버에서 JSON 형식으로 응답을 받을 경우
        } else {
            throw new Error('서버 응답에 문제가 있습니다.');
        }
    })
    .then(function(data) {
        // 서버 응답 처리
        alert('초과 근무 신청이 성공적으로 제출되었습니다.');
        
        form.reset(); // 폼 초기화
    })
    .catch(function(error) {
    	alert('초과 근무 신청이 성공적으로 제출되었습니다.');
        $('#overtimeModal').modal('hide'); // 모달 닫기
        form.reset(); // 폼 초기화
    });
}
</script>
  
  
  
  
  
  
  
     
 <div class="attendance-table-container"> <!-- 테이블을 감싸는 div -->
 	<div class="card-header">
                    <div class="card-title">일주일간 나의 근무 현황</div>
                
   <table class="table table-hover" id="attendanceTable">
    <thead>
        <tr>
            <th scope="col">출근 날짜</th>
            <th scope="col">퇴근 날짜</th>
            <th scope="col">근무 상태</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="attendance" items="${attendanceList}">
            <tr>
                <td>
                    <c:if test="${not empty attendance.checkInTime}">
                        <span>${attendance.checkInTime}</span>
                    </c:if>
                </td>  <!-- 출근 날짜 -->
                <td>${attendance.checkOutTime}</td> <!-- 퇴근 날짜 -->
                <td>${attendance.workformStatus}</td> <!-- 근무 상태 -->
            </tr>
        </c:forEach>
        <c:if test="${empty attendanceList}">
            <tr>
                <td colspan="3">근무 기록이 없습니다.</td>
            </tr>
        </c:if>
    </tbody>
</table>
</div>
	  </div>
	
	
	
<div class="bg-white shadow-lg rounded-lg p-8 max-w-lg ">
    <h1 class="text-3xl font-bold mb-6 text-center">사원 정보</h1>
    <div class="flex justify-center mb-6">
        <div class="w-40 h-40 bg-gray-200 rounded-md flex items-center justify-center">
            <span class="text-gray-500">img</span>
        </div>
    </div>
    <div class="space-y-4">
        <div class="flex justify-between">
            <span class="font-semibold">사원번호 :</span>
            <span>${emp_id}</span>
        </div>
        <div class="flex justify-between">
            <span class="font-semibold">직책 :</span>
            <span>Manager</span>
        </div>
        <div class="flex justify-between">
            <span class="font-semibold">부서:</span>
            <span>HR</span>
        </div>
        <div class="flex justify-between">
            <span class="font-semibold">이름:</span>
            <span>홍길동</span>
        </div>
        <div class="flex justify-between">
        <span class="font-semibold">출근 시간:</span>
		    <c:if test="${not empty checkInTime}">        
		        <span>${checkInTime}</span>
		    </c:if>
		</div>
        <div class="flex justify-between">
            <span class="font-semibold">퇴근 시간:</span>
            <span id="checkoutTimeDisplay"></span>
        </div>
        <div class="flex justify-between">
            <span class="font-semibold">근무 시간:</span>
            <span id="workingTimeDisplay"></span>
        </div>
         <div class="flex justify-between">
            <span class="font-semibold">외출 시간:</span>
            <span id="outdoorTimeDisplay"></span>
        </div>
         <div class="flex justify-between">
            <span class="font-semibold">복귀 시간: </span>
            <span id="returnTimeDisplay"></span>
        </div>
        
        
		    <button id="calculateButton" class="btn btn-primary">근무한 시간</button>
		
		
		<!-- 출근 버튼  로그인 구현시 시도해보기 -->    

<%--      <form action="${pageContext.request.contextPath}/Attendance/checkin" method="post"> --%>
<%--         <input type="hidden" name="emp_id" value="${sessionScope.emp_id}" /> <!-- emp_id를 숨겨진 필드로 전달 --> --%>
<!--         <button type="submit">출근</button> -->
<!--     </form> -->


		<button id="checkoutButton" class="btn btn-primary">퇴근</button>
	    <button class="btn btn-primary" onclick="recordOutdoorTime()">외출</button>
	    <button class="btn btn-primary" onclick="recordReturnTime()">복귀</button>
		
		<%
	    // 세션에서 emp_id와 attendance_id를 가져옵니다. 
	    String attendanceId = (String) session.getAttribute("attendance_id");
		%>
			
		
    </div>
</div>
   
  <script>
function recordOutdoorTime() {
    const attendanceData = {
        emp_id: "${sessionScope.emp_id}", // JSP에서 세션 값 사용
        attendance_id: "${sessionScope.attendance_id}", // JSP에서 세션 값 사용
        WorkingOutside_time: new Date().toISOString().slice(0, 19).replace('T', ' '), // 현재 시간
    };

    fetch('outdoor', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(attendanceData),
    })
    .then(response => {
        if (response.ok) {
            const outdoorTime = new Date().toLocaleString(); // 현재 시간을 로컬 포맷으로 가져옴
            document.getElementById('outdoorTimeDisplay').innerText = outdoorTime; // 외출 시간 표시
            alert('외출 시간이 기록되었습니다.');
        } else {
            alert('외출 시간 기록에 실패하였습니다.');
        }
    })
    .catch(error => console.error('Error:', error));
}

function recordReturnTime() {
    const attendanceData = {
        emp_id: "${sessionScope.emp_id}", // JSP에서 세션 값 사용
        attendance_id: "${sessionScope.attendance_id}", // JSP에서 세션 값 사용
        return_time: new Date().toISOString().slice(0, 19).replace('T', ' '), // 현재 시간
    };

    fetch('return', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(attendanceData),
    })
    .then(response => {
        if (response.ok) {
            const returnTime = new Date().toLocaleString(); // 현재 시간을 로컬 포맷으로 가져옴
            document.getElementById('returnTimeDisplay').innerText = returnTime; // 복귀 시간 표시
            alert('복귀 시간이 기록되었습니다.');
        } else {
            alert('복귀 시간 기록에 실패하였습니다.');
        }
    })
    .catch(error => console.error('Error:', error));
}
</script>
















    <!--// 출근 시간 문자열을 Date 객체로 변환
                      var checkInTime = new Date(attendance.check_in);
                      // 한국 시간 (UTC+9)으로 변환 겨우바꿈  -->
      <script>
      
      $(document).ready(function() {
          // 페이지가 로드될 때 출근 기록을 가져오는 AJAX 요청
          $.ajax({
              url: "fetchAttendanceRecords", // 컨트롤러의 메서드 URL
              type: "GET",
              success: function(attendanceList) {
                  // 테이블에 출근 기록 추가
                  var tableBody = $("#attendanceTable tbody");
                  tableBody.empty(); // 기존 데이터 지우기
                  attendanceList.forEach(function(attendance) {
                      // 출근 시간 문자열을 Date 객체로 변환
                      var checkInTime = new Date(attendance.check_in);
                      // 한국 시간 (UTC+9)으로 변환
                      checkInTime.setHours(checkInTime.getHours() + 9);

                      var checkOutTime = attendance.check_out ? new Date(attendance.check_out) : null; // 퇴근 시간이 있을 경우만 변환
                      if (checkOutTime) {
                          checkOutTime.setHours(checkOutTime.getHours() + 9);
                      }

                      var workStatus = determineWorkStatus(checkInTime, checkOutTime); // 근무 상태 결정
                      
                      
                      
                      

                      tableBody.append(
                          "<tr>" +
                          "<td>" + checkInTime.toLocaleString() + "</td>" + // 로컬 시간 형식으로 표시
                          "<td>" + (checkOutTime ? checkOutTime.toLocaleString() : '퇴근하지 않음') + "</td>" + // 퇴근 시간 표시
                          "<td>" + workStatus + "</td>" + // 근무 상태 표시
                          "</tr>"
                      );
                  });
              },
              error: function() {
                  alert("출근 기록을 가져오는 데 실패했습니다.");
              }
          });
      });
      function determineWorkStatus(checkInTime, checkOutTime) {
    	    const nineAM = new Date();
    	    nineAM.setHours(9, 0, 0, 0); // 오전 9시

    	    const tenPM = new Date();
    	    tenPM.setHours(22, 0, 0, 0); // 오후 10시

    	    const sixPM = new Date();
    	    sixPM.setHours(18, 0, 0, 0); // 오후 6시

    	    const nextDaySevenAM = new Date();
    	    nextDaySevenAM.setHours(7, 0, 0, 0);
    	    nextDaySevenAM.setDate(nextDaySevenAM.getDate() + 1); // 다음 날 오전 7시

    	    console.log("checkInTime:", checkInTime);
    	    console.log("checkOutTime:", checkOutTime);

    	    // 출근 시간이 기준 시간에 따라 상태 결정
    	    if (checkInTime > nineAM) {
    	        if (checkOutTime) {
    	            // 야간 근무: 퇴근 시간이 오후 10시 이후 또는 다음 날 오전 7시 이전
    	            if (checkOutTime >= tenPM || checkOutTime < nextDaySevenAM) {
    	                return "야간 근무"; 
    	            } else if (checkOutTime > sixPM) {
    	                return "연장 근무"; // 오후 6시 이후 퇴근
    	            }
    	        }
    	        return "지각"; // 오전 9시 이후 출근
    	    } else {
    	        // 오전 9시 이전에 출근한 경우
    	        if (checkOutTime) {
    	            // 야간 근무: 퇴근 시간이 오후 10시 이후 또는 다음 날 오전 7시 이전
    	            if (checkOutTime >= tenPM || checkOutTime < nextDaySevenAM) {
    	                return "야간 근무"; 
    	            } else if (checkOutTime > sixPM) {
    	                return "연장 근무"; // 오후 6시 이후 퇴근
    	            }
    	        }
    	        return "정상 출근"; // 오전 9시 이전 출근
    	    }
    	}
</script>
    
    
    
    
    
    
    



			<script>
		    $(document).ready(function() {
		        $('#checkoutButton').click(function() {
		            $.ajax({
		                url: '<c:url value="checkOut" />',
		                type: 'GET',
		                success: function(response) {
		                    if (response.status === 'success') {
		                        alert(response.message);
		
		                        // 퇴근 시간이 성공적으로 업데이트되면 현재 시간을 퇴근 시간으로 표시
		                        const now = new Date();
		                        const formattedTime = now.getFullYear() + '-' +
		                            ('0' + (now.getMonth() + 1)).slice(-2) + '-' +
		                            ('0' + now.getDate()).slice(-2) + ' ' +
		                            ('0' + now.getHours()).slice(-2) + ':' +
		                            ('0' + now.getMinutes()).slice(-2) + ':' +
		                            ('0' + now.getSeconds()).slice(-2);
		                        
		                        $('#checkoutTimeDisplay').text('' + formattedTime);
		                    } else {
		                        alert(response.message);
		                    }
		                },
		                error: function() {
		                    alert('퇴근 요청 중 오류가 발생했습니다.');
		                }
		            });
		        });
		    });
		    </script>
		    <script>
		    $(document).ready(function() {
		        $('#calculateButton').click(function() {
		            $.ajax({
		                url: '<c:url value="calculateWorkingTime" />',
		                type: 'GET',
		                success: function(response) {
		                    alert(response.message);
		                    // 계산된 근무 시간을 페이지에 표시
		                    $('#workingTimeDisplay').text('총 근무 시간: ' + formatWorkingTime(response.workingTime));
		                },
		                error: function() {
		                    alert('근무 시간 계산 중 오류가 발생했습니다.');
		                }
		            });
		        });
		    });

		    // 근무 시간을 hh:mm 형식으로 변환하는 함수
		    function formatWorkingTime(totalMinutes) {
		        var hours = Math.floor(totalMinutes / 60); // 시간 계산
		        var minutes = totalMinutes % 60; // 남은 분 계산
		        // 2자리 숫자 형식으로 변환
		        return (hours < 10 ? '0' : '') + hours + ':' + (minutes < 10 ? '0' : '') + minutes;
		    }
</script>
		   
		<!-- 출퇴근   -->
		
		
<script>
        // 퇴근 버튼 클릭 시 유효성 검증
        $('#checkoutButton').click(function() {
            // 출근 기록이 있는지 확인
            const checkinTime = $('#checkinTimeDisplay').text();
            if (!checkinTime) {
                alert('출근 기록이 없어 퇴근할 수 없습니다.');
                return; // 퇴근 요청을 중단합니다.
            }

            if (confirm('퇴근하시겠습니까?')) {
                $.ajax({
                    url: '<c:url value="checkOut" />',
                    type: 'GET',
                    success: function(response) {
                        if (response.status === 'success') {
                            alert('퇴근 처리가 완료되었습니다.');
                            $('#checkoutTimeDisplay').text('퇴근 시간: ' + response.checkOutTime);
                        } else {
                            alert(response.message);
                        }
                    },
                    error: function() {
                        alert('퇴근 요청 중 오류가 발생했습니다.');
                    }
                });
            }
        });
    );
</script>

  


                    



   </div>
                  <div class="card-body">
                    

<!------------------------------------------------------------------------------------------------------------------>
          </div>
          <!-- page-inner -->
        </div>
		<!-- container -->
        <%@ include file="/resources/assets/inc/footer.jsp" %>
      </div>
      <!-- main-panel -->
    </div>
    <!-- main-wrapper -->
    

    
    <!--   Core JS Files   -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/core/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

    <!-- Chart JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/chart.js/chart.min.js"></script>

    <!-- jQuery Sparkline -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

    <!-- Chart Circle -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/chart-circle/circles.min.js"></script>

    <!-- Datatables -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/datatables/datatables.min.js"></script>

    <!-- Bootstrap Notify -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

    <!-- jQuery Vector Maps -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/jsvectormap/world.js"></script>

    <!-- Sweet Alert -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

    <!-- Kaiadmin JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/kaiadmin.min.js"></script>

    <!-- Kaiadmin DEMO methods, don't include it in your project! -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/setting-demo.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/demo.js"></script>
    <script>
      $("#lineChart").sparkline([102, 109, 120, 99, 110, 105, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#177dff",
        fillColor: "rgba(23, 125, 255, 0.14)",
      });

      $("#lineChart2").sparkline([99, 125, 122, 105, 110, 124, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#f3545d",
        fillColor: "rgba(243, 84, 93, .14)",
      });

      $("#lineChart3").sparkline([105, 103, 123, 100, 95, 105, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#ffa534",
        fillColor: "rgba(255, 165, 52, .14)",
      });
    </script>
  </body>
</html>
