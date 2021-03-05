///
/// 页面跳转数据封装类
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/4 6:13 PM
///
class Bundle {
  Map<String, dynamic> _map = {};

  _setValue(var k, var v) => _map[k] = v;

  _getValue(String k) {
    if (_map.containsKey(k)) {
      throw Exception("你需要查找的key:$k不存在,请检查或确认key。");
    }

    return _map[k];
  }

  putInt(String k, int v) => _setValue(k, v);

  putDouble(String k, double v) => _setValue(k, v);

  putBool(String k, bool v) => _setValue(k, v);

  putString(String k, bool v) => _setValue(k, v);

  putList<V>(String k, List<V> v) => _setValue(k, v);

  putMap<K, V>(String k, Map<K, V> v) => _setValue(k, v);

  int getInt(String k) => _getValue(k) as int;

  double getDouble(String k) => _getValue(k) as double;

  bool getBool(String k) => _getValue(k) as bool;

  String getString(String k) => _getValue(k) as String;

  List getList<V>(String k) => _getValue(k) as List<V>;

  Map getMap<K, V>(String k) => _getValue(k) as Map<K, V>;

  @override
  String toString() {
    return 'Bundle{_map: $_map}';
  }


  String toRouterParams(){
    String params = '';

    return params;
  }
}
