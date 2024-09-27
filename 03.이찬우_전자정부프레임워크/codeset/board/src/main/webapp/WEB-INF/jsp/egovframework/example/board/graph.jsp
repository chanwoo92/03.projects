<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width--device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/bootstrap/css/bootstrap.min.css">
        <script src="/js/jquery-3.5.1.min.js"></script>
        <script src="/css/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
          google.charts.load('current', {'packages':['corechart']});
          google.charts.setOnLoadCallback(drawChart);

          let num1 = [];
          let num2 = [];
          let num3 = [];
          for(let i=0; i<10; i++) {
            num1[i] = (Math.floor(Math.random() * 11))*3;
            num2[i] = (Math.floor(Math.random() * 11))*3;
            num3[i] = (Math.floor(Math.random() * 11))*3;
          }
          function drawChart() {
            var data = google.visualization.arrayToDataTable([
              ['Time', 'LEE', 'PARK', 'KIM'],
              ['1',  num1[0], num2[0], num3[0]],
              ['2', num1[1], num2[1], num3[1]],
              ['3', num1[2], num2[2], num3[2]],
              ['4', num1[3], num2[3], num3[3]],
              ['5', num1[4], num2[4], num3[4]],
              ['6', num1[5], num2[5], num3[5]],
              ['7', num1[6], num2[6], num3[6]],
              ['8', num1[7], num2[7], num3[7]],
              ['9', num1[8], num2[8], num3[8]],
              ['10', num1[9], num2[9], num3[9]]
            ]);

            var options = {
              title: 'PROGRESS',
              curveType: 'function',
              legend: { position: 'bottom' }
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

            chart.draw(data, options);
          }
          document.addEventListener('DOMContentLoaded', () => {
        	    const projects = [
        	        { name: '프로젝트 A', progress: 80 },
        	        { name: '프로젝트 B', progress: 50 },
        	        { name: '프로젝트 C', progress: 30 }
        	    ];

        	    const projectList = document.getElementById('project-list');
        	    projects.forEach(project => {
        	        const li = document.createElement('li');
        	        li.textContent = `${project.name} - ${project.progress}%`;
        	        projectList.appendChild(li);
        	    });

        	    const progressBar = document.getElementById('progress-bar');
        	    const overallProgress = projects.reduce((sum, project) => sum + project.progress, 0) / projects.length;
        	    progressBar.style.width = `${overallProgress}%`;
        	});
        </script>
</head>
<body>
<section id="my-projects">
            <h1>나의 프로젝트</h1>
            <ul id="project-list">
                <!-- 프로젝트 목록이 여기에 동적으로 추가됩니다. -->
            </ul>
        </section>
        <section id="overall-progress">
            <h2>달성율</h2>
            <div id="progress-bar">
                <!-- 달성율 막대가 여기에 표시됩니다. -->
            </div>
        </section>
        <section id="team-progress">
            <h2>팀원별 달성율</h2>
            <div id="team-progress-chart">
                <!-- 팀원별 달성율 차트가 여기에 표시됩니다. -->
            </div>
        </section>
        <section id="statistics">
            <h2>그래프</h2>
            <div id="statistics-charts">
                <!-- 통계 그래프가 여기에 표시됩니다. -->
            </div>
        </section>
  <div id="curve_chart" style="width: 1200px; height: 500px"></div>
  </body>
</html>