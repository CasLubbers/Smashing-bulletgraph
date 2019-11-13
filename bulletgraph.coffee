class Dashing.Bulletgraph extends Dashing.Widget

  onData: () ->
    # Handle incoming data
    data = @get('dataset')
    settings = []
    upper = 0.3
    i = 0;
    while i < 3
      obj = {
          type: 'indicator'
          mode: 'number+gauge+delta'
          value: data[i].current
          delta: reference: data[i].last
          domain:
            x: [
              0.25
              1
            ]
            y: [
              0.1 + upper * i
              0.3 + upper * i
            ]
          title: text: data[i].title
          gauge:
            shape: 'bullet'
            axis: range: data[i].range
            threshold:
              line:
                color: data[i].lineColor
                width: 2
              thickness: 0.75
              value: data[i].thresholdValue
            steps: [
              {
                range: data[i].badRange
                color: data[i].badRangeColor
              }
              {
                range: data[i].mediumRange
                color: data[i].mediumRangeColor
              }
              {
                range: data[i].goodRange
                color: data[i].goodRangeColor
              }
            ]
            bar: color: data[i].barColor
        }
      i++
      settings.push obj

    layout =
      width: 750
      height: 300
      paper_bgcolor:"#40b2f1"
      margin:
        t: 10
        r: 25
        l: 25
        b: 10

    config =
      responsive: true

    Plotly.newPlot gd, settings, layout, config

