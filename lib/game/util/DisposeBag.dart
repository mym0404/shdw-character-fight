import '../../export.dart';

mixin DisposeBag on Component {
  final List<StreamSubscription<dynamic>> _subscriptions = [];

  void listenStream<T>(Stream<T> stream, void Function(T) listener) {
    var subscription = stream.listen((event) {
      listener(event);
    });
    _subscriptions.add(subscription);
  }

  @override
  void onRemove() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
    super.onRemove();
  }
}
