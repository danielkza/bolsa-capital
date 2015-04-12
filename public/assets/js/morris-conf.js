var Script = function () {

    //morris chart

    $(function () {
      // data stolen from http://howmanyleft.co.uk/vehicle/jaguar_'e'_type
      var tax_data = [
           {"period": "2011 Q3", "licensed": 3407, "sorned": 660},
           {"period": "2011 Q2", "licensed": 3351, "sorned": 629},
           {"period": "2011 Q1", "licensed": 3269, "sorned": 618},
           {"period": "2010 Q4", "licensed": 3246, "sorned": 661},
           {"period": "2009 Q4", "licensed": 3171, "sorned": 676},
           {"period": "2008 Q4", "licensed": 3155, "sorned": 681},
           {"period": "2007 Q4", "licensed": 3226, "sorned": 620},
           {"period": "2006 Q4", "licensed": 3245, "sorned": null},
           {"period": "2005 Q4", "licensed": 3289, "sorned": null}
      ];
      

     

      Morris.Area({
        element: 'hero-area',
        data: [
          {period: '2013 Q1', total: 2666, ofertado: null, antecipado: 2647},
          {period: '2013 Q2', total: 2778, ofertado: 2294, antecipado: 2441},
          {period: '2013 Q3', total: 4912, ofertado: 1969, antecipado: 2501},
          {period: '2013 Q4', total: 3767, ofertado: 3597, antecipado: 5689},
          {period: '2014 Q1', total: 6810, ofertado: 1914, antecipado: 2293},
          {period: '2014 Q2', total: 5670, ofertado: 4293, antecipado: 1881},
          {period: '2014 Q3', total: 4820, ofertado: 3795, antecipado: 1588},
          {period: '2014 Q4', total: 15073, ofertado: 5967, antecipado: 5175},
          {period: '2015 Q1', total: 10687, ofertado: 4460, antecipado: 2028},
          {period: '2015 Q2', total: 8432, ofertado: 5713, antecipado: 1791}
        ],

          xkey: 'period',
          ykeys: ['total', 'ofertado', 'antecipado'],
          labels: ['Total', 'Ofertado', 'Antecipado'],
          hideHover: 'auto',
          lineWidth: 1,
          pointSize: 5,
          lineColors: ['#4a8bc2', '#ff6c60', '#a9d86e'],
          fillOpacity: 0.5,
          smooth: true
      });

      
      

      $('.code-example').each(function (index, el) {
        eval($(el).text());
      });
    });

}();




