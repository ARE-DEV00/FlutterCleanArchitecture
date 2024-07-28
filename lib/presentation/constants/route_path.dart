enum RoutePath {
  home(''),
  sub01('sub01'),
  sub02('sub02/:id'),;


  final String path;

  const RoutePath(this.path);

  String get fullPath => '/$path';

  @override
  String toString() => fullPath;
}
