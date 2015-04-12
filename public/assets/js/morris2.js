var Script = function () {

    //morris chart

    $(function () {
      // data stolen from http://howmanyleft.co.uk/vehicle/jaguar_'e'_type
      var tax_data = [
           {"period": "2015 Q3", "validas": 3407, "problematicas": 660},
           {"period": "2015 Q2", "validas": 3351, "problematicas": 629},
           {"period": "2015 Q1", "validas": 3269, "problematicas": 618},
           {"period": "2014 Q4", "validas": 3246, "problematicas": 661},
           {"period": "2014 Q3", "validas": 3171, "problematicas": 676},
           {"period": "2014 Q2", "validas": 3155, "problematicas": 681},
           {"period": "2014 Q1", "validas": 3226, "problematicas": 620},
           {"period": "2013 Q4", "validas": 3245, "problematicas": 430},
           {"period": "2013 Q3", "validas": 3289, "problematicas": 210}
      ];
      Morris.Line({
        element: 'hero-graph',
        data: tax_data,
        xkey: 'period',
        ykeys: ['validas', 'problematicas'],
        labels: ['Válidas', 'Problemáticas'],
        lineColors:['#4ECDC4','#ed5565']
      });

      Morris.Donut({
        element: 'hero-donut',
        data: [
          {label: '30 dias', value: 45 },
          {label: '60 dias', value: 25 },
          {label: '90 dias', value: 20 },
          {label: '120 dias', value: 10 }
        ],
          colors: ['#3498db', '#2980b9', '#34495e'],
        formatter: function (y) { return y + "%" }
      });

      Morris.Area({
        element: 'hero-area',
        data: [
          {period: '2013 Q1', total: 2666, cartao: null, antecipado: 2647},
          {period: '2013 Q2', total: 2778, cartao: 2294, antecipado: 2441},
          {period: '2013 Q3', total: 4912, cartao: 1969, antecipado: 2501},
          {period: '2013 Q4', total: 3767, cartao: 3597, antecipado: 5689},
          {period: '2014 Q1', total: 6810, cartao: 1914, antecipado: 2293},
          {period: '2014 Q2', total: 5670, cartao: 4293, antecipado: 1881},
          {period: '2014 Q3', total: 4820, cartao: 3795, antecipado: 1588},
          {period: '2014 Q4', total: 15073, cartao: 5967, antecipado: 5175},
          {period: '2015 Q1', total: 10687, cartao: 4460, antecipado: 2028},
          {period: '2015 Q2', total: 8432, cartao: 5713, antecipado: 1791}
        ],

          xkey: 'period',
          ykeys: ['total', 'cartao', 'antecipado'],
          labels: ['Receita Total', 'Cartão de Crédito', 'Antecipado'],
          hideHover: 'auto',
          lineWidth: 1,
          pointSize: 5,
          lineColors: ['#4a8bc2', '#ff6c60', '#a9d86e'],
          fillOpacity: 0.5,
          smooth: true
      });

      Morris.Bar({
        element: 'hero-bar',
        data: [
          {device: '30', geekbench: 31336},
          {device: '60', geekbench: 21227},
          {device: '90', geekbench: 19983},
          {device: '120', geekbench: 9580},
          {device: '150', geekbench: 5355},
          {device: '180', geekbench: 2135}
        ],
        xkey: 'device',
        ykeys: ['geekbench'],
        labels: ['Mil Reais'],
        barRatio: 0.4,
        xLabelAngle: 35,
        hideHover: 'auto',
        barColors: ['#ac92ec']
      });

      new Morris.Line({
        element: 'examplefirst',
        xkey: 'year',
        ykeys: ['value'],
        labels: ['Value'],
        data: [
          {year: '2008', value: 20},
          {year: '2009', value: 10},
          {year: '2010', value: 5},
          {year: '2011', value: 5},
          {year: '2012', value: 20}
        ]
      });

      $('.code-example').each(function (index, el) {
        eval($(el).text());
      });
    });

}();




