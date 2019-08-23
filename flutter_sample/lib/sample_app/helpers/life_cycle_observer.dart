import 'package:native_widgets/native_widgets.dart';

class LifeCycleObserver with WidgetsBindingObserver {

  factory LifeCycleObserver() => _sharedInstance();
  static LifeCycleObserver get instance => _sharedInstance();
  static LifeCycleObserver _instance;

  LifeCycleObserver.internal();

  static LifeCycleObserver _sharedInstance() {
    if (_instance == null) {
      _instance = LifeCycleObserver.internal();
    }
    return _instance;
  }

  startObserver() {
      WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print('LifeCycleState:$state');

    if (state == AppLifecycleState.resumed) {
    }
  }
}