# Smashing-bulletgraph
Bulletgraph widget for Smashing dashboard
## Preview

![Bulletgraph](https://github.com/CasLubbers/Smashing-bulletgraph/blob/master/Bulletgraph%20Preview.png)

## Description
Inspired by the [Bullet Graphs](https://en.wikipedia.org/wiki/Bullet_graph) from Stephen Few  
Simple [Smashing](https://smashing.github.io/) widget (and associated job) to render Bullet graphs. Uses [Plotly.js](https://plot.ly/javascript/bullet-charts/) library.

## Dependencies

Copy
```erb
<script src="https://cdn.plot.ly/plotly-1.49.0.min.js"></script>
```
in to the `layout.erb` header

## Usage

Create the directory `widgets/bulletgraph` and copy this widget's files
into that folder.

Add the following code on the desired dashboard:

```erb
<li data-row="1" data-col="1" data-sizex="2" data-sizey="1">
  <div data-id="bullet" data-title="Bullet charts" data-view="Bulletgraph"></div>
</li>
```

Create your bullet graph job `bullet.rb` in the `jobs/` directory:

```ruby
# Notes: 
- Change this Job to obtain your graph data from some external source.
- The widget renders max three bulletgraphs, it can be less depending on the size of the dataset.

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
```

## License

This widget is released under the [MIT License](http://www.opensource.org/licenses/MIT).
