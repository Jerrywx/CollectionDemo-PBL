# CollectionDemo-PBL
1. Collection 实现简单瀑布流

### 主要方法

```objective-c
- prepareLayout
// 描述:Tells the layout object to update the current layout.  >= iOS6.0
// 声明
- (void)prepareLayout

/*Discussion
Layout updates occur the first time the collection view presents its content and whenever the layout is invalidated explicitly or implicitly because of a change to the view. During each layout update, the collection view calls this method first to give your layout object a chance to prepare for the upcoming layout operation.

The default implementation of this method does nothing. Subclasses can override it and use it to set up data structures or perform any initial computations needed to perform the layout later.*/
每当Collection view 的内容被更新时布局会更新。当view改变时,布局废弃或失效。
每当刷新数据时, Collection首先调用这个方法传递给layout对象一个变化，为新布局做准备
此方法的默认实现不执行任何操作。
子类可以覆盖它，并用它来建立数据结构或执行后进行布局所需要的任何初步计算。

```
