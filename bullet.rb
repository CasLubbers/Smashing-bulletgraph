last = 0
current = 0



SCHEDULER.every '1m' do
  last     = current
  current = rand(0..10)
  data = [{ current: current,
            last: last,
            title: "Productivity",
            range: [0, 10],
            lineColor: 'black',
            thresholdValue: 8,
            badRange: [0, 5],
            badRangeColor: 'gray',
            mediumRange: [5,7],
            mediumRangeColor: 'lightgray',
            goodRange: [7,10],
            goodRangeColor: 'white',
            barColor: 'black'},
          { current: last,
            last: current,
            title: "Productivity",
            range: [0, 10],
            lineColor: 'black',
            thresholdValue: 8,
            badRange: [0, 5],
            badRangeColor: 'gray',
            mediumRange: [5,7],
            mediumRangeColor: 'lightgray',
            goodRange: [7,10],
            goodRangeColor: 'white',
            barColor: 'black'},
          { current: rand(0..10),
            last: last,
            title: "Productivity",
            range: [0, 10],
            lineColor: 'black',
            thresholdValue: 8,
            badRange: [0, 5],
            badRangeColor: 'gray',
            mediumRange: [5,7],
            mediumRangeColor: 'lightgray',
            goodRange: [7,10],
            goodRangeColor: 'white',
            barColor: 'black'}]
  send_event('bullet', {dataset: data})
end
