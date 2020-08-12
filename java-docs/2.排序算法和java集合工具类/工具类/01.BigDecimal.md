1.不推荐使用BigDecimal(double val)g构造器，因为使用该构造器时有一定的不可预知
性，当程序使用new BigDecimal(0.1)创建一个BigDecimal对象时，它的值并不是0.1,实
际上是一个近似0.1的数。

2.建议优先使用基于String的构造器，使用BigDecimal(String val)构造器时可以预知
的，写入new BigDecimal("0.1")将创建一个恰好等于0.1的BigDecimal。

3.如果必须使用double浮点数作为BigDecimal构造器的参数时，不要使用double作为参
数，而应该通过BigDecimal.valueOf(double value)静态方法创建对象。