# docker-tensorflow-notebook-iruby

* Everything in [Scipy Notebook](https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook)
* Tensorflow and Keras for Python 3.x (without GPU support)
* IRuby Notebook environment (Ruby 2.5.1)
* [PyCall](https://github.com/mrkn/pycall.rb)
* [mrkn/numpy.rb](https://github.com/mrkn/numpy.rb)
* [mrkn/pandas.rb](https://github.com/mrkn/pandas.rb/)]
* [nyaplot](https://github.com/domitry/nyaplot)
* [rbplotly](https://rubygems.org/gems/rbplotly/versions/0.1.2)
* [SciRuby/daru](https://github.com/SciRuby/daru)
* [daru-plotly](https://github.com/genya0407/daru-plotly)
* [py_d3](https://github.com/ResidentMario/py_d3)

## Basic Use

The following command starts a container with the Notebook server listening for HTTP connections on port 8888 with a randomly generated authentication token configured.

```
docker run --rm -it -v $(pwd):/documents -p 8888:8888 htakeuchi/docker-tensorflow-notebook-iruby
```

## Sample

* [IRuby nyaplot/rbplotly/daru/daru-plotly/pandas](http://nbviewer.jupyter.org/gist/htakeuchi/8b1ce2b37919352b8b94ceca13b35729/IRuby-sample.ipynb)

#### References

* [新しいRuby向けプロットライブラリNyaplot - ほげほげにゃ](http://domitry.hatenablog.jp/entry/2014/08/23/215630)
* [Rubyでシュッとグラフを書く with Jupyter notebook - Qiita](https://qiita.com/genya0407/items/b01f101d2f2725f77374)
* [PyCallを使ってRubyからPythonのライブラリを使い倒す - Qiita](https://qiita.com/mix_dvd/items/d49ed4ff6553f3ace5a7)

## License
MIT

