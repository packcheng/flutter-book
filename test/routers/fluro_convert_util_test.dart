import 'package:flutter_book/routers/fluro_convert_util.dart';
import 'package:test/test.dart';

///
/// 测试[FluroConvertUtil]
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/5 6:37 PM
///

void main() {
  test('中文编解码测试', () {
    String srcStr = '{name=你好，hello&age=18}';
    String encode = FluroConvertUtil.fluroCnParamsEncode(srcStr);
    print("encode: $encode");
    String decode = FluroConvertUtil.fluroCnParamsDecode(encode);
    print("decode: $decode");
  });
}
