class TableColumsAndArgs {
  final String columnName;
  final List<String> dataTypeAndConstraints;
  TableColumsAndArgs(this.columnName, this.dataTypeAndConstraints);

  @override
  String toString() {
    StringBuffer sb = StringBuffer(columnName);
    for (var s in dataTypeAndConstraints) {
      sb.write(" $s");
    }
    return sb.toString();
  }
}
