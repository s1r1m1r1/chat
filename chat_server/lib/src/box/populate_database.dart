import 'package:chat_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

Future<void> populateDatabase(Serverpod pod) async {
  // Create a session so that we can access the database.
  var session = await pod.createSession();

  // var instances = await Environment.db.count(session);
  // if (instances != 0) {
  //   // There are already entries in the database, whe shouldn't add them again.
  //   await session.close();
  //   return;
  // }
  // await Environment.db
  //     .insertRow(session, Environment(name: 'dev', active: true));
  // await Environment.db
  //     .insertRow(session, Environment(name: 'server1', active: true));
  // await Environment.db
  //     .insertRow(session, Environment(name: 'server2', active: true));

  // Make sure to close the session when we are done, or it will hold up
  // resources.
  await session.close();
}
