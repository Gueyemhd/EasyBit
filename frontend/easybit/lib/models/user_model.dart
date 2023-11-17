import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'easybit_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE users(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, username TEXT email TEXT, password TEXT, confirmPassword TEXT)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  // Define a function that inserts users into the database
  Future<void> createUser(User user) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the user into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same user is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<User>> users() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('users');

    // Convert the List<Map<String, dynamic> into a List<User>.
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'] as int,
        firstname: maps[i]['firstname'] as String,
        lastname: maps[i]['lastname'] as String,
        username: maps[i]['username'] as String,
        email: maps[i]['email'] as String,
        password: maps[i]['password'] as String,
        confirmPassword: maps[i]['confirmPassword'] as String,
      );
    });
  }

  Future<void> updateUser(User user) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'users',
      user.toMap(),
      // Ensure that the User has a matching id.
      where: 'id = ?',
      // Pass the User's id as a whereArg to prevent SQL injection.
      whereArgs: [user.id],
    );
  }

  Future<void> deleteUser(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'users',
      // Use a `where` clause to delete a specific user.
      where: 'id = ?',
      // Pass the User's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  // Create a User and add it to the users table
  var moi = const User(
    id: 00,
    firstname: 'Assurance',
    lastname: 'Kakiang',
    username: 'AssuKakiang',
    email: 'assukakiang@gmail.com',
    password: '##77,;?',
    confirmPassword: '##77,;?',
  );

  await createUser(moi);

  // Now, use the method above to retrieve all the users.
  print(await users()); // Prints a list that include moi.

  // Update moi's username and save it to the database.
  moi = User(
    id: moi.id,
    firstname: moi.firstname,
    lastname: moi.lastname,
    username: 'Kassu',
    email: moi.email,
    password: moi.password,
    confirmPassword: moi.confirmPassword,
  );
  await updateUser(moi);

  // Print the updated results.
  print(await users()); // Prints moi with username Kassu

  // Delete moi from the database.
  await deleteUser(moi.id);

  // Print the list of users (empty).
  print(await users());
}

class User {
  final int id;
  final String firstname;
  final String lastname;
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  const User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  // Convert a User into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'prenom': firstname,
      'nom': lastname,
      'username': username,
      'adresse_mail': email,
      'mot_de_passe': password,
      'confirmation': confirmPassword
    };
  }

  // Implement toString to make it easier to see information about
  // each user when using the print statement.
  @override
  String toString() {
    return 'User{id: $id, firstname: $firstname, lastname: $lastname, username: $username, email: $username, email: $email, password: $password, confirmPassword: $confirmPassword}';
  }
}
