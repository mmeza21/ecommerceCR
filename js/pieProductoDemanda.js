      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Muebles', 'Preferencias'],
          <?php
            while($fila = $res->fetch_assoc()){
                echo "['".$fila["nombre"]."',   ".$fila["SUM(subtotal)"]."],";
            }
            
        ?>      
       
        ]);

        var options = {
          title: 'Producto de mayor demanda',
            is3D:true
            
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
