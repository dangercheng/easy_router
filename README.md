# easy_router
借鉴闲鱼[annotation_route](https://github.com/alibaba-flutter/annotation_route)，作为学习简单的路由映射解析方案，实现路由解析，参数赋值，使用简单。

使用@EasyRoute来注解需要加入Router的page, url作为page的唯一标识，例如
```
@EasyRoute(url: "easy://flutter/pagea")
class PageA extends StatefulWidget {
  final EasyRouteOption routeOption;
  PageA(this.routeOption);

  @override
  _PageAState createState() => _PageAState();
}
```
easy_router会调用page的构造函数并传入EasyRouteOption参数，所以每个page都应该有一个这样的构造函数，如果url有参数，参数会放到EasyRouteOption对象的params属性中，以便page获取。

使用@easyRouter来注解你的router, 这样就会生成router相关的内部逻辑, 例如
```
import 'package:example/route.router.internal.dart';
import 'package:easy_router/route.dart';

@easyRouter
class Router {
    EasyRouterInternal internalImpl = EasyRouterInternalImpl();
    dynamic getPage(String url) {
      EasyRouteResult result = internalImpl.router(url);
      if(result.state == EasyRouterResultState.NOT_FOUND) {
        print("Router error: page not found");
        return null;
      }
      return result.widget;
    } 
}
```
EasyRouterInternalImpl就是最终生成的router实现, 执行命令生成EasyRouterInternalImpl实现
```
flutter packages pub run build_runner build --delete-conflicting-outputs
```
调用router打开url对应的page
```
MaterialButton(
  child: Text('ToPageA'),
  onPressed: (){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Router().getPage('easy://flutter/pagea?parama=a');
        }
      )
    );
  },
),
```

详细使用参看源码example