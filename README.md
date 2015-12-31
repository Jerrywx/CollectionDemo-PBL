# CollectionDemo-PBL
1. Collection 实现简单瀑布流

### 主要方法

```objective-c
方法一、
- prepareLayout
// 描述:Tells the layout object to update the current layout.  >= iOS 6.0
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

```objective-c
方法二、
- collectionViewContentSize
Returns the width and height of the collection view’s contents.   >= iOS 6.0
/*Subclasses must override this method and use it to return the width and height of the collection view’s content. These values represent the width and height of all the content, not just the content that is currently visible. The collection view uses this information to configure its own content size for scrolling purposes.

The default implementation of this method returns CGSizeZero.*/

子类必须重写此方法，并用它来返回集合视图的内容的宽度和高度。
这些值表示的宽度以及所有的内容的高度，不仅当前可见的内容。
集合视图使用该信息来配置它自己的内容大小滚动的目的。

此方法的默认实现返回CGSizeZero。

```

```objective-c
方法三、
- layoutAttributesForElementsInRect:
Returns the layout attributes for all of the cells and views in the specified rectangle.

```
```objective-c
方法四、
- layoutAttributesForItemAtIndexPath:
Returns the layout information for the item at the specified index path.
```
