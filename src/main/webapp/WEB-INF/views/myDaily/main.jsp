<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/kaiadmin/favicon.ico" type="image/x-icon" />

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- FullCalendar -->
    <link href="${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.main.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.main.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/fullcalendar/ko.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js"></script>


		
			<style>
			#calendar{
			   width:60%;
			   margin:20px auto;
			}
			
			  <style>
        .calendar-container {
            margin: 20px;
            padding: 20px;
            border-radius: 10px;
            background-color: #f8f9fa; /* Light background for better contrast */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }


        /* 주말 강조 스타일 */
        .fc-saturday, .fc-sunday {
            background-color: #e9ecef; /* 주말 배경 색상 */
        }

        /* 나의 일정 카드 스타일 */
        .my-schedule {
            margin-top: 20px;
        }

        .schedule-card {
            border: 1px solid #dee2e6;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 15px;
            background-color: #fff;
        }
    </style>
			
			
			
			
			
			
			 <!-- Bootstrap 5 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" />
			    
    <!-- FullCalendar -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/kaiadmin.min.css" />
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
                    <div id='calendar'></div>
                    <div id='popup' style="width:500px; height:600px; display:none; background-color:white; padding:20px; border-radius:14px; border:2px solid #eeeeee"></div>
                </div>
                <!-- page-inner -->
<!--                 ------------------------------------------------------------------------------ -->
            
             
                
                <script type='text/javascript'>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                googleCalendarApiKey: 'AIzaSyDvCs91rtqmDQj-om1W3TVwMn0Z4uoAyJU',
                eventSources: [
                    {
                        googleCalendarId: 'dd70016109c0cb346e3df957330eb4d232a31d31cc70eba29d0754ee944f0c53@group.calendar.google.com',
                        className: '휴가',
                        color: '#be5683',
                        textColor: 'black'
                    },
                    {
                        googleCalendarId: '9cde2b34cb6272fbfa6cd48e555d80413b8e45919e765fcf74d1c358c4b29538@group.calendar.google.com',
                        className: '회의실',
                        color: 'green',
                        textColor: 'black'
                    },
                    {
                        googleCalendarId: 'c2e3e16c8e5f57e8f830b2c1c4bddcdbc8b6670b4e1a1ce0c567db498697c8fe@group.calendar.google.com',
                        className: '연차',
                        color: 'yellow',
                        textColor: 'black'
                    }
                ],
                dayCellDidMount: function(info) {
                    // 주말에 클래스 추가
                    if (info.date.getDay() === 0 || info.date.getDay() === 6) { // 0: 일요일, 6: 토요일
                        info.el.classList.add('fc-saturday');
                    }
                }
            });
            calendar.render();
        });
    </script>
                
 <!--                 ------------------------------------------------------------------------------ -->          
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
