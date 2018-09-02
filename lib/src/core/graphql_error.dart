/// A location where a [GraphQLError] appears.
class Location {
  /// The line of the error in the query.
  final int line;

  /// The column of the error in the query.
  final int column;

  /// Constructs a [Location] from a JSON map.
  Location.fromJSON(Map data)
      : line = data['line'],
        column = data['column'];

  @override
  String toString() => '{ line: $line, column: $column }';
}

/// A GraphQL error (returned by a GraphQL server).
class GraphQLError {
  /// The message of the error.
  final String message;

  /// Locations where the error appear.
  final List<Location> locations;

  /// The path of the field in error.
  final List<dynamic> path;

  /// Custom error data returned by your GraphQL API server
  final Map<String, dynamic> extensions;

  /// Constructs a [GraphQLError] from a JSON map.
  GraphQLError.fromJSON(Map<String, dynamic> data)
      : message = data['message'],
        locations = data['locations'] is List
            ? List.from((data['locations']).map((d) => Location.fromJSON(d)))
            : null,
        path = data['path'],
        extensions = data['extensions'];

  @override
  String toString() =>
      '$message: ${locations is List ? locations.map((l) => '[${l.toString()}]').join('') : ""}';
}