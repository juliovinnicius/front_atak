abstract class FailureSearch implements Exception {}

class InvalidSearchError implements FailureSearch {}

class DataSourceError implements FailureSearch {}

class SearchError implements FailureSearch {}
